'This class's imports and settings.
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

'This class contains the movie related procedures.
Public Class MovieClass
   Inherits DataFileClass

   'This enumeration lists the locations of known values inside a movie file.
   Private Enum LocationsE As Integer
      ActorsScenesPalette = &H4%          'The movie's first palette.
      DefaultSpeechBalloonColor = &HE1%   'The movie's default speech balloon text color palette index.
      FrameCount = &HE3%                  'The movie's frame count.
      FrameData = &HE5%                   'The movie's frame data.
      FrameRate = &H26%                   'The movie's frame rate.
      HasScenes = &H24%                   'Indicates whether or not the movie contains scenes.
      HasSpeechBalloons = &HDF%           'Indicates whether or not the movie contains speech balloons.
      PlayRepeatedly = &H28%              'Indicates whether or not the movie is played repeatedly.
      Signature = &H0%                    'The movie file signature.
      SpeechBalloonsPalette = &HBF%       'The movie's second palette.
   End Enum

   'This enumeration lists the palettes inside a movie file.
   Private Enum PalettesE As Integer
      ActorsScenesPalette            'The movie's actors and scenes palette.
      SpeechBalloonsPalette          'The movie's speech balloons palette.
   End Enum

   'This enumeration lists the locations of known values inside a speech balloon header.
   Private Enum SpeechBalloonLocationsE As Integer
      Alignment = &H24%                  'The text's alignment.
      BackColor = &H6%                   'The balloon background color's palette index.
      BalloonHeight = &HE%               'The balloon's height.
      BalloonWidth = &H10%               'The balloon's width.
      BorderColor = &H8%                 'The balloon border color's palette index.
      Index = &H0%                       'The balloon's index.
      LastSelectedTextColor = &H20%      'The last selected text color's palette index.
      PropertiesSize = &H2%              'The balloon properties' size.
      Text = &H2A%                       'The balloon's text.
      TextHeight = &H16%                 'The balloon's text area height.
      TextWidth = &H18%                  'The balloon's text area width.
      TextX = &H12%                      'The text's vertical position.
      TextY = &H14%                      'The text's horizontal position.
      TextLength = &H1A%                 'The text's length.
      Type = &H4%                        'The balloon's type.
      Unknown1 = &H1C%                   'Unknown WORD #3.
      Unknown2 = &H1E%                   'Unknown WORD #4.
      Unknown3 = &H26%                   'Unknown DWORD #5.
   End Enum

   'This structure defines an actor's handle record.
   Private Structure ActorHandleRecordStr
      Public Handle As Integer          'Defines one out of five possible handles reserved for a specific actor/speech balloon.
      Public Index As Integer           'Defines the index of an actor/speech balloon.
      Public PreviousHandle As Integer  'Defines the previously reserved handle.
      Public Rank As Integer            'Defines the rank of a specific actor/speech balloon instance.
   End Structure

   'This structure defines a movie's speech balloon.
   Private Structure SpeechBalloonStr
      Public Header As List(Of Byte)   'Defines the balloon's header.
      Public Text As String            'Defines the balloon's text.
   End Structure

   'The movie related constants used by this program.
   Private Const MAXIMUM_ACTORS_PER_FRAME As Integer = &H5%              'Defines the number handle records per actor.
   Private Const MAXIMUM_FRAME_RATE As Integer = 60                      'Defines the highest number of frames per second supported.
   Private Const MINIMUM_INTERVAL As Double = 1000 / MAXIMUM_FRAME_RATE  'Defines the lowest number of milliseconds between frames supported.
   Private ReadOnly PALETTE_DESCRIPTIONS As New List(Of String)({"actors and scenes", "speech balloons"})                                                                                                     'Defines the movie palettes descriptions.
   Private ReadOnly SIGNATURE As New List(Of Byte)({&H10%, &H10%, &HDF%, &H0%})                                                                                                                               'Defines the movie file signature.
   Private ReadOnly SPEECH_BALLOON_ALIGNMENTS As New List(Of String)({"left", "center"})                                                                                                                      'Defines the movie speech balloon alignments.
   Private ReadOnly SPEECH_BALLOON_TYPES As New List(Of String)({"Invisible", "Title", "Speech (Right)", "Speech (Left)", "Thought (Right)", "Thought (Left)", "Exclamation (Right)", "Exclamtion (Left)"})   'Defines the movie's speech balloon types.

   'The menu items used by this class.
   Private WithEvents DisplayActorHandleRecordsMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F6, .Text = "Display Actor &Handle Records"}
   Private WithEvents DisplayFilesMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F1, .Text = "Display &Files"}
   Private WithEvents DisplayFrameRecordsMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F2, .Text = "Display Frame &Records"}
   Private WithEvents DisplayInformationMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F3, .Text = "Display &Information"}
   Private WithEvents DisplayPalettesMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F4, .Text = "Display &Palettes"}
   Private WithEvents DisplaySpeechBalloonsMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F5, .Text = "Display &Speech Balloons"}

   'This procedure initializes this class.
   Public Sub New(PathO As String, Optional DataFileMenu As ToolStripMenuItem = Nothing)
      Try
         If DataFile(MoviePath:=PathO).Data.Count > 0 AndAlso DataFileMenu IsNot Nothing Then
            With DataFileMenu
               .DropDownItems.Clear()
               .DropDownItems.AddRange({DisplayActorHandleRecordsMenu, DisplayFilesMenu, DisplayFrameRecordsMenu, DisplayInformationMenu, DisplayPalettesMenu, DisplaySpeechBalloonsMenu})
               .Text = "&Movie"
               .Visible = True
            End With
         End If
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure manages the movie's list of actor files.
   Private Function ActorFiles(Optional Refresh As Boolean = False, Optional ByRef Position As Integer = Nothing) As List(Of String)
      Try
         Dim Count As New Integer
         Dim Length As New Integer
         Static CurrentActorFiles As New List(Of String)

         If Refresh AndAlso Not Position = Nothing Then
            CurrentActorFiles.Clear()

            Count = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position) - &H1%

            Position += &H2%

            ActorHandles(Refresh:=True, ActorCount:=Count, Position:=Position)

            For PathO As Integer = &H0% To Count - &H1%
               Length = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position)
               Position += &H2%
               CurrentActorFiles.Add(TERMINATE_AT_NULL(GetString(DataFile().Data, Position, Length, AdvanceOffset:=True)))
            Next PathO
         End If

         Return CurrentActorFiles
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure manages the movie's actor handle records.
   Private Function ActorHandleRecords(Optional Refresh As Boolean = False, Optional ByRef Position As Integer = Nothing) As List(Of ActorHandleRecordStr)
      Try
         Dim Count As New Integer
         Static CurrentActorHandleRecords As New List(Of ActorHandleRecordStr)

         If Refresh AndAlso Not Position = Nothing Then
            CurrentActorHandleRecords.Clear()

            Count = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position)

            Position += &H2%
            For Actor As Integer = &H0% To Count - &H1% Step MAXIMUM_ACTORS_PER_FRAME
               For Record As Integer = &H0% To MAXIMUM_ACTORS_PER_FRAME - &H1%
                  CurrentActorHandleRecords.Add(New ActorHandleRecordStr With {.Index = DataFile().Data(Position), .Handle = DataFile().Data(Position + &H1%), .PreviousHandle = DataFile().Data(Position + &H2%), .Rank = DataFile().Data(Position + &H3%)})
                  Position += &H4%
               Next Record
            Next Actor
         End If

         Return CurrentActorHandleRecords
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure returns the movie actors' handles.
   Private Function ActorHandles(Optional Refresh As Boolean = False, Optional ActorCount As Integer = Nothing, Optional ByRef Position As Integer = Nothing) As List(Of Integer)
      Try
         Static CurrentActorHandles As New List(Of Integer)

         If Refresh AndAlso Not Position = Nothing Then
            CurrentActorHandles.Clear()
            Position += &H1%
            For ActorHandle As Integer = &H0% To ActorCount - &H1%
               CurrentActorHandles.Add(DataFile().Data(Position) + &H1%)
               Position += &H1%
            Next ActorHandle
            Position += &H3%
         End If

         Return CurrentActorHandles
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedures manages the movie's data.
   Private Function DataFile(Optional MoviePath As String = Nothing) As DataFileStr
      Try
         Dim Position As Integer = 0
         Static CurrentFile As New DataFileStr With {.Data = Nothing, .Path = Nothing}

         If Not MoviePath = Nothing Then
            With CurrentFile
               .Data = New List(Of Byte)(File.ReadAllBytes(MoviePath))

               If GetBytes(CurrentFile.Data, LocationsE.Signature, SIGNATURE.Count).SequenceEqual(SIGNATURE) Then
                  .Path = MoviePath
                  FrameRecords(Refresh:=True, Position:=Position)
                  ActorHandleRecords(Refresh:=True, Position:=Position)
                  ActorFiles(Refresh:=True, Position:=Position)
                  SceneFiles(Refresh:=True, Position:=Position)
                  MusicFiles(Refresh:=True, Position:=Position)
                  SpeechBalloons(Refresh:=True, Position:=Position)
                  Palettes(Refresh:=True)

                  DisplayInformationMenu.PerformClick()
               Else
                  MessageBox.Show("Invalid movie file.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                  .Data = Nothing
               End If
            End With
         End If

         Return CurrentFile
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure displays the current movie's actor handle records.
   Private Sub DisplayActorHandleRecordsMenu_Click(sender As Object, e As EventArgs) Handles DisplayActorHandleRecordsMenu.Click
      Try
         With New StringBuilder
            .Append($"Actor handle records:{NewLine}{NewLine}")

            For Each Label As String In {"Index", "Handle", "Previous", "Rank"}
               .Append($"{$"{Label}:",15}")
            Next Label

            .Append(NewLine)

            For ActorHandleRecord As Integer = &H0% To ActorHandleRecords().Count - &H1%
               .Append($"{$"{ActorHandleRecords()(ActorHandleRecord).Index:X2}",15}")
               .Append($"{$"{ActorHandleRecords()(ActorHandleRecord).Handle + &H1%:X2}",15}")
               .Append($"{$"{ActorHandleRecords()(ActorHandleRecord).PreviousHandle + &H1%:X2}",15}")
               .Append($"{$"{ActorHandleRecords()(ActorHandleRecord).Rank:X2}",15}")
               .Append(NewLine)
            Next ActorHandleRecord

            UpdateDataBox(.ToString())
         End With
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure displays the movie's list of actor, music and scene files.
   Private Sub DisplayFilesMenu_Click(sender As Object, e As EventArgs) Handles DisplayFilesMenu.Click
      Try
         With New StringBuilder
            .Append($"[Actor files And Handles]{NewLine}")

               For ActorIndex As Integer = 0 To ActorFiles().Count - 1
               .Append($"""{ActorFiles()(ActorIndex)}"" ({ActorHandles()(ActorIndex):X}){NewLine}")
            Next ActorIndex

            .Append($"{NewLine}[Scene files]{NewLine}")
            For Each SceneFile As String In SceneFiles()
               .Append($"""{SceneFile}""{NewLine}")
            Next SceneFile

            .Append($"{NewLine}[Music files]{NewLine}")
            For Each MusicFile As String In MusicFiles()
               .Append($"""{MusicFile}""{NewLine}")
            Next MusicFile

            UpdateDataBox(.ToString())
         End With
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure displays the movie's frame data.
   Private Sub DisplayFrameRecordsMenu_Click(sender As Object, e As EventArgs) Handles DisplayFrameRecordsMenu.Click
      Try
         Dim Length As New Integer

         With New StringBuilder
            .Append($"Frame record data:   {NewLine}")
            For Record As Integer = 0 To FrameRecords().Count - 1
               Length = FrameRecords()(Record).Length
               .Append($"{NewLine}Frame Record #{Record} - Length: {Length}{NewLine}")
               .Append(Escape(GetString(FrameRecords()(Record).ToList(), &H0%, Length), " "c, EscapeAll:=True).Trim())
               .Append(NewLine)
            Next Record

            UpdateDataBox(.ToString())
         End With
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure displays the general information for the current movie.
   Private Sub DisplayInformationMenu_Click(sender As Object, e As EventArgs) Handles DisplayInformationMenu.Click
      Try
         With New StringBuilder
            .Append($"General information:{NewLine}")
            .Append($"-Path: {DataFile().Path}{NewLine}")
            .Append($"-Frame count: {BitConverter.ToUInt16(DataFile().Data.ToArray(), LocationsE.FrameCount)}{NewLine}")
            .Append($"-Frames per second: {FrameRate()}{NewLine}")
            .Append($"-Play repeatedly: {CBool(BitConverter.ToUInt16(DataFile().Data.ToArray(), LocationsE.PlayRepeatedly))}{NewLine}")
            .Append($"-Contains scenes: {CBool(BitConverter.ToUInt16(DataFile().Data.ToArray(), LocationsE.HasScenes))}{NewLine}")
            .Append($"-Contains speech balloons: {CBool(BitConverter.ToUInt16(DataFile().Data.ToArray(), LocationsE.HasSpeechBalloons))}{NewLine}")
            .Append($"-Default speech balloon text color index: {BitConverter.ToUInt16(DataFile().Data.ToArray(), LocationsE.DefaultSpeechBalloonColor)}")

            UpdateDataBox(.ToString())
         End With
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure displays the current movie's palettes.
   Private Sub DisplayPalettesMenu_Click(sender As Object, e As EventArgs) Handles DisplayPalettesMenu.Click
      Try
         UpdateDataBox(GBRToText("The movie's palettes:", Palettes(), PALETTE_DESCRIPTIONS))
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure displays the current movie's speech balloons.
   Private Sub DisplaySpeechBalloonsMenu_Click(sender As Object, e As EventArgs) Handles DisplaySpeechBalloonsMenu.Click
      Try
         Dim NewText As New StringBuilder

         NewText.Append($"Speech balloons:{NewLine}{NewLine}")

         For Each SpeechBalloon As SpeechBalloonStr In SpeechBalloons()
            With SpeechBalloon
               NewText.Append($"[Index: {BitConverter.ToUInt16(.Header.ToArray(), SpeechBalloonLocationsE.Index):X}]{NewLine}")
               NewText.Append($"Alignment: {SPEECH_BALLOON_ALIGNMENTS(BitConverter.ToUInt16(.Header.ToArray(), SpeechBalloonLocationsE.Alignment))}{NewLine}")
               NewText.Append($"Type: {SPEECH_BALLOON_TYPES(BitConverter.ToUInt16(.Header.ToArray(), SpeechBalloonLocationsE.Type))}{NewLine}")
               NewText.Append($"Background color: {BitConverter.ToUInt16(.Header.ToArray(), SpeechBalloonLocationsE.BackColor):X}{NewLine}")
               NewText.Append($"Balloon width: {BitConverter.ToUInt16(.Header.ToArray(), SpeechBalloonLocationsE.BalloonWidth):X}{NewLine}")
               NewText.Append($"Balloon height: {BitConverter.ToUInt16(.Header.ToArray(), SpeechBalloonLocationsE.BalloonHeight):X}{NewLine}")
               NewText.Append($"Border color: {BitConverter.ToUInt16(.Header.ToArray(), SpeechBalloonLocationsE.BorderColor):X}{NewLine}")
               NewText.Append($"Last selected text color: {BitConverter.ToUInt16(.Header.ToArray(), SpeechBalloonLocationsE.LastSelectedTextColor):X}{NewLine}")
               NewText.Append($"Text area width: {BitConverter.ToUInt16(.Header.ToArray(), SpeechBalloonLocationsE.TextWidth):X}{NewLine}")
               NewText.Append($"Text area height: {BitConverter.ToUInt16(.Header.ToArray(), SpeechBalloonLocationsE.TextHeight):X}{NewLine}")
               NewText.Append($"Text X: {BitConverter.ToUInt16(.Header.ToArray(), SpeechBalloonLocationsE.TextX):X}{NewLine}")
               NewText.Append($"Text Y: {BitConverter.ToUInt16(.Header.ToArray(), SpeechBalloonLocationsE.TextY):X}{NewLine}")
               NewText.Append($"Text length: {BitConverter.ToUInt16(.Header.ToArray(), SpeechBalloonLocationsE.TextLength):X}{NewLine}")
               NewText.Append($"Text: ""{Escape(.Text)}""{NewLine}")
               NewText.Append($"Unknown #1: {Escape(GetBytes(.Header, SpeechBalloonLocationsE.Unknown1, Count:=&H2%),, EscapeAll:=True)}{NewLine}")
               NewText.Append($"Unknown #2: {Escape(GetBytes(.Header, SpeechBalloonLocationsE.Unknown2, Count:=&H2%),, EscapeAll:=True)}{NewLine}")
               NewText.Append($"Unknown #3: {Escape(GetBytes(.Header, SpeechBalloonLocationsE.Unknown3, Count:=&H4%),, EscapeAll:=True)}{NewLine}")
               NewText.Append($"{NewLine}")
            End With
         Next SpeechBalloon

         UpdateDataBox(NewText.ToString())
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure returns the movie's frame rate.
   Private Function FrameRate() As Double
      Try
         Return (1000 / BitConverter.ToUInt16(DataFile().Data.ToArray(), LocationsE.FrameRate)) / MINIMUM_INTERVAL
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure manages the movie's frame records.
   Private Function FrameRecords(Optional Refresh As Boolean = False, Optional ByRef Position As Integer = Nothing) As List(Of Byte())
      Try
         Dim FrameCount As Integer = BitConverter.ToUint16(DataFile().Data.ToArray(), LocationsE.FrameCount)
         Dim Length As New Integer
         Static CurrentFrameRecords As New List(Of Byte())

         If Refresh Then
            CurrentFrameRecords.Clear()
            Position = LocationsE.FrameData

            For Record As Integer = &H0% To FrameCount - &H1%
               Length = BitConverter.ToUint16(DataFile().Data.ToArray(), Position)
               Position += &H2%
               CurrentFrameRecords.Add(GetBytes(DataFile().Data, Position, Length).ToArray())
               Position += Length
            Next Record
         End If

         Return CurrentFrameRecords
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure manages the movie's list of music files.
   Private Function MusicFiles(Optional Refresh As Boolean = False, Optional ByRef Position As Integer = Nothing) As List(Of String)
      Try
         Dim Count As New Integer
         Dim Length As New Integer
         Static CurrentMusicFiles As New List(Of String)

         If Refresh AndAlso Not Position = Nothing Then
            CurrentMusicFiles.Clear()
            Count = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position)

            Position += &H2%
            For PathO As Integer = &H0% To Count - &H1%
               Length = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position)
               Position += &H2%
               CurrentMusicFiles.Add(TERMINATE_AT_NULL(GetString(DataFile().Data, Position, Length, AdvanceOffset:=True)))
            Next PathO
         End If

         Return CurrentMusicFiles
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure manages the movie's palettes.
   Private Function Palettes(Optional Refresh As Boolean = False) As List(Of List(Of Color))
      Try
         Static CurrentPalettes As New List(Of List(Of Color))

         If Refresh Then
            CurrentPalettes.Clear()

            Array.ForEach({LocationsE.ActorsScenesPalette, LocationsE.SpeechBalloonsPalette}, Sub(PaletteLocation As Integer) CurrentPalettes.Add(GBRPalette(DataFile().Data, PaletteLocation)))
         End If

         Return CurrentPalettes
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure manages the movie's list of scene files.
   Private Function SceneFiles(Optional Refresh As Boolean = False, Optional ByRef Position As Integer = Nothing) As List(Of String)
      Try
         Dim Count As New Integer
         Dim Length As New Integer
         Static CurrentSceneFiles As New List(Of String)

         If Refresh AndAlso Not Position = Nothing Then
            CurrentSceneFiles.Clear()

            Count = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position)
            Position += &H2%

            For PathO As Integer = &H0% To Count - &H1%
               Length = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position)
               Position += &H2%
               CurrentSceneFiles.Add(TERMINATE_AT_NULL(GetString(DataFile().Data, Position, Length, AdvanceOffset:=True)))
            Next PathO
         End If

         Return CurrentSceneFiles
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure manages the movie's speech balloons.
   Private Function SpeechBalloons(Optional Refresh As Boolean = False, Optional ByRef Position As Integer = Nothing) As List(Of SpeechBalloonStr)
      Try
         Dim NewSpeechBalloon As SpeechBalloonStr = Nothing
         Dim PropertiesSize As New Integer
         Dim SpeechBalloonCount As Integer = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position)
         Dim TextLength As New Integer
         Static CurrentSpeechBalloons As New List(Of SpeechBalloonStr)

         If Refresh AndAlso Not Position = Nothing Then
            CurrentSpeechBalloons.Clear()
            Position += &H2%
            For SpeechBalloon As Integer = &H0% To SpeechBalloonCount - &H1%
               NewSpeechBalloon = New SpeechBalloonStr
               With NewSpeechBalloon
                  PropertiesSize = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position + SpeechBalloonLocationsE.PropertiesSize)
                  .Header = New List(Of Byte)(GetBytes(DataFile().Data, Position, PropertiesSize + &H4%, AdvanceOffset:=True))
                  TextLength = BitConverter.ToUInt16(.Header.ToArray(), SpeechBalloonLocationsE.TextLength)
                  .Text = GetString(DataFile().Data, Position, TextLength, AdvanceOffset:=True)
               End With
               CurrentSpeechBalloons.Add(NewSpeechBalloon)
            Next SpeechBalloon
         End If

         Return CurrentSpeechBalloons
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function
End Class
