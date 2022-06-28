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

'This class contains the Cartooners program preferences related procedures.
Public Class PreferencesClass
   Inherits DataFileClass

   'This structure defines the preferences.
   Private Structure PreferencesStr
      Public ButtonsStayDown As Boolean     'The "Buttons stay down." preference.
      Public AddAddsToMovie As Boolean      'The "Add ... adds to movie." preference.
      Public PlayFromFirstFrame As Boolean  'The "Play from first frame." preference.
      Public MusicOff As Boolean            'The "Music off." preference.
      Public MoviePaths As List(Of String)  'The movie paths.
      Public Path As String                 'The preferences file's path.
   End Structure

   'The preferences related constants used by this program.
   Private Const MAXIMUM_MOVIES As Integer = &HC%        'Defines the maximum number of movie paths.
   Private Const MOVIE_PATH_LENGTH As Integer = &H93%    'Defines the maximum movie path length.

   'This procedure initializes this class.
   Public Sub New(PathO As String, Optional DataFileMenu As ToolStripMenuItem = Nothing)
      Try
         If Not Preferences(PreferencesPath:=PathO).Path = Nothing AndAlso DataFileMenu IsNot Nothing Then
            With DataFileMenu
               .DropDownItems.Clear()
               .Text = "&Preferences"
               .Visible = True
            End With
         End If
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure displays Cartooners' preference file.
   Private Sub Display()
      Try
         Dim NewText As New StringBuilder

         With Preferences()
            NewText.Append($"{ .Path}:{NewLine}{NewLine}")
            NewText.Append($"[Preferences]{NewLine}")
            NewText.Append($"Buttons stay down: {If(.ButtonsStayDown, "on", "off")}.{NewLine}")
            NewText.Append($"Add ... adds to movie: {If(.AddAddsToMovie, "on", "off")}.{NewLine}")
            NewText.Append($"Play from from first frame: {If(.PlayFromFirstFrame, "on", "off")}.{NewLine}")
            NewText.Append($"Music off: {If(.MusicOff, "on", "off")}.{NewLine}")
            NewText.Append(NewLine)
            NewText.Append($"[Movies]{NewLine}")

            .MoviePaths.ForEach(Sub(MoviePath As String) NewText.Append($"{If(MoviePath = Nothing, "Coming Soon...", MoviePath)}{NewLine}"))

            UpdateDataBox(NewText.ToString())
         End With
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure manages the preferences.
   Private Function Preferences(Optional PreferencesPath As String = Nothing) As PreferencesStr
      Try
         Static CurrentPreferences As New PreferencesStr With {.AddAddsToMovie = False, .ButtonsStayDown = False, .MoviePaths = New List(Of String), .MusicOff = False, .PlayFromFirstFrame = False}

         If Not PreferencesPath = Nothing Then
            Dim MoviePath As String = Nothing

            Using PreferencesFile As New BinaryReader(File.OpenRead(PreferencesPath))
               With CurrentPreferences
                  .ButtonsStayDown = BitConverter.ToBoolean(PreferencesFile.ReadBytes(&H2%), &H0%)
                  .AddAddsToMovie = BitConverter.ToBoolean(PreferencesFile.ReadBytes(&H2%), &H0%)
                  .PlayFromFirstFrame = BitConverter.ToBoolean(PreferencesFile.ReadBytes(&H2%), &H0%)
                  .MusicOff = BitConverter.ToBoolean(PreferencesFile.ReadBytes(&H2%), &H0%)
                  .MoviePaths.Clear()
                  For Movie As Integer = 0 To MAXIMUM_MOVIES - 1
                     MoviePath = BYTES_TO_TEXT(New List(Of Byte)(PreferencesFile.ReadBytes(MOVIE_PATH_LENGTH)))
                     .MoviePaths.Add(Escape(TERMINATE_AT_NULL(MoviePath)))
                  Next Movie

                  .Path = PreferencesPath

                  Display()
               End With
            End Using
         End If

         Return CurrentPreferences
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function
End Class
