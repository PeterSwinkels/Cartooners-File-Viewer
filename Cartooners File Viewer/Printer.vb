'This class's imports and settings.
Option Compare Binary
Option Explicit On
Option Infer Off
Option Strict On

Imports System
Imports System.Collections.Generic
Imports System.Environment
Imports System.IO
Imports System.Linq
Imports System.Text
Imports System.Windows.Forms

'This class contains the printer driver related procedures.
Public Class PrinterDriverClass
   Inherits DataFileClass

   'This enumeration lists the locations of the items inside a printer driver.
   Private Enum LocationsE As Integer
      PrinterModelName = &H4%      'The printer model's name.
   End Enum

   Private Const PRINTER_MODEL_NAME_SPACE As Integer = &H27%   'Defines the space reserved for a printer model's name.

   'The menu items used by this class.
   Private WithEvents DisplayInformationMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F1, .Text = "Display &Information"}

   'This procedure initializes this class.
   Public Sub New(PathO As String, Optional DataFileMenu As ToolStripMenuItem = Nothing)
      Try
         Dim TextSubMenuItems As New List(Of String)

         If DataFile(PrinterDriverPath:=PathO).Data.Count > 0 AndAlso DataFileMenu IsNot Nothing Then

            With DataFileMenu
               .DropDownItems.Clear()
               .DropDownItems.AddRange({DisplayInformationMenu})
               .Text = "&Printer"
               .Visible = True
            End With
         End If
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedures manages the executable's data file.
   Private Function DataFile(Optional PrinterDriverPath As String = Nothing) As DataFileStr
      Try
         Static CurrentFile As New DataFileStr With {.Data = Nothing, .Path = Nothing}

         With CurrentFile
            If Not PrinterDriverPath = Nothing Then
               .Data = New List(Of Byte)(File.ReadAllBytes(PrinterDriverPath))
               .Path = PrinterDriverPath
               If Not .Data.Any Then .Data.Clear()

               DisplayInformationMenu.PerformClick()
            End If
         End With

         Return CurrentFile
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure displays the current executable's information.
   Private Sub DisplayInformationMenu_Click(sender As Object, e As EventArgs) Handles DisplayInformationMenu.Click
      Try
         With New StringBuilder
            .Append($"General information:{NewLine}")
            .Append($"-Path: {DataFile().Path}{NewLine}")
            .Append($"-Printer: {TERMINATE_AT_NULL(GetString(DataFile.Data, LocationsE.PrinterModelName, PRINTER_MODEL_NAME_SPACE))}{NewLine}{NewLine}")
            .Append($"Data:{NewLine}")
            .Append($"{Escape(DataFile().Data, " "c, EscapeAll:=True).Trim()}{NewLine}{NewLine}")
            UpdateDataBox(.ToString())
         End With
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub
End Class