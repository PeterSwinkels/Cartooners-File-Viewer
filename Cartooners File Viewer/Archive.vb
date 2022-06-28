'This class's imports and settings.
Option Compare Binary
Option Explicit On
Option Infer Off
Option Strict On

Imports System
Imports System.Collections.Generic
Imports System.Diagnostics
Imports System.Environment
Imports System.IO
Imports System.Linq
Imports System.Text
Imports System.Windows.Forms

'This class contains the file archive related procedures.
Public Class ArchiveClass
   Inherits DataFileClass

   Private Const BASE_YEAR As Integer = 1980                                  'Defines the earliest possible year for an archived file's time and date.
   Private Const FILE_NAME_LENGTH As Integer = &HD%                           'Defines the maximum length for a file name including terminating null character.
   Private Const HEADER_SIZE As Integer = &H30%                               'Defines the archived file header's size.
   Private ReadOnly ARCHIVED_FILE_PREFIX As New List(Of Byte)({&H1A%, &H45%, &H41%})   'Defines an archived file header's prefix.

   'This enumeration lists the locations of known values in archived file headers.
   Private Enum HeaderLocationsE
      ArchivedSize = &H19%                'The file's archived size.
      CompressedFlag = &H14%              'The file's compressed/uncompressed flag.
      FileDateTime = &H10%                'The file's date and time.
      FileName = &H3%                     'The file's name.
      Prefix = &H0%                       'The file header's prefix.
      UnarchivedSize = &H15%              'The file's unarchived size.
   End Enum

   'This structure defines a archived file.
   Private Structure ArchivedFileStr
      Public ArchivedSize As Integer      'Defines the file's archived size.
      Public CompressedFlag As Boolean    'Defines the file's compressed/uncompressed flag.
      Public Data As List(Of Byte)        'Defines the file's archived data.
      Public FileDateTime As String       'Defines the file's date/time.
      Public FileName As String           'Defines the file's name.
      Public UnarchivedSize As Integer    'Defines the file's unarchived size.
   End Structure

   'This procedure initializes this class.
   Public Sub New(PathO As String, Optional DataFileMenu As ToolStripMenuItem = Nothing)
      Try
         If DataFile(ArchivePath:=PathO).Data.Count > 0 AndAlso DataFileMenu IsNot Nothing Then
            With DataFileMenu
               .DropDownItems.Clear()
               .Text = "&Archive"
               .Visible = True
            End With
         End If
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure manages the archived files.
   Private Function ArchivedFiles(Optional Refresh As Boolean = False) As List(Of ArchivedFileStr)
      Try
         Dim ArchivedFile As New ArchivedFileStr
         Dim Position As Integer = &H0%
         Static CurrentArchivedFiles As New List(Of ArchivedFileStr)

         If Refresh Then
            CurrentArchivedFiles.Clear()

            With DataFile()
               Do Until Position >= .Data.Count
                  If GetBytes(.Data, Position + HeaderLocationsE.Prefix, ARCHIVED_FILE_PREFIX.Count).SequenceEqual(ARCHIVED_FILE_PREFIX) Then
                     ArchivedFile = New ArchivedFileStr
                     ArchivedFile.FileName = GetString(.Data, Position + HeaderLocationsE.FileName, FILE_NAME_LENGTH)
                     ArchivedFile.FileName = TERMINATE_AT_NULL(ArchivedFile.FileName)
                     ArchivedFile.FileDateTime = GetFileDateTime(GetBytes(.Data, Position + HeaderLocationsE.FileDateTime, Count:=&H4%))
                     ArchivedFile.CompressedFlag = CBool(.Data(Position + HeaderLocationsE.CompressedFlag))
                     ArchivedFile.UnarchivedSize = BitConverter.ToInt32(.Data.ToArray(), Position + HeaderLocationsE.UnarchivedSize)
                     ArchivedFile.ArchivedSize = BitConverter.ToInt32(.Data.ToArray(), Position + HeaderLocationsE.ArchivedSize)
                     Position += HEADER_SIZE
                     ArchivedFile.Data = GetBytes(.Data, Position, ArchivedFile.ArchivedSize, AdvanceOffset:=True)
                     CurrentArchivedFiles.Add(ArchivedFile)
                  Else
                     MessageBox.Show($"Invalid archived file at position {Position}.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                     Exit Do
                  End If
               Loop
            End With
         End If

         Return CurrentArchivedFiles
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedures manages the archive's data file.
   Private Function DataFile(Optional ArchivePath As String = Nothing) As DataFileStr
      Try
         Static CurrentFile As New DataFileStr With {.Data = Nothing, .Path = Nothing}

         If Not ArchivePath = Nothing Then
            With CurrentFile
               .Data = New List(Of Byte)(File.ReadAllBytes(ArchivePath))
               .Path = ArchivePath
               If Not .Data.Any Then .Data.Clear()
               ArchivedFiles(Refresh:=True)

               Display()
            End With
         End If

         Return CurrentFile
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure displays the current archive file.
   Private Sub Display()
      Try
         Dim NewText As New StringBuilder

         For Each ArchivedFile As ArchivedFileStr In ArchivedFiles()
            With ArchivedFile
               NewText.Append($"File: { .FileName}{NewLine}")
               NewText.Append($"Date: { .FileDateTime}{NewLine}")
               NewText.Append($"Compressed: { .CompressedFlag}{NewLine}")
               NewText.Append($"Archived size: { .ArchivedSize}{NewLine}")
               NewText.Append($"Unarchived size: { .UnarchivedSize}{NewLine}")
               NewText.Append($"Data:{NewLine}")
               NewText.Append($"{Escape(.Data, " "c, EscapeAll:=True).Trim()}{ NewLine}{ NewLine}")
            End With
         Next ArchivedFile

         UpdateDataBox(NewText.ToString())
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure exports the current archive.
   Public Overloads Sub Export(ExportPath As String)
      Try
         ExportPath = Path.Combine(ExportPath, Path.GetFileNameWithoutExtension(DataFile.Path))
         Directory.CreateDirectory(ExportPath)

         For Each ArchivedFile As ArchivedFileStr In ArchivedFiles()
            With ArchivedFile
               File.WriteAllBytes(Path.Combine(ExportPath, .FileName), If(.CompressedFlag, DecompressLZW(.Data), .Data).ToArray())
            End With
         Next ArchivedFile

         Process.Start(New ProcessStartInfo With {.FileName = ExportPath, .WindowStyle = ProcessWindowStyle.Normal})
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure returns the date and time contained in the specified bytes in DD-MM-YYYY HH:MM:SS format.
   Private Function GetFileDateTime(Bytes As List(Of Byte)) As String
      Try
         Dim Day As Integer = Bytes(&H0%) And &H1F%
         Dim Hour As Integer = Bytes(&H3%) >> &H3%
         Dim Minute As Integer = (Bytes(&H2%) >> &H5%) Or ((Bytes(&H3%) And &H7%) << &H3%)
         Dim Month As Integer = (Bytes(&H0%) >> &H5%) Or ((Bytes(&H1%) And &H1%) << &H4%)
         Dim Second As Integer = (Bytes(&H3%) And &H1F%) * &H2%
         Dim Year As Integer = BASE_YEAR + (Bytes(&H1%) >> &H1%)

         Return String.Format($"{Day:D2}-{Month:D2}-{Year:D4} {Hour:D2}:{Minute:D2}:{Second:D2}")
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function
End Class