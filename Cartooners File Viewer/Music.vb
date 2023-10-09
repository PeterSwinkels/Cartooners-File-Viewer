'This class's imports and settings.
Option Compare Binary
Option Explicit On
Option Infer Off
Option Strict On

Imports System
Imports System.Collections.Generic
Imports System.Convert
Imports System.Diagnostics
Imports System.Environment
Imports System.Globalization
Imports System.IO
Imports System.Linq
Imports System.Text
Imports System.Windows.Forms

'This class contains the music related procedures.
Public Class MusicClass
   Inherits DataFileClass

   'This enumeration lists the locations of known values inside a music file.
   Private Enum LocationsE As Integer
      AdlibMIDIChannelDedicationTable = &H22%    'The Adlib MIDI channel dedication table.
      CMSMIDIChannelDedicationTable = &H2B%      'The CMS MIDI channel dedication table.
      CMSMIDIChannelFinetuneOffsetTable = &H37%  'The CMS MIDI channel finetune offset table.
      MIDITrackOffset = &H0%                     'The music's MIDI track offset.
      PCSpeakerPitchAndSpeed = &H4B%             'The PC-Speaker pitch and speed.
      RandomDataBlock = &H4D%                    'Random data block.
      RolandMIDIChannelOffOnTable = &H2%         'The Roland MIDI channel off/on table.
      RolandMIDIVolumeTable = &H12%              'The Roland global MIDI volume table.
      TandySoundChipRelatedData = &H43%          'Tandy sound chip related data. (Specifics unknown.)
   End Enum

   'This enumeration lists the locations of the music template sections.
   Private Enum TemplateLinesE As Integer
      AdlibMIDIChannelDedicationTable = 2        'The Adlib MIDI channel dedication table.
      CMSMIDIChannelDedicationTable = 3          'The CMS MIDI channel dedication table.
      CMSMIDIChannelFinetuneOffsetTable = 4      'The CMS MIDI channel finetune offset table.
      MIDITrack = 7                              'The MIDI track.
      PCSpeakerPitchAndSpeed = 6                 'The PC-Speaker pitch and speed.
      RepeatFlag = 8                             'The repeat flag.
      RolandGlobalMIDIVolumeTable = 1            'The Roland global MIDI volume table.
      RolandMIDIChannelOffOnTable = 0            'The Roland MIDI channel off/on table.
      TandySoundChipRelatedData = 5              'Tandy sound chip related data. (Specifics unknown.)
   End Enum

   Private Const ADLIB_MIDI_CHANNEL_DEDICATIONS_SIZE As Integer = &H9%       'Defines the Adlib MIDI channel dedication table size.
   Private Const CMS_MIDI_CHANNEL_DEDICATIONS_SIZE As Integer = &HC%         'Defines the CMS MIDI channel dedication table size.
   Private Const CMS_MIDI_CHANNEL_FINETUNE_OFFSETS_SIZE As Integer = &HC%    'Defines the CMS MIDI channel finetune offset table size.
   Private Const FOOTER_SIZE As Integer = &H2%                               'Defines the footer size.
   Private Const MIDI_EVENT_STOP_PLAYBACK As Integer = &HFC%                 'Defines the stop playback MIDI event.
   Private Const PLAY_ONCE As Integer = &H81%                                'Indicates that the music is played once.
   Private Const PLAY_REPEATEDLY As Integer = &H80%                          'Indicates that the music is played repeatedly.
   Private Const ROLAND_MIDI_CHANNELS_SIZE As Integer = &H10%                'Defines the Roland MIDI channel off/on table size.
   Private Const ROLAND_MIDI_VOLUMES_SIZE As Integer = &H10%                 'Defines the Roland global MIDI volume table size.
   Private Const TANDY_SOUND_CHIP_RELATED_DATA_SIZE As Integer = &H8%        'Defines the Tandy sound chip related data size.

   'The menu items used by this class.
   Private WithEvents DisplayDataMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F1, .Text = "Display &Data"}
   Private WithEvents DisplayInformationMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F2, .Text = "Display &Information"}

   'This procedure initializes this class.
   Public Sub New(PathO As String, Optional DataFileMenu As ToolStripMenuItem = Nothing)
      Try
         If Path.GetExtension(PathO).ToLower() = ".txt" Then PathO = Import(PathO)

         If DataFile(MusicPath:=PathO).Data.Count > 0 AndAlso DataFileMenu IsNot Nothing Then
            With DataFileMenu
               .DropDownItems.Clear()
               .DropDownItems.AddRange({DisplayDataMenu, DisplayInformationMenu})
               .Text = "&Music"
               .Visible = True
            End With
         End If
      Catch ExceptionO As Exception
         DisplayException(ExceptionO)
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
         DisplayException(ExceptionO)
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
            .Append($"-Roland MIDI channel off/on table: {Escape(GetString(DataFile().Data, LocationsE.RolandMIDIChannelOffOnTable, ROLAND_MIDI_CHANNELS_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}")
            .Append($"-Roland global MIDI volume table: {Escape(GetString(DataFile().Data, LocationsE.RolandMIDIVolumeTable, ROLAND_MIDI_VOLUMES_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}")
            .Append($"-Adlib MIDI channel dedication table: {Escape(GetString(DataFile().Data, LocationsE.AdlibMIDIChannelDedicationTable, ADLIB_MIDI_CHANNEL_DEDICATIONS_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}")
            .Append($"-CMS MIDI channel dedication table: {Escape(GetString(DataFile().Data, LocationsE.CMSMIDIChannelDedicationTable, CMS_MIDI_CHANNEL_DEDICATIONS_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}")
            .Append($"-CMS MIDI channel finetune offset table: {Escape(GetString(DataFile().Data, LocationsE.CMSMIDIChannelFinetuneOffsetTable, CMS_MIDI_CHANNEL_FINETUNE_OFFSETS_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}")
            .Append($"-Tandy sound chip related data (specifics unknown): {Escape(GetString(DataFile().Data, LocationsE.TandySoundChipRelatedData, TANDY_SOUND_CHIP_Related_DATA_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}")
            .Append($"-PC-Speaker pitch and speed: {BitConverter.ToUInt16(DataFile().Data.ToArray(), LocationsE.PCSpeakerPitchAndSpeed):X2}")
            .Append($"{NewLine}{NewLine}Random data block:{NewLine}")
            .Append(Escape(GetString(DataFile().Data, LocationsE.RandomDataBlock, MIDITrackOffset - LocationsE.RandomDataBlock), " "c, EscapeAll:=True).Trim())
            .Append($"{NewLine}{NewLine}MIDI track data:{NewLine}")
            .Append(Escape(GetString(DataFile().Data, MIDITrackOffset, (DataFile().Data.Count - MIDITrackOffset) - FOOTER_SIZE), " "c, EscapeAll:=True).Trim())
            .Append($"{NewLine}{NewLine}Footer:{NewLine}")
            .Append(Escape(GetString(DataFile().Data, DataFile().Data.Count - FOOTER_SIZE, FOOTER_SIZE), " "c, EscapeAll:=True).Trim())
            UpdateDataBox(.ToString())
         End With
      Catch ExceptionO As Exception
         DisplayException(ExceptionO)
      End Try
   End Sub

   'This procedure displays the general information for the current music.
   Private Sub DisplayInformationMenu_Click(sender As Object, e As EventArgs) Handles DisplayInformationMenu.Click
      Try
         With New StringBuilder
            .Append(GeneralFileInformation(DataFile().Path))
            .Append(NewLine)
            .Append($"MIDI track offset: {BitConverter.ToUInt16(DataFile().Data.ToArray(), LocationsE.MIDITrackOffset)} byte(s).{NewLine}")
            .Append($"Play repeatedly: {IsRepeatingMusic()}")
            UpdateDataBox(.ToString())
         End With
      Catch ExceptionO As Exception
         DisplayException(ExceptionO)
      End Try
   End Sub

   'This procedure exports the current music.
   Public Overloads Sub Export(ExportPath As String)
      Try
         Dim Exported As New StringBuilder($"[{MUSIC_TEMPLATE}]{NewLine}{NewLine}")
         Dim MIDITrackOffset As Integer = BitConverter.ToUInt16(DataFile().Data.ToArray(), LocationsE.MIDITrackOffset)
         Dim MusicName As String = Path.GetFileNameWithoutExtension(DataFile.Path).ToLower()
         Dim MusicPath As String = DataFile().Path

         With Exported
            .Append($"{TEMPLATE_COMMENT} Name:{NewLine}")
            .Append($"{MusicName}{NewLine}{NewLine}")
            .Append($"{TEMPLATE_COMMENT} Roland MIDI channel off/on table:{NewLine}")
            .Append($"{Escape(GetString(DataFile().Data, LocationsE.RolandMIDIChannelOffOnTable, ROLAND_MIDI_CHANNELS_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}{NewLine}")
            .Append($"{TEMPLATE_COMMENT} Roland global MIDI volume table:{NewLine}")
            .Append($"{Escape(GetString(DataFile().Data, LocationsE.RolandMIDIVolumeTable, ROLAND_MIDI_VOLUMES_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}{NewLine}")
            .Append($"{TEMPLATE_COMMENT} Adlib MIDI channel dedication table:{NewLine}")
            .Append($"{Escape(GetString(DataFile().Data, LocationsE.AdlibMIDIChannelDedicationTable, ADLIB_MIDI_CHANNEL_DEDICATIONS_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}{NewLine}")
            .Append($"{TEMPLATE_COMMENT} CMS MIDI channel dedication table:{NewLine}")
            .Append($"{Escape(GetString(DataFile().Data, LocationsE.CMSMIDIChannelDedicationTable, CMS_MIDI_CHANNEL_DEDICATIONS_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}{NewLine}")
            .Append($"{TEMPLATE_COMMENT} CMS MIDI channel finetune offset table:{NewLine}")
            .Append($"{Escape(GetString(DataFile().Data, LocationsE.CMSMIDIChannelFinetuneOffsetTable, CMS_MIDI_CHANNEL_FINETUNE_OFFSETS_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}{NewLine}")
            .Append($"{TEMPLATE_COMMENT} Tandy sound chip related data (specifics unknown)::{NewLine}")
            .Append($"{Escape(GetString(DataFile().Data, LocationsE.TandySoundChipRelatedData, TANDY_SOUND_CHIP_RELATED_DATA_SIZE), " "c, EscapeAll:=True).Trim()}{NewLine}{NewLine}")
            .Append($"{TEMPLATE_COMMENT} PC-Speaker pitch and speed:{NewLine}")
            .Append($"{BitConverter.ToUInt16(DataFile().Data.ToArray(), LocationsE.PCSpeakerPitchAndSpeed):X2}")

            .Append($"{NewLine}{NewLine}{TEMPLATE_COMMENT} MIDI track data:{NewLine}")
            .Append(Escape(GetString(DataFile().Data, MIDITrackOffset, (DataFile().Data.Count - MIDITrackOffset) - FOOTER_SIZE), " "c, EscapeAll:=True).Trim())
            .Append($"{NewLine}{NewLine}{TEMPLATE_COMMENT} Repeats:{NewLine}")
            .Append($"{If(IsRepeatingMusic(), "yes", "no")}{NewLine}")

            File.WriteAllText(Path.Combine(ExportPath, $"{MusicName}.txt"), .ToString())
            Process.Start(New ProcessStartInfo With {.FileName = ExportPath, .WindowStyle = ProcessWindowStyle.Normal})
         End With
      Catch ExceptionO As Exception
         DisplayException(ExceptionO)
      End Try
   End Sub

   'This procedure imports the specified music template.
   Private Function Import(ImportPath As String) As String
      Try
         Dim Data As New List(Of Byte)
         Dim Header As New List(Of Byte)
         Dim MIDITrackOffset As New Integer
         Dim TemplateLines As New List(Of String)(TrimAllLines((From Item In Template() Skip 1 Where Not (Item.Trim().StartsWith(TEMPLATE_COMMENT) OrElse Item.Trim = Nothing)).ToList()))
         Dim MusicName As String = TemplateLines.First()
         Dim MusicPath As String = Path.Combine(Path.GetDirectoryName(ImportPath), $"{MusicName}.mus")

         TemplateLines.RemoveAt(0)

         With Header
            .AddRange(TEXT_TO_BYTES(Unescape($" {TemplateLines(TemplateLinesE.RolandMIDIChannelOffOnTable).Trim()}", EscapeCharacter:=" "c)))
            .AddRange(TEXT_TO_BYTES(Unescape($" {TemplateLines(TemplateLinesE.RolandGlobalMIDIVolumeTable).Trim()}", EscapeCharacter:=" "c)))
            .AddRange(TEXT_TO_BYTES(Unescape($" {TemplateLines(TemplateLinesE.AdlibMIDIChannelDedicationTable).Trim()}", EscapeCharacter:=" "c)))
            .AddRange(TEXT_TO_BYTES(Unescape($" {TemplateLines(TemplateLinesE.CMSMIDIChannelDedicationTable).Trim()}", EscapeCharacter:=" "c)))
            .AddRange(TEXT_TO_BYTES(Unescape($" {TemplateLines(TemplateLinesE.CMSMIDIChannelFinetuneOffsetTable).Trim()}", EscapeCharacter:=" "c)))
            .AddRange(TEXT_TO_BYTES(Unescape($" {TemplateLines(TemplateLinesE.TandySoundChipRelatedData).Trim()}", EscapeCharacter:=" "c)))
            .AddRange(BitConverter.GetBytes(CUShort(Integer.Parse(TemplateLines(TemplateLinesE.PCSpeakerPitchAndSpeed).Trim(), NumberStyles.HexNumber))))
         End With

         With Data
            .AddRange(BitConverter.GetBytes(CUShort(Header.Count + &H2%)))
            .AddRange(Header)
            .AddRange(TEXT_TO_BYTES(Unescape($" {TemplateLines(TemplateLinesE.MIDITrack).Trim()}", EscapeCharacter:=" "c)))
            .Add(MIDI_EVENT_STOP_PLAYBACK)
            Select Case TemplateLines(TemplateLinesE.RepeatFlag).Trim().ToLower()
               Case "no"
                  .Add(&H81%)
               Case "yes"
                  .Add(&H80%)
            End Select

            File.WriteAllBytes(MusicPath, .ToArray())
         End With

         Return MusicPath
      Catch ExceptionO As Exception
         DisplayException(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure returns whether or not the music is played repeatedly.
   Private Function IsRepeatingMusic() As Boolean
      Try
         Select Case DataFile().Data.Last
            Case PLAY_ONCE
               Return False
            Case PLAY_REPEATEDLY
               Return True
         End Select
      Catch ExceptionO As Exception
         DisplayException(ExceptionO)
      End Try

      Return Nothing
   End Function
End Class
