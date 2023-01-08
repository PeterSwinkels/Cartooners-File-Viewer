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
Imports System.Text
Imports System.Windows.Forms

'This class contains the script related procedures.
Public Class ScriptClass
   Inherits DataFileClass

   'This enumeration lists the locations of known values inside a script file.
   Private Enum LocationsE As Integer
      Script = &HA%   'The LZW compressed installation script.
   End Enum

   Private Const HEADER_SIZE As Integer = &HA%   'Defines an installation script's header size.

   'This procedure initializes this class.
   Public Sub New(ByRef PathO As String, Optional DataFileMenu As ToolStripMenuItem = Nothing)
      Try
         If Path.GetExtension(PathO).ToLower() = ".txt" Then PathO = Import(PathO)

         If DataFile(ScriptPath:=PathO).Data.Count > 0 AndAlso DataFileMenu IsNot Nothing Then
            With DataFileMenu
               .DropDownItems.Clear()
               .Text = "&Script"
               .Visible = True
            End With
         End If
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedures manages the installation script's data.
   Private Function DataFile(Optional ScriptPath As String = Nothing) As DataFileStr
      Try
         Static CurrentFile As New DataFileStr With {.Data = Nothing, .Path = Nothing}

         If Not ScriptPath = Nothing Then
            CurrentFile.Path = ScriptPath
            CurrentFile.Data = New List(Of Byte)(File.ReadAllBytes(ScriptPath))

            Display()
         End If

         Return CurrentFile
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure displays the current script file.
   Private Sub Display()
      Try
         Dim NewText As New StringBuilder

         With DataFile()
            NewText.Append(GeneralFileInformation(.Path))
            NewText.Append(NewLine)
            NewText.Append($"Header:{NewLine}")
            NewText.Append(Escape(GetString(.Data, &H0%, HEADER_SIZE), " "c, EscapeAll:=True))
            NewText.Append($"{NewLine}{NewLine}")
            NewText.Append($"Script:{NewLine}")
            NewText.Append(BYTES_TO_TEXT(DecompressLZW(GetBytes(.Data, LocationsE.Script, .Data.Count - LocationsE.Script))))
         End With

         UpdateDataBox(NewText.ToString())
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure exports the current script.
   Public Overloads Sub Export(ExportPath As String)
      Try
         Dim Exported As New StringBuilder($"[{SCRIPT_TEMPLATE}]{NewLine}{NewLine}")

         With DataFile()
            Exported.Append($"[Header]{NewLine}")
            Exported.Append(Escape(GetString(.Data, &H0%, HEADER_SIZE), " "c, EscapeAll:=True))
            Exported.Append($"{NewLine}{NewLine}")
            Exported.Append($"[Code]{NewLine}")
            Exported.Append(BYTES_TO_TEXT(DecompressLZW(GetBytes(.Data, LocationsE.Script, .Data.Count - LocationsE.Script))))

            ExportPath = $"{Path.Combine(ExportPath, Path.GetFileName(.Path))}.txt"

            File.WriteAllText(ExportPath, Exported.ToString())
            Process.Start(New ProcessStartInfo With {.FileName = ExportPath, .WindowStyle = ProcessWindowStyle.Normal})
         End With
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure imports the specified script template.
   Private Function Import(ImportPath As String) As String
      Try
         Dim Data As New List(Of Byte)
         Dim ErrorAt As New Integer
         Dim Header As New List(Of Byte)
         Dim Line As New Integer
         Dim Script As New StringBuilder()
         Dim ScriptFile As String = Path.GetFileNameWithoutExtension(ImportPath)
         Dim Section As String = Nothing
         Dim Sections As New List(Of String)({"[code]", "[header]"})
         Dim Template As New List(Of String)(LoadTemplate())

         Line = 0
         Do While Line < Template.Count
            If Not Template(Line) = Nothing Then
               Section = Template(Line).ToLower()
               Select Case Section
                  Case "[code]"
                     Sections.Remove(Section)
                     Do
                        Line += 1
                        If Line >= Template.Count Then Exit Do
                        Script.Append($"{Template(Line)}{NewLine}")
                     Loop
                  Case "[header]"
                     Sections.Remove(Section)
                     Line += 1
                     Header = TEXT_TO_BYTES(Unescape(Template(Line), EscapeCharacter:=" "c, ErrorAt:=ErrorAt))
                     If ErrorAt > 0 Then
                        MessageBox.Show($"Invalid escape sequence at: {ErrorAt}.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Error)
                     End If

                     If Not Header.Count = HEADER_SIZE Then
                        MessageBox.Show($"Expected header size: {HEADER_SIZE} bytes. Size of specified header: {Header.Count} bytes.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Warning)
                     End If
               End Select
            End If

            Line += 1
         Loop

         With Data
            .AddRange(Header)
            .AddRange(CompressLZW(TEXT_TO_BYTES(Script.ToString())))

            ScriptFile = Path.Combine(Path.GetDirectoryName(ImportPath), ScriptFile)
            If Not Path.GetExtension(ScriptFile).ToLower = ".iea" Then
               ScriptFile = $"{ScriptFile}.iea"
            End If
            File.WriteAllBytes(ScriptFile, .ToArray())
         End With

         If Sections.Count > 0 Then
            MessageBox.Show($"Missing sections:{NewLine}{String.Join(NewLine, Sections.ToArray())}", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Warning)
         End If

         Return ScriptFile
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function
End Class
