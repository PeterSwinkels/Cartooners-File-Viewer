'This module's imports and settings.
Option Compare Binary
Option Explicit On
Option Infer Off
Option Strict On

Imports System
Imports System.Collections.Generic
Imports System.Drawing
Imports System.Environment
Imports System.IO
Imports System.Linq
Imports System.Text
Imports System.Windows.Forms

'This module contains this program's interface.
Public Class InterfaceWindow
   Private ReadOnly SUPPORTED_IMAGES As New List(Of String)({".bmp", ".emf", ".gif", ".ico", ".jpg", ".jpeg", ".png", ".tif", ".tiff", ".wmf"})   'Defines the extensions of the supported image file types.

   'This procedure initializes this window.
   Public Sub New()
      Try
         InitializeComponent()

         My.Application.ChangeCulture("en-US")

         With My.Computer.Screen.WorkingArea
            Me.Size = New Size(CInt(.Width / 1.1), CInt(.Height / 1.1))
         End With

         Me.Text = ProgramInformation()

         ToolTip.SetToolTip(DataBox, "Drag a file into this window to view it.")

         UpdateDataBox(, NewDataBox:=DataBox)
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure closes this window.
   Private Sub CloseMenu_Click(sender As Object, e As EventArgs) Handles CloseMenu.Click
      Try
         Me.Close()
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure gives the command to load the file dropped into the data box.
   Private Sub DataBox_DragDrop(sender As Object, e As DragEventArgs) Handles DataBox.DragDrop
      Try
         If e.Data.GetDataPresent(DataFormats.FileDrop) Then DataFile(DirectCast(e.Data.GetData(DataFormats.FileDrop), String()).First)
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure handles objects being dragged into the data box.
   Private Sub DataBox_DragEnter(sender As Object, e As DragEventArgs) Handles DataBox.DragEnter
      Try
         If e.Data.GetDataPresent(DataFormats.FileDrop) Then e.Effect = DragDropEffects.All
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure displays the export file dialog.
   Private Sub ExportFilesMenu_Click(sender As Object, e As EventArgs) Handles ExportFilesMenu.Click
      Try
         If DataFile() Is Nothing Then
            MessageBox.Show("No open file to export.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Information)
         Else
            Try
               Static PathO As String = Nothing

               With New FolderBrowserDialog With {.SelectedPath = PathO}
                  If TypeOf DataFile() Is ActorClass Then
                     If .ShowDialog = DialogResult.OK Then
                        PathO = .SelectedPath
                        DirectCast(DataFile(), ActorClass).Export(PathO)
                     End If
                  ElseIf TypeOf DataFile() Is ArchiveClass Then
                     If .ShowDialog = DialogResult.OK Then
                        PathO = .SelectedPath
                        DirectCast(DataFile(), ArchiveClass).Export(PathO)
                     End If
                  ElseIf TypeOf DataFile() Is CartoonersClass Then
                     If .ShowDialog = DialogResult.OK Then
                        PathO = .SelectedPath
                        DirectCast(DataFile(), CartoonersClass).Export(PathO)
                     End If
                  ElseIf TypeOf DataFile() Is LBMImageClass Then
                     If .ShowDialog = DialogResult.OK Then
                        PathO = .SelectedPath
                        DirectCast(DataFile(), LBMImageClass).Export(PathO)
                     End If
                  ElseIf TypeOf DataFile() Is PrinterDriverClass Then
                     If .ShowDialog = DialogResult.OK Then
                        PathO = .SelectedPath
                        DirectCast(DataFile(), PrinterDriverClass).Export(PathO)
                     End If
                  ElseIf TypeOf DataFile() Is ScriptClass Then
                     If .ShowDialog = DialogResult.OK Then
                        PathO = .SelectedPath
                        DirectCast(DataFile(), ScriptClass).Export(PathO)
                     End If
                  ElseIf TypeOf DataFile() Is SoundCardDriverClass Then
                     If .ShowDialog = DialogResult.OK Then
                        PathO = .SelectedPath
                        DirectCast(DataFile(), SoundCardDriverClass).Export(PathO)
                     End If
                  Else
                     MessageBox.Show("The current file does not support exporting data.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Information)
                  End If
               End With
            Catch ExceptionO As Exception
               HandleError(ExceptionO)
            End Try
         End If
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure displays the file format information file.
   Private Sub FileFormatsMenu_Click(sender As Object, e As EventArgs) Handles FileFormatsMenu.Click
      Try
         UpdateDataBox(My.Resources.Cartooners_File_Formats)
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure displays the help file.
   Private Sub HelpMenu_Click(sender As Object, e As EventArgs) Handles HelpMenu.Click
      Try
         UpdateDataBox(My.Resources.Cartooners_File_Viewer_Help)
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure displays information about this program.
   Private Sub InformationMenu_Click(sender As Object, e As EventArgs) Handles InformationMenu.Click
      Try
         With My.Application.Info
            MessageBox.Show(.Description, ProgramInformation(), MessageBoxButtons.OK, MessageBoxIcon.Information)
         End With
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure gives the command to display the help.
   Private Sub InterfaceWindow_Load(sender As Object, e As EventArgs) Handles Me.Load
      Try
         HelpMenu.PerformClick()
         If GetCommandLineArgs.Count > 1 Then DataFile(GetCommandLineArgs(1))
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure displays the load file dialog.
   Private Sub LoadFileMenu_Click(sender As Object, e As EventArgs) Handles LoadFileMenu.Click
      Try
         Dim Filter As New StringBuilder

         Filter.Append("Actor files (*.act)|*.act|")
         Filter.Append("Archive files (*.pea)|*.pea|")
         Filter.Append("Executable files (*.exe)|*.exe|")
         Filter.Append("Image files (")
         SUPPORTED_IMAGES.ForEach(Sub(Item As String) Filter.Append(If(Item = Nothing, "", $"*{Item};")))
         Filter.Append(")|")
         SUPPORTED_IMAGES.ForEach(Sub(Item As String) Filter.Append(If(Item = Nothing, "", $"*{Item};")))
         Filter.Append("|")
         Filter.Append("Installation script files (*.iea)|*.iea|")
         Filter.Append("LBM files (*.bbm;*.iff;*.lbm)|*.bbm;.iff;*.lbm|")
         Filter.Append("Movie files (*.mov)|*.mov|")
         Filter.Append("Music files (*.mus)|*.mus|")
         Filter.Append("Preference files (*.inf)|*.inf|")
         Filter.Append("Printer driver files(*.lpt)|*.lpt|")
         Filter.Append("Sound card driver files(*.smb)|*.smb|")
         Filter.Append("Template files(*.txt)|*.txt")

         With New OpenFileDialog With {.CheckFileExists = True, .FileName = Nothing, .Filter = Filter.ToString(), .FilterIndex = 1}
            If Not .ShowDialog() = DialogResult.Cancel Then DataFile(.FileName)
         End With
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure gives the command to load the specified file and display its information.
   Private Function DataFile(Optional NewPath As String = Nothing) As DataFileClass
      Try
         Dim DataFileFromTemplate As DataFileClass = Nothing
         Dim Extension As String = Nothing
         Static CurrentDataFile As DataFileClass = Nothing
         Static CurrentPath As String = Nothing

         If Not NewPath = Nothing Then
            Extension = Path.GetExtension(NewPath)

            If NewPath.StartsWith("""") Then NewPath = NewPath.Substring(1)
            If NewPath.EndsWith("""") Then NewPath = NewPath.Substring(0, NewPath.Length - 1)

            Select Case Extension.ToLower()
               Case ".act"
                  CurrentDataFile = New ActorClass(NewPath, DataFileMenu)
               Case ".exe"
                  CurrentDataFile = New CartoonersClass(NewPath, DataFileMenu)
               Case ".iea"
                  CurrentDataFile = New ScriptClass(NewPath, DataFileMenu)
               Case ".inf"
                  CurrentDataFile = New PreferencesClass(NewPath, DataFileMenu)
               Case ".bbm", ".lbm"
                  CurrentDataFile = New LBMImageClass(NewPath, DataFileMenu)
               Case ".lpt"
                  CurrentDataFile = New PrinterDriverClass(NewPath, DataFileMenu)
               Case ".mov"
                  CurrentDataFile = New MovieClass(NewPath, DataFileMenu)
               Case ".mus"
                  CurrentDataFile = New MusicClass(NewPath, DataFileMenu)
               Case ".pea"
                  CurrentDataFile = New ArchiveClass(NewPath, DataFileMenu)
               Case ".smb"
                  CurrentDataFile = New SoundCardDriverClass(NewPath, DataFileMenu)
               Case ".txt"
                  DataFileFromTemplate = GetDataFileFromTemplate(NewPath, DataFileMenu)
                  If DataFileFromTemplate IsNot Nothing Then CurrentDataFile = DataFileFromTemplate
               Case Else
                  If SUPPORTED_IMAGES.IndexOf(Extension.ToLower()) >= 0 Then
                     CurrentDataFile = New LBMImageClass(NewPath, DataFileMenu)
                  Else
                     If Not NewPath.Trim() = Nothing Then
                        MessageBox.Show($"Unsupported file type for: ""{NewPath}""", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                        NewPath = Nothing
                     End If
                  End If
            End Select

            If NewPath IsNot Nothing Then CurrentPath = NewPath

            Me.Text = $"{ProgramInformation()} - {If(CurrentDataFile Is Nothing, Nothing, CurrentPath)}"
         End If

         Return CurrentDataFile
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function
End Class