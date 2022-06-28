'This class's imports and settings.
Option Compare Binary
Option Explicit On
Option Infer Off
Option Strict On

Imports System
Imports System.Collections.Generic
Imports System.Environment
Imports System.IO
Imports System.Text
Imports System.Windows.Forms

'This class contains the sound card driver related procedures.
Public Class SoundCardDriverClass
   Inherits DataFileClass

   Private ReadOnly DRIVER_FILES As New Dictionary(Of String, String) From
      {{"adtoon.smb", "AD LIB Board"},
      {"cstoon.smb", "CMS Board"},
      {"mttoon.smb", "Roland MT 32 or LAPC Board"}}   'Defines the soundcard driver files.

   'The menu items used by this class.
   Private WithEvents DisplayInformationMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F1, .Text = "Display &Information"}

   'This procedure initializes this class.
   Public Sub New(PathO As String, Optional DataFileMenu As ToolStripMenuItem = Nothing)
      Try
         Dim TextSubMenuItems As New List(Of String)

         If DataFile(SoundcardDriverPath:=PathO).Data.Count > 0 AndAlso DataFileMenu IsNot Nothing Then

            With DataFileMenu
               .DropDownItems.Clear()
               .DropDownItems.AddRange({DisplayInformationMenu})
               .Text = "&Soundcard"
               .Visible = True
            End With
         End If
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedures manages the soundcard driver's data file.
   Private Function DataFile(Optional SoundcardDriverPath As String = Nothing) As DataFileStr
      Try
         Static CurrentFile As New DataFileStr With {.Data = Nothing, .Path = Nothing}

         If Not SoundcardDriverPath = Nothing Then
            With CurrentFile
               .Data = New List(Of Byte)(File.ReadAllBytes(SoundcardDriverPath))
               .Path = SoundcardDriverPath
               If .Data.Count = 0 Then .Data.Clear()

               DisplayInformationMenu.PerformClick()
            End With
         End If

         Return CurrentFile
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure displays the current soundcard driver's information.
   Private Sub DisplayInformationMenu_Click(sender As Object, e As EventArgs) Handles DisplayInformationMenu.Click
      Try
         With New StringBuilder
            .Append($"General information:{NewLine}")
            .Append($"-Path: {DataFile().Path}{NewLine}")
            .Append($"-Soundcard: { DRIVER_FILES(Path.GetFileName(DataFile().Path).ToLower())}{NewLine}{NewLine}")
            .Append($"Data:{NewLine}")
            .Append($"{Escape(DataFile().Data, " "c, EscapeAll:=True).Trim()}{NewLine}{NewLine}")
            UpdateDataBox(.ToString())
         End With
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

End Class