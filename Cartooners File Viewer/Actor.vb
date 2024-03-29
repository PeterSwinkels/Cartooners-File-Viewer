﻿'This class's imports and settings.
Option Compare Binary
Option Explicit On
Option Infer Off
Option Strict On

Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Convert
Imports System.Diagnostics
Imports System.Drawing
Imports System.Environment
Imports System.IO
Imports System.Linq
Imports System.Text
Imports System.Windows.Forms

'This class contains the actor related procedures.
Public Class ActorClass
   Inherits DataFileClass

   'This enumeration lists the animation record field types.
   Private Enum AnimationRecordFieldsE As Integer
      RecordNumber  'The animation record number.
      ImageRecord   'The image record number.
      XSpeed        'The horizontal speed.
      XDirection    'The horizontal direction.
      YSpeed        'The vertical speed.
      YDirection    'The vertical direction.
   End Enum

   'This enumeration lists the locations of known values inside an actor file.
   Private Enum LocationsE As Integer
      ActionCount = &H3E%                     'The number of actions an actor can perform.
      ActionMenuOffset = &H40%                'The offset of the action menu items.
      ActorNameOffset = &H3A%                 'The offset of the actor's name.
      AnimationRecordCountOffset = &H32%      'The offset of the animation record count list.
      AnimationRecordListOffset = &H2E%       'The offset of the animation records list.
      AnimationRecordLoopBackOffset = &H36%   'The offset of the animation record loop back list.
      BaseOffset = &H4B%                      'The absolute base offset for relative offsets.
      EndOfMenuOffset = &H4A%                 'The offset of the end of the menu items.
      EndOfMenuOffsetOffset = &H2%            'The offset of the menu item data's end offset.
      ImageCount = &H24%                      'The total number of images for an actor.
      ImageRecords = &H50%                    'The image record list.
      ImageRecordsSize = &H2A%                'The size of all image records combined.
      Palette = &H4%                          'The palette.
      Signature = &H1%                        'The actor file signature.
      WayCount = &H44%                        'The number of directions an actor can go.
      WayMenuOffset = &H46%                   'The offset of the way menu items.
   End Enum

   'This structure defines an actor template.
   Private Class ActorTemplateClass
      Public Actions As List(Of String)              'Defines an actor's actions.
      Public ActorName As String                     'Defines an actor's name.
      Public AnimationRecordLists As List(Of Byte)   'Defines an actor's animation record lists.
      Public AnimationRecords As List(Of Byte)       'Defines an actor's animation records.
      Public GBRPalette As List(Of Byte)             'Defines an actor's GBR palette.
      Public ImageRecords As List(Of Byte)           'Defines an actor's image records.
      Public Images As List(Of ImageStr)             'Defines an actor's images.
      Public Transparent As Color                    'Defines a transparent color for the actor's images.
      Public Ways As List(Of String)                 'Defines an actor's ways.
   End Class

   'This structure defines an actor's animation record.
   Private Structure AnimationRecordStr
         Public ImageRecord As Integer  'Defines a reference to an image record.
         Public XDirection As Integer   'Defines the horizontal direction.
         Public YDirection As Integer   'Defines the vertical direction.
         Public XSpeed As Integer       'Defines the horizontal speed.
         Public YSpeed As Integer       'Defines the vertical speed.
      End Structure

      'This structure defines an actor's image record.
      Private Structure ImageRecordStr
         Public BytesPerRow As Integer  'Defines the number of bytes per pixel row.
         Public DataOffset As Integer   'Defines the offset of the image's data.
         Public Height As Integer       'Defines the actor image's height.
         Public Width As Integer        'Defines the actor image's width.
      End Structure

      'This structure defines an actors image.
      Private Structure ImageStr
         Public BytesPerRow As Integer  'Defines the number of bytes per pixel row.
         Public Data As List(Of Byte)   'Defines the image's data.
         Public Height As Integer       'Defines the image's height.
         Public Width As Integer        'Defines the image's width.
      End Structure

      'This structure defines an actor's menu items.
      Private Structure MenuItemsStr
         Public Actions As List(Of String)   'Defines the list of action items.
         Public Ways As List(Of String)      'Defines the list of way items.
      End Structure

      'The actor related constants used by this program.
      Private Const ACTION_SUFFIX As String = "N256"                     'Defines the action item's suffix.
      Private Const ACTION_WAY_PREFIX As String = "--"                   'Defines the action or way menu item's prefix.
      Private Const ANIMATION_RECORD_LENGTH As Integer = &H6%            'Defines the length of an animation record.
      Private Const ANIMATION_RECORD_LIST_ITEM_LENGTH As Integer = &H2%  'Defines the length of an animation record list item.
      Private Const DOWN_RIGHT As Byte = &H0%                            'Indicates down or right.
      Private Const IMAGE_RECORD_LENGTH As Integer = &HE%                'Defines the length of an image data item.
      Private Const NAME_PREFIX As String = "-- "                        'Defines the actor's name prefix.
      Private Const NAME_SUFFIX As String = "Nxxxxx"                     'Defines the actor's name suffix. 
      Private Const OPAQUE As Integer = &HFF000000%                      'Indicates that a color is opaque.
      Private Const SUFFIX_DELIMITER As String = "\"                     'Defines the delimiter for a menu item's name and suffix.
      Private Const TRANSPARENT_INDEX As Byte = &H0%                     'Defines the index of the transparent color.
      Private Const UP_LEFT As Byte = &HFF%                              'Indicates up or left.
      Private Const WAY_SUFFIX As String = "N2816"                       'Defines the way item's suffix.
      Private ReadOnly GET_OFFSET As Func(Of List(Of Byte), LocationsE, Integer) = Function(Data As List(Of Byte), Position As LocationsE) LocationsE.BaseOffset + BitConverter.ToInt32(Data.ToArray(), Position)  'This procedure returns the relative offset at the specified position.
      Private ReadOnly SIGNATURE As New List(Of Byte)({&H10%})                                                                                                                                                     'Defines the actor file signature.

      'The menu items used by this class.
      Private WithEvents DisplayAnimationRecordListsMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F1, .Text = "Display Animation Record &Lists"}
      Private WithEvents DisplayAnimationRecordsMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F2, .Text = "Display Animation &Records"}
      Private WithEvents DisplayImageDataMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F3, .Text = "Display Image &Data"}
      Private WithEvents DisplayImageListMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F4, .Text = "Display Image &List"}
      Private WithEvents DisplayInformationMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F5, .Text = "Display &Information"}
      Private WithEvents DisplayMenuItemsMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F6, .Text = "Display &Menu Items"}
      Private WithEvents DisplayPaletteMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F7, .Text = "Display &Palette"}
      Private WithEvents TransparentColorMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F8, .Text = "&Transparent Color"}

      'This procedure initializes this class.
      Public Sub New(ByRef PathO As String, Optional DataFileMenu As ToolStripMenuItem = Nothing)
         Try
         If Path.GetExtension(PathO).ToLower() = ".txt" Then PathO = Import(PathO)

         If PathO IsNot Nothing AndAlso DataFile(ActorPath:=PathO).Data.Count > 0 AndAlso DataFileMenu IsNot Nothing Then
               With DataFileMenu
                  .DropDownItems.Clear()
                  .DropDownItems.AddRange({DisplayAnimationRecordListsMenu, DisplayAnimationRecordsMenu, DisplayImageDataMenu, DisplayImageListMenu, DisplayInformationMenu, DisplayMenuItemsMenu, DisplayPaletteMenu, TransparentColorMenu})
                  .Text = "&Actor"
                  .Visible = True
               End With
            End If
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try
      End Sub

      'This procedure manages the actors animation record lists.
      Private Function AnimationRecordLists(Optional Refresh As Boolean = False) As Integer(,,)
         Try
            Dim Position As New Integer
            Static CurrentAnimationRecordLists(,,) As Integer = Nothing

            If Refresh Then
               If LocationsE.ActionCount < DataFile().Data.Count AndAlso LocationsE.WayCount < DataFile().Data.Count Then
                  ReDim CurrentAnimationRecordLists(0 To 2, BitConverter.ToUInt16(DataFile().Data.ToArray(), LocationsE.ActionCount) - 1, BitConverter.ToUInt16(DataFile().Data.ToArray(), LocationsE.WayCount) - 1)

                  With CurrentAnimationRecordLists
                     Position = GET_OFFSET(DataFile().Data, LocationsE.AnimationRecordListOffset)
                     For RecordList As Integer = .GetLowerBound(0) To .GetUpperBound(0)
                        For Action As Integer = .GetLowerBound(1) To .GetUpperBound(1)
                           For Way As Integer = .GetLowerBound(2) To .GetUpperBound(2)
                              CurrentAnimationRecordLists(RecordList, Action, Way) = DataFile().Data(Position + &H1%)
                              Position += ANIMATION_RECORD_LIST_ITEM_LENGTH
                           Next Way
                        Next Action
                     Next RecordList
                  End With
               End If
            End If

            Return CurrentAnimationRecordLists
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

      'This procedure manages the actors animation records.
      Private Function AnimationRecords(Optional Refresh As Boolean = False) As List(Of AnimationRecordStr)
         Try
            Static CurrentAnimationRecords As New List(Of AnimationRecordStr)

            If Refresh Then
               CurrentAnimationRecords.Clear()
               For Position As Integer = LocationsE.ImageRecords + BitConverter.ToInt32(DataFile().Data.ToArray(), LocationsE.ImageRecordsSize) To GET_OFFSET(DataFile().Data, LocationsE.AnimationRecordListOffset) - ANIMATION_RECORD_LENGTH Step ANIMATION_RECORD_LENGTH
                  CurrentAnimationRecords.Add(New AnimationRecordStr With {.YSpeed = UNSIGN_BYTE(DataFile().Data(Position)), .YDirection = DataFile().Data(Position + &H1%), .ImageRecord = DataFile().Data(Position + &H2%), .XSpeed = UNSIGN_BYTE(DataFile().Data(Position + &H4%)), .XDirection = DataFile().Data(Position + &H5%)})
               Next Position
            End If

            Return CurrentAnimationRecords
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

      'This procedures manages the actor's data file.
      Private Function DataFile(Optional ActorPath As String = Nothing) As DataFileStr
         Try
            Dim EndOfMenuOffsetOffset As New Integer
            Dim Position As New Integer
            Static CurrentFile As New DataFileStr With {.Data = Nothing, .Path = Nothing}

            If Not ActorPath = Nothing Then
               With CurrentFile
                  .Data = New List(Of Byte)(File.ReadAllBytes(ActorPath))

                  Position = LocationsE.EndOfMenuOffsetOffset
                  EndOfMenuOffsetOffset = BitConverter.ToUInt16(GetBytes(CurrentFile.Data, Position, Count:=&H2%, AdvanceOffset:=True).ToArray(), &H0%)

                  If GetBytes(CurrentFile.Data, LocationsE.Signature, SIGNATURE.Count).SequenceEqual(SIGNATURE) AndAlso Position + EndOfMenuOffsetOffset = LocationsE.EndOfMenuOffset Then
                     .Path = ActorPath
                     AnimationRecordLists(Refresh:=True)
                     AnimationRecords(Refresh:=True)
                     ImageRecords(Refresh:=True)
                     MenuItems(Refresh:=True)
                     Name(Refresh:=True)
                     Palette(Refresh:=True)
                     TransparentColor(Refresh:=True)

                     DisplayInformationMenu.PerformClick()
                  Else
                     MessageBox.Show("Invalid actor file.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                     .Data = Nothing
                  End If
               End With
            End If

            Return CurrentFile
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

      'This procedure returns the name for the specified direction.
      Private Function DirectionName(Direction As Integer, Optional IsHorizontal As Boolean = False) As String
         Try
            Select Case True
               Case (Direction = DOWN_RIGHT) AndAlso IsHorizontal
                  Return "right"
               Case (Direction = DOWN_RIGHT) AndAlso Not IsHorizontal
                  Return "down"
               Case (Direction = UP_LEFT) AndAlso IsHorizontal
                  Return "left"
               Case (Direction = UP_LEFT) AndAlso Not IsHorizontal
                  Return "up"
            End Select

            Return "?"
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

   'This procecure displays the actor's animation record lists.
   Private Sub DisplayAnimationRecordListsMenu_Click(sender As Object, e As EventArgs) Handles DisplayAnimationRecordListsMenu.Click
      Try
         With New StringBuilder
            .Append($"Animation record lists:{NewLine}{NewLine}{"Action:",-20}")
            Array.ForEach({"Record", "Count", "Loop"}, Sub(Label As String) .Append($"{Label,10}"))
            .Append(NewLine)
            For Action As Integer = AnimationRecordLists().GetLowerBound(1) To AnimationRecordLists().GetUpperBound(1)
               .Append($"{MenuItemName(MenuItems().Actions(Action))}{NewLine}")
               For Way As Integer = AnimationRecordLists().GetLowerBound(2) To AnimationRecordLists().GetUpperBound(2)
                  .Append($"{$"{MenuItemName(MenuItems().Ways(Way)),-15}",18}")
                  For RecordList As Integer = AnimationRecordLists().GetLowerBound(0) To AnimationRecordLists().GetUpperBound(0)
                     .Append($"{AnimationRecordLists()(RecordList, Action, Way),10}")
                  Next RecordList
                  .Append(NewLine)
               Next Way
            Next Action

            UpdateDataBox(.ToString())
         End With
      Catch ExceptionO As Exception
         DisplayException(ExceptionO)
      End Try
   End Sub

   'This procecure displays the actor's animation records.
   Private Sub DisplayAnimationRecordsMenu_Click(sender As Object, e As EventArgs) Handles DisplayAnimationRecordsMenu.Click
         Try
            Dim NewText As New StringBuilder
            Dim RecordNumber As New Integer

            With NewText
               .Append($"Animation records:{NewLine}")
               Array.ForEach({"Record", "Image", "X Speed", "X Direction", "Y Speed", "Y Direction"}, Sub(Label As String) .Append($"{Label,15}"))
               .Append(NewLine)
            End With

            For Each Record As AnimationRecordStr In AnimationRecords()
               With Record
                  NewText.Append($"{RecordNumber,15}")
                  NewText.Append($"{ .ImageRecord,15}")
                  NewText.Append($"{ .XSpeed,15}")
                  NewText.Append($"{$"{DirectionName(.XDirection, IsHorizontal:=True),-12}",15}")
                  NewText.Append($"{ .YSpeed,15}")
                  NewText.Append($"{$"{DirectionName(.YDirection, IsHorizontal:=False),-12}",15}{NewLine}")
                  RecordNumber += 1
               End With
            Next Record

            UpdateDataBox(NewText.ToString())
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try
      End Sub

      'This procedure displays the actor's image data.
      Private Sub DisplayImageDataMenu_Click(sender As Object, e As EventArgs) Handles DisplayImageDataMenu.Click
         Try
            Dim Offset As New Integer
            Dim Size As New Integer

            With New StringBuilder
               .Append(String.Format("Image data:{0}", NewLine))
               For Record As Integer = 0 To ImageRecords().Count - 1
                  Offset = ImageRecords()(Record).DataOffset
                  Size = BitConverter.ToUInt16(DataFile().Data.ToArray(), Offset)
                  .Append($"{NewLine}Image #{Record} - Size: {Size}{NewLine}")
                  .Append(Escape(GetString(DataFile().Data, Offset + &H2%, &H2% + (Size - &H2%)), " "c, EscapeAll:=True).Trim())
                  .Append(NewLine)
               Next Record

               UpdateDataBox(.ToString())
            End With
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try
      End Sub

      'This procedure displays a list of image records for the current actor.
      Private Sub DisplayImageListMenu_Click(sender As Object, e As EventArgs) Handles DisplayImageListMenu.Click
         Try
            Dim NewText As New StringBuilder
            Dim RecordNumber As New Integer

            With NewText
               .Append($"Image records:{NewLine}")
               Array.ForEach({"Image", "Offset", "Size", "Bytes Per Row", "Width", "Height"}, Sub(Label As String) .Append($"{$"{Label}:",16}"))
               .Append(NewLine)
            End With

            For Each Record As ImageRecordStr In ImageRecords()
               With Record
                  NewText.Append($"{RecordNumber,16}")
                  NewText.Append($"{ .DataOffset,16}")
                  NewText.Append($"{BitConverter.ToUInt16(DataFile().Data.ToArray(), .DataOffset),16}")
                  NewText.Append($"{ .BytesPerRow,16}")
                  NewText.Append($"{ .Width,16}")
                  NewText.Append($"{ .Height,16}{NewLine}")
                  RecordNumber += 1
               End With
            Next Record

            UpdateDataBox(NewText.ToString())
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try
      End Sub

      'This procedure displays the general information for the current actor.
      Private Sub DisplayInformationMenu_Click(sender As Object, e As EventArgs) Handles DisplayInformationMenu.Click
         Try
            Dim ActionCount As Integer? = If(LocationsE.ActionCount < DataFile().Data.Count, BitConverter.ToUInt16(DataFile().Data.ToArray(), LocationsE.ActionCount), Nothing)
            Dim ImageCount As Integer? = If(LocationsE.ImageCount < DataFile().Data.Count, BitConverter.ToUInt16(DataFile().Data.ToArray(), LocationsE.ImageCount), Nothing)
            Dim WayCount As Integer? = If(LocationsE.WayCount < DataFile().Data.Count, BitConverter.ToUInt16(DataFile().Data.ToArray(), LocationsE.WayCount), Nothing)

            With New StringBuilder
               .Append(GeneralFileInformation(DataFile().Path))
               .Append(NewLine)
               .Append($"Name: {Escape(Name())}{NewLine}")
               .Append($"Actions: {ActionCount.Value}{NewLine}")
               .Append($"Image: {ImageCount.Value}{NewLine}")
               .Append($"Ways: {WayCount.Value}")

               UpdateDataBox(.ToString())
            End With
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try
      End Sub

      'This procedure displays the current actor's menu items.
      Private Sub DisplayMenuItemsMenu_Click(sender As Object, e As EventArgs) Handles DisplayMenuItemsMenu.Click
         Try
            With New StringBuilder
               .Append("Actions:")
               MenuItems().Actions.ForEach(Sub(Item As String) .Append($"{NewLine}{Item}"))
               .Append($"{NewLine}{NewLine}Ways:")
               MenuItems().Actions.ForEach(Sub(Item As String) .Append($"{NewLine}{Item}"))
               UpdateDataBox(.ToString())
            End With
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try
      End Sub

      'This procedure displays the current actor's palette.
      Private Sub DisplayPaletteMenu_Click(sender As Object, e As EventArgs) Handles DisplayPaletteMenu.Click
         Try
            UpdateDataBox(GBRToText("The actor's palette:", New List(Of List(Of Color))({Palette()})))
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try
      End Sub

      'This procedure exports the current actor.
      Public Overloads Sub Export(ExportPath As String)
         Try
         Dim ActorAnimationLists(,,) As Integer = AnimationRecordLists()
         Dim ActorPath As String = DataFile().Path
         Dim Blue As New Integer
         Dim Exported As New StringBuilder($"[{ACTOR_TEMPLATE}]{NewLine}{NewLine}")
         Dim Green As New Integer
         Dim RecordNumber As New Integer
         Dim Red As New Integer

         ExportPath = Path.Combine(ExportPath, Path.GetFileNameWithoutExtension(ActorPath))
         Directory.CreateDirectory(ExportPath)

         Exported.Append($"[Name]{NewLine}{MenuItemName(Name())}{NewLine}{NewLine}[Actions]")

         MenuItems().Actions.ForEach(Sub(Item As String) Exported.Append($"{NewLine}{MenuItemName(Item)}"))

         Exported.Append($"{NewLine}{NewLine}[Ways]")
         MenuItems().Ways.ForEach(Sub(Item As String) Exported.Append($"{NewLine}{MenuItemName(Item)}"))

         Exported.Append($"{NewLine}{NewLine}[Transparent]{NewLine}{TransparentColor.ToArgb:X}{NewLine}{NewLine}[Palette]{NewLine}")

         For Position As Integer = LocationsE.Palette To LocationsE.Palette + ((GBR_12_COLOR_DEPTH - &H1%) * GBR_12_COLOR_LENGTH) Step GBR_12_COLOR_LENGTH
            Blue = GetNibble(DataFile().Data(Position), NibblesE.LowNibble)
            Green = GetNibble(DataFile().Data(Position), NibblesE.HighNibble)
            Red = GetNibble(DataFile().Data(Position + &H1%), NibblesE.LowNibble)
            Exported.Append($"{Red:X} {Green:X} {Blue:X} {NewLine}")
         Next Position

         Exported.Append($"{NewLine}[Images]{NewLine}")
         ExportImages(ExportPath).ForEach(Sub(ImageFile As String) Exported.Append($"{ImageFile}{NewLine}"))


         Exported.Append($"{NewLine}[Animation records]{NewLine}")
         Array.ForEach({$"{TEMPLATE_COMMENT}Record", "Image", "X Speed", "X Direction", "Y Speed", "Y Direction"}, Sub(Label As String) Exported.Append($"{$"{Label}:",15}"))

         Exported.Append(NewLine)

         For Each Record As AnimationRecordStr In AnimationRecords()
            With Record
               Exported.Append($"{RecordNumber,15}")
               Exported.Append($"{ .ImageRecord,15}")
               Exported.Append($"{ .XSpeed,15}")
               Exported.Append($"{$"{DirectionName(.XDirection, IsHorizontal:=True),-12}",15}")
               Exported.Append($"{ .YSpeed,15}")
               Exported.Append($"{$"{DirectionName(.YDirection, IsHorizontal:=False),-12}",15}{NewLine}")

               RecordNumber += 1
            End With
         Next Record

         Exported.Append($"{NewLine}[Animation record lists]{NewLine}")
         Array.ForEach({$"{TEMPLATE_COMMENT}Action", "Record", "Count", "Loop"}, Sub(Label As String) Exported.Append($"{$"{Label}:",15}"))
         Exported.Append(NewLine)

         For Action As Integer = ActorAnimationLists.GetLowerBound(1) To ActorAnimationLists.GetUpperBound(1)
            Exported.Append($"{TEMPLATE_COMMENT}{MenuItemName(MenuItems.Actions(Action))}{NewLine}")
            For Way As Integer = ActorAnimationLists.GetLowerBound(2) To ActorAnimationLists.GetUpperBound(2)
               Exported.Append($" {TEMPLATE_COMMENT}{MenuItemName(MenuItems.Ways(Way))}{NewLine,-7}")
               For RecordList As Integer = ActorAnimationLists.GetLowerBound(0) To ActorAnimationLists.GetUpperBound(0)
                  Exported.Append($"{ActorAnimationLists(RecordList, Action, Way),15}")
               Next RecordList
               Exported.Append(NewLine)
            Next Way
         Next Action

         File.WriteAllText(Path.Combine(ExportPath, $"{MenuItemName(Name)}.txt"), Exported.ToString())
         Process.Start(New ProcessStartInfo With {.FileName = ExportPath, .WindowStyle = ProcessWindowStyle.Normal})
      Catch ExceptionO As Exception
         DisplayException(ExceptionO)
      End Try
   End Sub

   'This procedure exports the actor's images to files at the specified path.
   Private Function ExportImages(ExportPath As String) As List(Of String)
         Try
            Dim ImageFiles As New List(Of String)
            Dim RootName As String = MenuItemName(Name())

            For Record As Integer = 0 To ImageRecords().Count - 1
               With ImageRecords()(Record)
                  ImageFiles.Add($"{RootName}{Record}.png")
                  Draw4BitImage(DecompressRLE(DataFile().Data, .DataOffset + &H2%, BitConverter.ToUInt16(DataFile().Data.ToArray(), .DataOffset)), .Width, .Height, Palette(), .BytesPerRow, TRANSPARENT_INDEX, TransparentColor()).Save(Path.Combine(ExportPath, ImageFiles(ImageFiles.Count - 1)), Imaging.ImageFormat.Png)
               End With
            Next Record

            Return ImageFiles
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

      'This procudure converts the specified image to a 4 bit color image and returns the resulting color indexes.
      Private Function GetIndexes(ImageO As Bitmap, GBRPalette As List(Of Byte), Transparent As Color) As List(Of Byte)
         Try
            Dim BestMatch As New Integer
            Dim BytesPerRow As New Integer
            Dim ColorO As New Color
            Dim Difference As New Integer
            Dim Indexes As New List(Of Byte)
            Dim LeastDifference As New Integer
            Dim NewIndexes As New Integer

            With ImageO
               BytesPerRow = If(.Width Mod PIXELS_PER_BYTE = &H0%, .Width \ PIXELS_PER_BYTE, (.Width + 1) \ PIXELS_PER_BYTE)
               For y As Integer = 0 To .Height - 1
                  For x As Integer = 0 To (BytesPerRow * PIXELS_PER_BYTE) - 1
                     If x < .Width Then
                        ColorO = .GetPixel(x, y)
                        If ColorO = Transparent Then
                           NewIndexes = SetNibble(NewIndexes, TRANSPARENT_INDEX, If(x Mod PIXELS_PER_BYTE = &H0%, NibblesE.HighNibble, NibblesE.LowNibble))
                        Else
                           LeastDifference = &H100%
                           For Index As Integer = &H0% To GBR_12_COLOR_DEPTH - &H1%
                              If Not Index = TRANSPARENT_INDEX Then
                                 Difference = COLOR_DIFFERENCE(ColorO, GBRToARGB(New List(Of Byte)({GBRPalette(Index * GBR_12_COLOR_LENGTH), GBRPalette((Index * GBR_12_COLOR_LENGTH) + &H1%)})))
                                 If Difference <= LeastDifference Then
                                    BestMatch = Index
                                    LeastDifference = Difference
                                 End If
                              End If
                           Next Index
                           NewIndexes = SetNibble(NewIndexes, BestMatch, If(x Mod PIXELS_PER_BYTE = &H0%, NibblesE.HighNibble, NibblesE.LowNibble))
                        End If

                        If Not x Mod PIXELS_PER_BYTE = &H0% Then
                           Indexes.Add(ToByte(NewIndexes))
                           NewIndexes = &H0%
                        End If
                     End If
                  Next x
               Next y
            End With

            Return Indexes
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

      'This procedure manages the actors image records.
      Private Function ImageRecords(Optional Refresh As Boolean = False) As List(Of ImageRecordStr)
         Try
            Static CurrentImageRecords As New List(Of ImageRecordStr)

            If Refresh Then
               CurrentImageRecords.Clear()
               For Position As Integer = LocationsE.ImageRecords To LocationsE.ImageRecords + (BitConverter.ToInt32(DataFile().Data.ToArray(), LocationsE.ImageRecordsSize) - IMAGE_RECORD_LENGTH) Step IMAGE_RECORD_LENGTH
                  CurrentImageRecords.Add(New ImageRecordStr With {.DataOffset = BitConverter.ToInt32(DataFile().Data.ToArray(), Position), .Width = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position + &H8%), .Height = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position + &H6%), .BytesPerRow = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position + &H4%)})
               Next Position
            End If

            Return CurrentImageRecords
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

   'This procedure imports the specified actor template.
   Private Function Import(ImportPath As String) As String
      Try
         Dim ActionMenu As New List(Of Byte)
         Dim ActionMenuOffset As New Integer
         Dim ActorNameMenu As New List(Of Byte)
         Dim ActorNameOffset As New Integer
         Dim ActorPath As String = Nothing
         Dim ActorTemplate As ActorTemplateClass = ParseActorTemplate(New List(Of String)(TrimAllLines((From Item In Template() Where Not Item.Trim().StartsWith(TEMPLATE_COMMENT)).ToList())), ImportPath)
         Dim AnimationCount1Offset As New Integer
         Dim AnimationCount2Offset As New Integer
         Dim AnimationRecordListOffset As New Integer
         Dim Data As New List(Of Byte)
         Dim EndOfMenuOffset As New Integer
         Dim ImageOffset As New Integer
         Dim ImageRecordsSize As New Integer
         Dim RecordListSize As New Integer
         Dim WayMenu As New List(Of Byte)
         Dim WayMenuOffset As New Integer

         If ActorTemplate IsNot Nothing Then
            ActorTemplate.Actions.ForEach(Sub(Item As String) ActionMenu.AddRange(TEXT_TO_BYTES($"{Item}{DELIMITER}")))
            ActorNameMenu = TEXT_TO_BYTES($"{NAME_PREFIX}{ActorTemplate.ActorName}{SUFFIX_DELIMITER}{NAME_SUFFIX}{DELIMITER}")
            ActorTemplate.Ways.ForEach(Sub(Item As String) WayMenu.AddRange(TEXT_TO_BYTES($"{Item}{DELIMITER}")))

            ImageRecordsSize = (ActorTemplate.Images.Count * IMAGE_RECORD_LENGTH)
            RecordListSize = (ActorTemplate.Actions.Count * ActorTemplate.Ways.Count) * &H2%

            AnimationRecordListOffset = ImageRecordsSize + ActorTemplate.AnimationRecords.Count + &H6%
            AnimationCount1Offset = AnimationRecordListOffset + RecordListSize
            AnimationCount2Offset = AnimationCount1Offset + RecordListSize
            ActorNameOffset = AnimationCount2Offset + RecordListSize
            ActionMenuOffset = ActorNameOffset + ActorNameMenu.Count
            WayMenuOffset = ActionMenuOffset + ActionMenu.Count
            EndOfMenuOffset = WayMenuOffset + WayMenu.Count

            With Data
               .Add(&H0%)
               .AddRange(SIGNATURE)
               .AddRange(BitConverter.GetBytes(ToUInt16(LocationsE.EndOfMenuOffset - LocationsE.EndOfMenuOffsetOffset - .Count)))
               .AddRange(ActorTemplate.GBRPalette)
               .AddRange(BitConverter.GetBytes(ActorTemplate.Images.Count))
               .AddRange({&H0%, &H0%})
               .AddRange(BitConverter.GetBytes(ImageRecordsSize))
               .AddRange(BitConverter.GetBytes(AnimationRecordListOffset))
               .AddRange(BitConverter.GetBytes(AnimationCount1Offset))
               .AddRange(BitConverter.GetBytes(AnimationCount2Offset))
               .AddRange(BitConverter.GetBytes(ActorNameOffset))
               .AddRange(BitConverter.GetBytes(ToUInt16(ActorTemplate.Actions.Count)))
               .AddRange(BitConverter.GetBytes(ActionMenuOffset))
               .AddRange(BitConverter.GetBytes(ToUInt16(ActorTemplate.Ways.Count)))
               .AddRange(BitConverter.GetBytes(WayMenuOffset))
               .AddRange(BitConverter.GetBytes(EndOfMenuOffset))
               .AddRange({&H0%, &H0%})

               ImageOffset = LocationsE.BaseOffset + EndOfMenuOffset + &H1%
               For Each ImageO As ImageStr In ActorTemplate.Images
                  .AddRange(BitConverter.GetBytes(ImageOffset))
                  .AddRange(BitConverter.GetBytes(ToUInt16(ImageO.BytesPerRow)))
                  .AddRange(BitConverter.GetBytes(ToUInt16(ImageO.Height)))
                  .AddRange(BitConverter.GetBytes(ToUInt16(ImageO.Width)))
                  .AddRange({&H0%, &H0%, &H0%, &H0%})
                  ImageOffset += ImageO.Data.Count
               Next ImageO

               .AddRange(ActorTemplate.AnimationRecords)
               .Add(&H0%)

               For RecordList As Integer = &H0% To &H2%
                  For Position As Integer = &H0% To ActorTemplate.AnimationRecordLists.Count - &H3% Step &H3%
                     .AddRange({&H0%, ActorTemplate.AnimationRecordLists(Position + RecordList)})
                  Next Position
               Next RecordList

               .Add(&H0%)
               .AddRange(ActorNameMenu)
               .AddRange(ActionMenu)
               .AddRange(WayMenu)
               ActorTemplate.Images.ForEach(Sub(Item As ImageStr) .AddRange(Item.Data))

               ActorPath = Path.Combine(Path.GetDirectoryName(ImportPath), $"{ActorTemplate.ActorName}.act")
               File.WriteAllBytes(ActorPath, .ToArray())
            End With
         End If

         Return ActorPath
      Catch ExceptionO As Exception
         DisplayException(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure returns the actions imported from the specified template.
   Private Function ImportActions(Template As List(Of String), Line As Integer) As List(Of String)
         Try
            Dim Actions As New List(Of String)

            Do
               Line += 1
               If Line >= Template.Count OrElse Template(Line) = Nothing Then Exit Do
               Actions.Add($"{ACTION_WAY_PREFIX}{Template(Line)}{SUFFIX_DELIMITER}{ACTION_SUFFIX}{Actions.Count:D2}")
            Loop

            Return Actions
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

      'This procedure returns the animation records imported from the specified template.
      Private Function ImportAnimationRecords(Template As List(Of String), Line As Integer) As List(Of Byte)
         Try
            Dim AnimationRecord As List(Of String) = Nothing
            Dim AnimationRecords As New List(Of Byte)
            Dim RecordListSize As New Integer
            Dim XDirection As New Byte
            Dim XSpeed As New Byte
            Dim YDirection As New Byte
            Dim YSpeed As New Byte

            Do
               Line += 1
               If Line >= Template.Count OrElse Template(Line) = Nothing Then
                  Exit Do
               Else
                  AnimationRecord = New List(Of String)(Template(Line).Split(" "c))

                  XDirection = If(AnimationRecord(AnimationRecordFieldsE.XDirection).ToUpper = "RIGHT", DOWN_RIGHT, UP_LEFT)
                  XSpeed = ToByte(SignByte(ToInt32(AnimationRecord(AnimationRecordFieldsE.XSpeed)), IsNegative:=(XDirection = UP_LEFT)))
                  YDirection = If(AnimationRecord(AnimationRecordFieldsE.YDirection).ToUpper = "DOWN", DOWN_RIGHT, UP_LEFT)
                  YSpeed = ToByte(SignByte(ToInt32(AnimationRecord(AnimationRecordFieldsE.YSpeed)), IsNegative:=(YDirection = UP_LEFT)))

                  AnimationRecords.AddRange({YSpeed, YDirection, ToByte(AnimationRecord(AnimationRecordFieldsE.ImageRecord)), &H0%, XSpeed, XDirection})
               End If
            Loop

            Return AnimationRecords
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

      'This procedure returns the imported animation record lists from the specified template.
      Private Function ImportAnimationRecordLists(Template As List(Of String), Line As Integer) As List(Of Byte)
         Try
            Dim AnimationRecordLists As New List(Of Byte)

            Do
               Line += 1
               If Line >= Template.Count OrElse Template(Line) = Nothing Then Exit Do
               Array.ForEach(Template(Line).Split(" "c), Sub(Item As String) AnimationRecordLists.Add(ToByte(Item)))
            Loop

            Return AnimationRecordLists
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

      'This procedure returns the imported palette from the specified template.
      Private Function ImportGBRPalette(Template As List(Of String), Line As Integer) As List(Of Byte)
         Try
            Dim GBRPalette As New List(Of Byte)
            Dim HexadecimalRGBColor As New StringBuilder

            For ColorIndex As Integer = 0 To GBR_12_COLOR_DEPTH - 1
               Line += 1

               If Line >= Template.Count OrElse Template(Line) = Nothing Then
                  MessageBox.Show($"{GBR_12_COLOR_DEPTH} colors expected in the palette.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                  Exit For
               Else
                  HexadecimalRGBColor.Clear()
                  Array.ForEach(Template(Line).Trim().Split(" "c), Sub(RGBComponent As String) HexadecimalRGBColor.Append(RGBComponent & RGBComponent))
                  GBRPalette.AddRange(ARGB_TO_GBR(Color.FromArgb(ToInt32(HexadecimalRGBColor.ToString(), fromBase:=16))))
               End If
            Next ColorIndex

            Return GBRPalette
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

      'This procedure returns the image data for the imported images listed in the specified template.
      Private Function ImportImages(ImportPath As String, Template As List(Of String), Line As Integer, GBRPalette As List(Of Byte), Transparent As Color) As List(Of ImageStr)
         Try
            Dim BitmapO As Bitmap = Nothing
            Dim Compressed As List(Of Byte) = Nothing
            Dim ImagePath As String = Nothing
            Dim Images As New List(Of ImageStr)
            Dim ImportedImage As New ImageStr

            If GBRPalette.Any Then
               Do
                  Line += 1
                  If Line >= Template.Count OrElse Template(Line) = Nothing Then
                     Exit Do
                  Else
                     ImagePath = Path.Combine(Path.GetDirectoryName(ImportPath), Template(Line))
                     If File.Exists(ImagePath) Then
                        BitmapO = New Bitmap(Path.Combine(Path.GetDirectoryName(ImportPath), Template(Line)))
                        Compressed = CompressRLE(GetIndexes(BitmapO, GBRPalette, Transparent))

                        With ImportedImage
                           .Data = New List(Of Byte)(New List(Of Byte)(BitConverter.GetBytes(ToUInt16(Compressed.Count))).Concat(Compressed))
                           .Height = BitmapO.Height
                           .Width = BitmapO.Width
                           .BytesPerRow = If(.Width Mod PIXELS_PER_BYTE = &H0%, .Width \ PIXELS_PER_BYTE, (.Width + 1) \ PIXELS_PER_BYTE)
                        End With

                        Images.Add(ImportedImage)
                     Else
                        MessageBox.Show($"Could not import the image ""{ImagePath}"".", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Information)
                        Images = Nothing
                        Exit Do
                     End If
                  End If
               Loop
            Else
               MessageBox.Show("The palette must precede the image list.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
               Images = Nothing
            End If

            Return Images
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

      'This procedure returns the ways imported from the specified template.
      Private Function ImportWays(Template As List(Of String), Line As Integer) As List(Of String)
         Try
            Dim Ways As New List(Of String)


            Do
               Line += 1
               If Line >= Template.Count OrElse Template(Line) = Nothing Then Exit Do
               Ways.Add($"{ACTION_WAY_PREFIX}{Template(Line)}{SUFFIX_DELIMITER}{WAY_SUFFIX}{Ways.Count}")
            Loop

            Return Ways
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

      'This procedure returns the name of the specified menu item.
      Private Function MenuItemName(MenuItem As String) As String
         Try
            Return MenuItem.Substring(0, MenuItem.IndexOf(SUFFIX_DELIMITER)).Substring(MenuItem.IndexOf(ACTION_WAY_PREFIX) + ACTION_WAY_PREFIX.Length).Trim()
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

      'This procedure manages the actors menu items.
      Private Function MenuItems(Optional Refresh As Boolean = False) As MenuItemsStr
         Try
            Dim Character As New Char
            Dim Item As New StringBuilder
            Static CurrentMenuItems As New MenuItemsStr With {.Actions = New List(Of String), .Ways = New List(Of String)}

            If Refresh Then
               CurrentMenuItems.Actions.Clear()
               If LocationsE.ActionCount < DataFile().Data.Count AndAlso LocationsE.WayCount < DataFile().Data.Count Then
                  For Position As Integer = GET_OFFSET(DataFile().Data, LocationsE.ActionMenuOffset) To GET_OFFSET(DataFile().Data, LocationsE.WayMenuOffset)
                     Character = ToChar(DataFile().Data(Position))
                     If Not Char.IsControl(Character) Then Item.Append(Character)
                     If Character = DELIMITER AndAlso Item.ToString().Length > 0 Then
                        CurrentMenuItems.Actions.Add(Item.ToString())
                        Item.Clear()
                     End If
                  Next Position

                  CurrentMenuItems.Ways.Clear()
                  For Position As Integer = GET_OFFSET(DataFile().Data, LocationsE.WayMenuOffset) To GET_OFFSET(DataFile().Data, LocationsE.EndOfMenuOffset)
                     Character = ToChar(DataFile().Data(Position))
                     If Not Char.IsControl(Character) Then Item.Append(Character)
                     If Character = DELIMITER AndAlso Item.ToString().Length > 0 Then
                        CurrentMenuItems.Ways.Add(Item.ToString())
                        Item.Clear()
                     End If
                  Next Position
               End If
            End If

            Return CurrentMenuItems
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

      'This procedure manages the actor's name.
      Private Function Name(Optional Refresh As Boolean = False) As String
         Try
            Static CurrentName As New StringBuilder

            If Refresh Then
               CurrentName.Clear()
               If LocationsE.ActorNameOffset < DataFile().Data.Count AndAlso LocationsE.ActionMenuOffset < DataFile().Data.Count Then
                  For Position As Integer = GET_OFFSET(DataFile().Data, LocationsE.ActorNameOffset) To GET_OFFSET(DataFile().Data, LocationsE.ActionMenuOffset)
                     CurrentName.Append(ToChar(DataFile().Data(Position)))
                  Next Position
               End If
            End If

            Return CurrentName.ToString()
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

      'This procedure manages the actor's palette.
      Private Function Palette(Optional Refresh As Boolean = False) As List(Of Color)
         Try
            Static CurrentPalette As New List(Of Color)

            If Refresh Then CurrentPalette = GBRPalette(DataFile().Data, LocationsE.Palette)

            Return CurrentPalette
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function

   'This procedure returns the data from the specified actor template.
   Private Function ParseActorTemplate(Template As List(Of String), ImportPath As String) As ActorTemplateClass
      Try
         Dim ActorTemplate As New ActorTemplateClass With {.Actions = New List(Of String), .ActorName = Nothing, .AnimationRecordLists = New List(Of Byte), .AnimationRecords = New List(Of Byte), .GBRPalette = New List(Of Byte), .ImageRecords = New List(Of Byte), .Images = New List(Of ImageStr), .Transparent = Color.White, .Ways = New List(Of String)}
         Dim Line As New Integer
         Dim Section As String = Nothing
         Dim Sections As New List(Of String)({"[actions]", "[animation record lists]", "[animation records]", "[images]", "[name]", "[palette]", "[transparent]", "[ways]"})

         Line = 0
         Do While Line < Template.Count
            If Not Template(Line) = Nothing Then
               Section = Template(Line).ToLower()
               With ActorTemplate
                  Select Case Section
                     Case "[actions]"
                        Sections.Remove(Section)
                        .Actions = ImportActions(Template, Line)
                     Case "[animation record lists]"
                        Sections.Remove(Section)
                        .AnimationRecordLists = ImportAnimationRecordLists(Template, Line)
                     Case "[animation records]"
                        Sections.Remove(Section)
                        .AnimationRecords = ImportAnimationRecords(Template, Line)
                     Case "[images]"
                        Sections.Remove(Section)
                        .Images = ImportImages(ImportPath, Template, Line, ActorTemplate.GBRPalette, ActorTemplate.Transparent)
                     Case "[name]"
                        Sections.Remove(Section)
                        Line += 1
                        .ActorName = Template(Line)
                     Case "[palette]"
                        Sections.Remove(Section)
                        .GBRPalette = ImportGBRPalette(Template, Line)
                     Case "[transparent]"
                        Sections.Remove(Section)
                        Line += 1
                        .Transparent = Color.FromArgb(ToInt32(Template(Line), fromBase:=16) Or OPAQUE)
                     Case "[ways]"
                        Sections.Remove(Section)
                        .Ways = ImportWays(Template, Line)
                  End Select
               End With
            End If

            Line += 1
         Loop

         If Sections.Count > 0 Then
            MessageBox.Show($"Missing sections:{NewLine}{String.Join(NewLine, Sections.ToArray())}", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Warning)
            ActorTemplate = Nothing
         End If

         If ActorTemplate IsNot Nothing AndAlso ActorTemplate.Images Is Nothing Then
            ActorTemplate = Nothing
         End If

         Return ActorTemplate
      Catch ExceptionO As Exception
         DisplayException(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure gives the command to set the color that represents the transparent areas in an actor's image.
   Private Sub TransparentColorMenu_Click(sender As Object, e As EventArgs) Handles TransparentColorMenu.Click
         Try
            TransparentColor(, Replace:=True)
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try
      End Sub

      'This procudure manages the color that is used to represent the transparent areas in an actor's image.
      Private Function TransparentColor(Optional Refresh As Boolean = False, Optional Replace As Boolean = False) As Color
         Try
            Static CurrentTransparentColor As Color = Color.White
            Static SettingsFile As String = ($"{My.Application.Info.Title}.ini")

            If Refresh Then
               If File.Exists(SettingsFile) Then
                  CurrentTransparentColor = Color.FromArgb(ToInt32(File.ReadAllText(SettingsFile).Trim(), fromBase:=16))
               End If
            ElseIf Replace Then
               With New ColorDialog
                  .Color = CurrentTransparentColor
                  If Not .ShowDialog = DialogResult.Cancel Then
                     CurrentTransparentColor = .Color
                     File.WriteAllText(SettingsFile, $"{CurrentTransparentColor.ToArgb:X}")
                  End If
               End With
            End If

            Return CurrentTransparentColor
         Catch ExceptionO As Exception
            DisplayException(ExceptionO)
         End Try

         Return Nothing
      End Function
   End Class
