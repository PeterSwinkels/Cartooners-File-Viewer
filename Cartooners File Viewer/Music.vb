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

'This class contains the music related procedures.
Public Class MusicClass
   Inherits DataFileClass

   'This enumeration lists the locations of known values inside a music file.
   Private Enum LocationsE As Integer
      AdlibMIDIChannelDedicationTable = &H9%     'The Adlib MIDI channel dedication table.
      CMSMIDIChannelDedicationTable = &H2B%      'The CMS MIDI channel dedication table.
      CMSMIDIChannelFinetuneOffsetTable = &H37%  'The CMS MIDI channel finetune offset table.
      MIDITrackOffset = &H0%                     'The music's MIDI track offset.
      PCSpeakerPitchAndSpeed = &H4B%             'The PC-Speaker pitch and speed.
      RolandMIDIChannelTable = &H2%              'The Roland MIDI channel off/on table.
      RolandMIDIVolumeTable = &H2%               'The Roland global MIDI volume table.
      UnknownData1 = &H43%                       'Unknown data block 1.
      UnknownData2 = &H4D%                       'Unknown data block 2.
   End Enum

   Private Const ADLIB_MIDI_CHANNEL_DEDICATIONS_SIZE As Integer = &H9%       'Defines the Adlib MIDI channel dedication table size.
   Private Const CMS_MIDI_CHANNEL_DEDICATIONS_SIZE As Integer = &HC%         'Defines the CMS MIDI channel dedication table size.
   Private Const CMS_MIDI_CHANNEL_FINETUNE_OFFSETS_SIZE As Integer = &HC%    'Defines the CMS MIDI channel finetune offset table size.
   Private Const FOOTER_SIZE As Integer = &H2%                               'Defines the footer size.
   Private Const ROLAND_MIDI_CHANNELS_SIZE As Integer = &H10%                'Defines the Roland MIDI channel off/on table size.
   Private Const ROLAND_MIDI_VOLUMES_SIZE As Integer = &H10%                 'Defines the Roland global MIDI volume table size.
   Private Const PLAY_ONCE As Integer = &H81%                                'Indicates that the music is played once.
   Private Const PLAY_REPEATEDLY As Integer = &H80%                          'Indicates that the music is played repeatedly.
   Private Const UNKNOWN_1_SIZE As Integer = &H8%                            'Defines the size of unknown data block 1.

   'The menu items used by this class.
   Private WithEvents DisplayDataMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F1, .Text = "Display &Data"}
   Private WithEvents DisplayInformationMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F2, .Text = "Display &Information"}

   'This procedure initializes this class.
   Public Sub New(PathO As String, Optional DataFileMenu As ToolStripMenuItem = Nothing)
      Try
         If DataFile(MusicPath:=PathO).Data.Count > 0 AndAlso DataFileMenu IsNot Nothing Then
            With DataFileMenu
               .DropDownItems.Clear()
               .DropDownItems.AddRange({DisplayDataMenu, DisplayInformationMenu})
               .Text = "&Music"
               .Visible = True
            End With
         End If
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedures manages the music's data file.
   Private Function DataFile(Optional MusicPath As String = Nothing) As DataFileStr
      Try
         Static CurrentFile As New DataFileStr With {.Data = Nothing, .Path = Nothing}

         If Not MusicPath = Nothing Then
            With CurrentFile
               .Data = New List(Of Byte)(File.ReadAllBytes(MusicPath))
               If Not .Data.Any Then .Data.Clear()

               Select Case .Data.Last
                  Case PLAY_ONCE, PLAY_REPEATEDLY
                     .Path = MusicPath
                     DisplayInformationMenu.PerformClick()
                  Case Else
                     MessageBox.Show("Invalid music file.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                     .Data = Nothing
               End Select
            End With
         End If

         Return CurrentFile
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure displays the current music's data.
   Private Sub DisplayDataMenu_Click(sender As Object, e As EventArgs) Handles DisplayDataMenu.Click
      Try
         Dim MIDITrackOffset As Integer = BitConverter.ToUint16(DataFile().Data.ToArray(), LocationsE.MIDITrackOffset)

         With New StringBuilder
            .Append($"Music data:{NewLine}")
            .Append($"-Relative MIDI track offset: {MIDITrackOffset:X}{NewLine}")
            .Append($"-Roland MIDI channel off/on table: {Escape(GetString(DataFile().Data, LocationsE.RolandMIDIChannelTable, ROLAND_MIDI_CHANNELS_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}")
            .Append($"-Roland global MIDI volume table: {Escape(GetString(DataFile().Data, LocationsE.RolandMIDIVolumeTable, ROLAND_MIDI_VOLUMES_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}")
            .Append($"-Adlib MIDI channel dedication table: {Escape(GetString(DataFile().Data, LocationsE.AdlibMIDIChannelDedicationTable, ADLIB_MIDI_CHANNEL_DEDICATIONS_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}")
            .Append($"-CMS MIDI channel dedication table: {Escape(GetString(DataFile().Data, LocationsE.CMSMIDIChannelDedicationTable, CMS_MIDI_CHANNEL_DEDICATIONS_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}")
            .Append($"-CMS MIDI channel finetune offset table: {Escape(GetString(DataFile().Data, LocationsE.CMSMIDIChannelFinetuneOffsetTable, CMS_MIDI_CHANNEL_FINETUNE_OFFSETS_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}")
            .Append($"{NewLine}-Unknown header data 1:{NewLine}")
            .Append(Escape(GetString(DataFile().Data, LocationsE.UnknownData1, UNKNOWN_1_SIZE), " "c, EscapeAll:=True).Trim())
            .Append($"{NewLine}{NewLine}-PC-Speaker pitch and speed: {BitConverter.ToUint16(DataFile().Data.ToArray(), LocationsE.PCSpeakerPitchAndSpeed):X}")
            .Append($"{NewLine}{NewLine}-Unknown header data 2:{NewLine}")
            .Append(Escape(GetString(DataFile().Data, LocationsE.UnknownData2, MIDITrackOffset - LocationsE.UnknownData2), " "c, EscapeAll:=True).Trim())
            .Append($"{NewLine}{NewLine}MIDI track data:{NewLine}")
            .Append(Escape(GetString(DataFile().Data, MIDITrackOffset, (DataFile().Data.Count - MIDITrackOffset) - FOOTER_SIZE), " "c, EscapeAll:=True).Trim())
            .Append($"{NewLine}{NewLine}Footer:{NewLine}")
            .Append(Escape(GetString(DataFile().Data, DataFile().Data.Count - FOOTER_SIZE, FOOTER_SIZE), " "c, EscapeAll:=True).Trim())
            UpdateDataBox(.ToString())
         End With
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure displays the general information for the current music.
   Private Sub DisplayInformationMenu_Click(sender As Object, e As EventArgs) Handles DisplayInformationMenu.Click
      Try
         With New StringBuilder
            .Append($"General information:{NewLine}")
            .Append($"-Path: {DataFile().Path}{NewLine}")
            .Append($"-Midi track offset: {BitConverter.ToUint16(DataFile().Data.ToArray(), LocationsE.MIDITrackOffset)} byte(s).{NewLine}")
            .Append($"-Play repeatedly: {IsRepeatingMusic()}")
            UpdateDataBox(.ToString())
         End With
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure indicates whether or not the music is played repeatedly.
   Private Function IsRepeatingMusic() As Boolean
      Try
         Select Case DataFile().Data.Last
            Case PLAY_ONCE
               Return False
            Case PLAY_REPEATEDLY
               Return True
         End Select
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function
End Class
