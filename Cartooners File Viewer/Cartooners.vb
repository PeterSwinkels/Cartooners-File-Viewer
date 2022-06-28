'This class's imports and settings.
Option Compare Binary
Option Explicit On
Option Infer Off
Option Strict On

Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Diagnostics
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Environment
Imports System.IO
Imports System.Linq
Imports System.Text
Imports System.Windows.Forms

'This class contains the Cartooners related procedures.
Public Class CartoonersClass
   Inherits DataFileClass

   'This class defines the regions of data and code contained by the Cartooners executable.
   Private Class RegionClass
      Public Description As String   'Defines a region's description.
      Public Type As String          'Defines a region's type.
      Public Offset As Integer       'Defines a region's offset.
      Public Related As Integer      'Defines a related region's offset.
      Public Length As Integer       'Defines a region's length.
      Public EndO As Integer         'Defines a region's end.
   End Class

   'This enumeration lists the Cartooner's executable region's properties.
   Private Enum RegionPropertiesE As Integer
      Description   'A region's description.
      Type          'A region's type.
      Offset        'A region's offset.
      Related       'A related region's offset.
      Length        'A region's length.
      EndO          'A region's end.
   End Enum

   Private Const BYTES_PER_ROW As Integer = &HA0%               'Defines the number of bytes per pixel row.
   Private Const EXPECTED_NAME As String = "Cartoons.exe"       'Defines the Cartooners executable's expected file name.
   Private Const EXPECTED_PACKED_SIZE As Integer = &H36A5F%     'Defines the Cartooners executable's expected packed file size.
   Private Const EXPECTED_UNPACKED_SIZE As Integer = &H39F20%   'Defines the Cartooners executable's expected unpacked file size.
   Private Const MOUSE_CURSOR_SIZE As Integer = &H10%           'Defines the width and height of Cartooners' mouse pointers.
   Private Const RECTANGLE_SIZE As Integer = &H8%               'Defines the a rectangle's size.
   Private Const SCREEN_HEIGHT As Integer = &HC8%               'Defines the screen height used by Cartooners in pixels.
   Private Const SCREEN_WIDTH As Integer = &H140%               'Defines the screen width used by Cartooners in pixels.

   Private ReadOnly REGION_PROPERTY_DELIMITER As Char = ControlChars.Tab   'Defines the region property delimiter.

   'The menu items used by this class.
   Private WithEvents DisplayDataMenu As New ToolStripMenuItem With {.Text = "Display &Data"}
   Private WithEvents DisplayDataSubmenu As New ToolStripComboBox
   Private WithEvents DisplayDataTypeSubMenu As New ToolStripMenuItem With {.Text = "Data &Type"}
   Private WithEvents DisplayInformationMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F1, .Text = "Display &Information"}

   'This procedure initializes this class.
   Public Sub New(PathO As String, Optional DataFileMenu As ToolStripMenuItem = Nothing)
      Try
         Dim DataTypes As New List(Of String)((From Region In Regions() Select Region.Type).Distinct())
         Dim Descriptions As List(Of String) = Nothing
         Dim NewMenuItem As ToolStripMenuItem = Nothing

         If DataFile(CartoonersPath:=PathO).Data IsNot Nothing AndAlso DataFileMenu IsNot Nothing Then
            DataTypes.Sort()
            DataTypes.ForEach(Sub(DataType As String) DisplayDataTypeSubMenu.DropDownItems.Add(New ToolStripMenuItem With {.Text = $"&{DataType.Substring(0, 1).ToUpper()}{DataType.Substring(1)}"}))

            For Each SubMenu As ToolStripMenuItem In DisplayDataTypeSubMenu.DropDownItems
               Descriptions = New List(Of String)(From Region In Regions() Where Region.Type.ToLower() = SubMenu.Text.Substring(1).ToLower() Select Region.Description)
               Descriptions.Sort()
               For Each Description As String In Descriptions
                  NewMenuItem = New ToolStripMenuItem With {.Text = $"&{Description}"}
                  AddHandler NewMenuItem.Click, AddressOf RegionSelected
                  SubMenu.DropDownItems.Add(NewMenuItem)
               Next Description
            Next SubMenu

            With DataFileMenu
               .DropDownItems.Clear()
               .DropDownItems.AddRange({DisplayInformationMenu, DisplayDataTypeSubMenu})
               .Text = "&Cartooners"
               .Visible = True
            End With
         End If
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure checks whether the Cartooner's executable regions overlap and returns the result.
   Private Function CheckForRegionOverlap() As String
      Try
         Dim Overlaps As New StringBuilder

         For Each Region As RegionClass In Regions()
            For Each OtherRegion As RegionClass In Regions()
               If Region IsNot OtherRegion AndAlso Region.EndO > OtherRegion.Offset AndAlso Region.EndO <= OtherRegion.EndO Then
                  Overlaps.Append($"""{Region.Description} "" overlaps with ""{OtherRegion.Description}"".{NewLine}")
               End If
            Next OtherRegion
         Next Region

         Return Overlaps.ToString()
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedures manages the Cartooners executable's data file.
   Private Function DataFile(Optional CartoonersPath As String = Nothing) As DataFileStr
      Try
         Dim Overlaps As String = Nothing
         Static CurrentFile As New DataFileStr With {.Data = Nothing, .Path = Nothing}

         With CurrentFile
            If Not CartoonersPath = Nothing Then
               If Path.GetFileName(CartoonersPath).ToUpper() = EXPECTED_NAME.ToUpper() Then
                  If New FileInfo(CartoonersPath).Length = EXPECTED_PACKED_SIZE Then
                     .Data = UnpackExecutable(New List(Of Byte)(File.ReadAllBytes(CartoonersPath)))
                     If .Data.Count = EXPECTED_UNPACKED_SIZE Then
                        If BitConverter.ToUInt16(.Data.ToArray(), MSDOSHeaderE.Signature) = MSDOS_EXECUTABLE_SIGNATURE Then
                           .Path = CartoonersPath
                           EXEHeaderSize(Data:= .Data)
                           RelocationItems(Data:= .Data)

                           Overlaps = CheckForRegionOverlap()
                           If Not Overlaps = Nothing Then
                              UpdateDataBox(Overlaps)
                           Else
                              DisplayInformationMenu.PerformClick()
                           End If
                        Else
                           MessageBox.Show("Invalid MS-DOS executable signature.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                           .Data = Nothing
                        End If
                     Else
                        MessageBox.Show($"An error occurred during unpacking. Expected unpacked size: {EXPECTED_UNPACKED_SIZE} bytes. Actual unpacked size: { .Data.Count} bytes.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                        .Data = Nothing
                     End If
                  Else
                     MessageBox.Show($"Wrong size. Expected packed size: {EXPECTED_PACKED_SIZE} bytes.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                  End If
               Else
                  MessageBox.Show($"Wrong Cartooners executable name. Expected Cartooners executable name: ""{EXPECTED_NAME}"".", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Information)
               End If
            End If
         End With

         Return CurrentFile
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure displays the Cartooner's executable region with the specified description and data type.
   Private Sub DisplayRegion(Description As String, Type As String)
      Try
         Dim IconHeight As New Integer
         Dim IconType As New Integer
         Dim IconWidth As New Integer
         Dim Length As New Integer
         Dim NewText As New StringBuilder
         Dim Offset As New Integer
         Dim Palettes As List(Of List(Of Color)) = Nothing
         Dim Position As New Integer
         Dim Segment As New Integer

         For Each Region As RegionClass In Regions()
            If Region.Description.ToLower() = Description.ToLower() AndAlso Region.Type.ToLower() = Type.ToLower() Then
               Length = Region.Length
               Position = Region.Offset + EXEHeaderSize()
            End If
         Next Region

         If Position + Length > DataFile().Data.Count Then
            MessageBox.Show($"Attempting to read {(Position + Length) - DataFile().Data.Count} byte(s) beyond of the end of the available data at position {Position}.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Warning)
            Length = DataFile().Data.Count - Position
         End If

         NewText.Append($"[{Description}] ({Type}) At: {Position - EXEHeaderSize()} {NewLine}")
         Select Case Type.ToLower()
            Case "address"
               Offset = BitConverter.ToInt16(GetBytes(DataFile().Data, Position, Length).ToArray(), &H0%)
               Segment = BitConverter.ToInt16(GetBytes(DataFile().Data, Position, Length).ToArray(), &H2%)
               NewText.Append($"{Segment:X4}:{Offset:X4}")
            Case "binary", "image", "mousemask"
               NewText.Append($"{Escape(GetBytes(DataFile().Data, Position, Length), " "c, EscapeAll:=True).Trim()}")
            Case "icon"
               IconHeight = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position + &H2%)
               IconType = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position)
               IconWidth = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position + &H4%)

               NewText.Append($"Size: {IconWidth * 2} x {IconHeight} - Type: {IconType} {NewLine}{NewLine}")
               NewText.Append($"{Escape(GetBytes(DataFile().Data, Position, Length), " "c, EscapeAll:=True).Trim()}")
            Case "palette"
               Palettes = New List(Of List(Of Color))
               Palettes.Add(New List(Of Color)(GBRPalette(DataFile().Data, Position)))
               NewText.Append(GBRToText(, Palettes))
            Case "point"
               With New Point(BitConverter.ToUInt16(DataFile().Data.ToArray(), Position + &H2%), BitConverter.ToUInt16(DataFile().Data.ToArray(), Position))
                  NewText.Append($"x: { .X}, y: { .Y}{NewLine}")
               End With
            Case "rectangles"
               For Each RectangleO As Rectangle In GetRectangles(Position, Length)
                  With RectangleO
                     NewText.Append($"x: { .X}, y: { .Y} - width: { .Width}, height: { .Height}{NewLine}")
                  End With
               Next RectangleO
            Case "text"
               NewText.Append(Escape(ConvertMSDOSLineBreak(GetString(DataFile.Data, Position, Length)).Replace(DELIMITER, NewLine)))
         End Select

         UpdateDataBox(NewText.ToString())
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure displays the current Cartooners executable's information.
   Private Sub DisplayInformationMenu_Click(sender As Object, e As EventArgs) Handles DisplayInformationMenu.Click
      Try
         Dim NewText As New StringBuilder

         With DataFile()
            NewText.Append($"{ .Path}:{NewLine}")
            NewText.Append($"File size: {New FileInfo(.Path).Length} bytes.{NewLine}{NewLine}")
            NewText.Append(GetEXEHeaderInformation(.Data))

            UpdateDataBox(NewText.ToString())
         End With
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure exports the Cartooners executable's images.
   Public Overloads Sub Export(ExportPath As String)
      Try
         Dim BytesPerRow As New Integer
         Dim IconHeight As New Integer
         Dim IconSize As New Integer
         Dim IconWidth As New Integer
         Dim ImageO As Bitmap = Nothing

         ExportPath = Path.Combine(ExportPath, Path.GetFileNameWithoutExtension("Cartooners Executable"))
         Directory.CreateDirectory(ExportPath)

         File.WriteAllBytes(Path.Combine(ExportPath, "Cartoons.Unpacked.exe"), DataFile().Data.ToArray())

         For Each Region As RegionClass In Regions()
            With Region
               Select Case .Type
                  Case "icon"
                     IconHeight = BitConverter.ToUInt16(DataFile().Data.ToArray(), .Offset + EXEHeaderSize() + &H2%)
                     IconWidth = BitConverter.ToUInt16(DataFile().Data.ToArray(), .Offset + EXEHeaderSize() + &H4%)
                     BytesPerRow = If(IconWidth Mod PIXELS_PER_BYTE = 0, IconWidth \ PIXELS_PER_BYTE, (IconWidth + &H1%) \ PIXELS_PER_BYTE)
                     IconSize = BytesPerRow * IconHeight
                     Draw4BitImage(GetBytes(DataFile().Data, .Offset + EXEHeaderSize() + &H6%, IconSize), IconWidth, IconHeight, GBRPalette(DataFile().Data, .Related + EXEHeaderSize()), BytesPerRow).Save($"{Path.Combine(ExportPath, .Description)}.png", ImageFormat.Png)
                  Case "image"
                     Draw4BitImage(DecompressRLE(DataFile().Data, .Offset + EXEHeaderSize(), .Length), SCREEN_WIDTH, SCREEN_HEIGHT, GBRPalette(DataFile().Data, .Related + EXEHeaderSize()), BYTES_PER_ROW).Save($"{Path.Combine(ExportPath, .Description)}.png", ImageFormat.Png)
                  Case "mousemask"
                     MouseCursor(Region).Save($"{Path.Combine(ExportPath, .Description)}.png", ImageFormat.Png)
                  Case "rectangles"
                     ImageO = New Bitmap(SCREEN_WIDTH + 1, SCREEN_HEIGHT + 1)
                     Graphics.FromImage(ImageO).Clear(Color.White)
                     For Each RectangleO As Rectangle In GetRectangles(.Offset + EXEHeaderSize(), .Length)
                        Graphics.FromImage(ImageO).DrawRectangle(Pens.Black, RectangleO)
                     Next RectangleO
                     ImageO.Save($"{Path.Combine(ExportPath, .Description)} rectangles.png", Imaging.ImageFormat.Png)
               End Select
            End With
         Next Region

         ExportMap(ExportPath)
         ExportUnknownMap(ExportPath)

         Process.Start(New ProcessStartInfo With {.FileName = ExportPath, .WindowStyle = ProcessWindowStyle.Normal})
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure exports a map of the Cartooners executable.
   Private Sub ExportMap(ExportPath As String)
      Try
         Dim CurrentRegion As RegionClass = Nothing
         Dim Data As New List(Of Byte)(DataFile().Data)
         Dim Map As New StringBuilder
         Dim Position As Integer = &H0%
         Dim RelocationItemPositions As New List(Of Integer)(From Item As SegmentOffsetStr In RelocationItems() Select Item.FlatAddress)

         Data.RemoveRange(&H0%, EXEHeaderSize())

         Do Until Position >= Data.Count - &H1%
            CurrentRegion = Regions.FirstOrDefault(Function(Region As RegionClass) Region.Offset = Position)

            If CurrentRegion Is Nothing Then
               If RelocationItemPositions.Contains(Position) Then Map.Append("*"c)
               Map.Append($"{Data(Position):X2} ")
               Position += &H1%
            Else
               With CurrentRegion
                  Map.Append($"{NewLine}{NewLine}[BEGIN { .Description} ({ .Type})]{NewLine}")
                  If CurrentRegion.Type = "text" Then
                     Map.Append($"""{Escape(GetString(Data, .Offset, .Length).Replace("""", """""")).Replace(NewLine, "/0D/0A")}""")
                     Position += .Length
                  Else
                     For SubPosition As Integer = .Offset To (.Offset + .Length) - &H1%
                        If RelocationItemPositions.Contains(SubPosition) Then Map.Append("*"c)
                        Map.Append($"{Data(SubPosition):X2} ")
                        Position += &H1%
                     Next SubPosition
                  End If
                  Map.Append($"{NewLine}[END { .Description}]{NewLine}{NewLine}")
               End With
            End If
         Loop

         File.WriteAllText(Path.Combine(ExportPath, "Cartooners Executable Map.txt"), Map.ToString())
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure exports a map of the Cartooners executable's unknown parts.
   Private Sub ExportUnknownMap(ExportPath As String)
      Try
         Dim Buffer As New List(Of Byte)
         Dim CurrentRegion As RegionClass = Nothing
         Dim Data As New List(Of Byte)(DataFile().Data)
         Dim Map As New StringBuilder
         Dim Position As Integer = &H0%

         Data.RemoveRange(&H0%, EXEHeaderSize())

         Do Until Position >= Data.Count - &H1%
            CurrentRegion = Regions.FirstOrDefault(Function(Region As RegionClass) Region.Offset = Position)

            If CurrentRegion Is Nothing Then
               Buffer.Add(Data(Position))
               Position += &H1%
            Else
               If Buffer.Count > 0 Then
                  If Not (Buffer.Distinct.Count = 1 AndAlso Buffer.Distinct.First = &H0%) Then
                     Map.Append($"Position: {(Position - Buffer.Count) + EXEHeaderSize()}{NewLine}")
                     Map.Append($"Length: {Buffer.Count}{NewLine}")
                     Buffer.ForEach(Sub(ByteO As Byte) Map.Append($"{ByteO:X2} "))
                     Map.Append($"{NewLine}{NewLine}")
                  End If
                  Buffer.Clear()
               End If
               Position += CurrentRegion.Length
            End If
         Loop

         File.WriteAllText(Path.Combine(ExportPath, "Cartooners Executable Unknown Map.txt"), Map.ToString())
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure returns the rectangles in the specified data at the specified position.
   Private Function GetRectangles(Offset As Integer, Length As Integer) As List(Of Rectangle)
      Try
         Dim Rectangles As New List(Of Rectangle)
         Dim x1 As New Integer
         Dim y1 As New Integer
         Dim x2 As New Integer
         Dim y2 As New Integer

         For Position As Integer = Offset To Offset + (Length - RECTANGLE_SIZE) Step RECTANGLE_SIZE
            y1 = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position)
            x1 = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position + &H2%)
            y2 = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position + &H4%)
            x2 = BitConverter.ToUInt16(DataFile().Data.ToArray(), Position + &H6%)
            Rectangles.Add(New Rectangle(x1, y1, x2 - x1, y2 - y1))
         Next Position

         Return Rectangles
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure retrieves the mouse cursor at the specified position from the specified data.
   Private Function MouseCursor(Region As RegionClass) As Bitmap
      Try
         Dim Bit As New Boolean
         Dim Cursor As New Bitmap(MOUSE_CURSOR_SIZE, MOUSE_CURSOR_SIZE)
         Dim Mask As New List(Of Byte)(GetBytes(DataFile().Data, Region.Offset + EXEHeaderSize(), Region.Length))
         Dim TransparencyBit As New Boolean
         Dim TransparencyMask As New List(Of Byte)(GetBytes(DataFile().Data, Region.Related + EXEHeaderSize(), Region.Length))
         Dim x As Integer = 0
         Dim y As Integer = 0

         For ByteIndex As Integer = &H0% To &H1F% Step &H2%
            For BitIndex As Integer = &HF% To &H0% Step -1
               Bit = CBool((BitConverter.ToUInt16(Mask.ToArray(), ByteIndex) >> BitIndex) And &H1%)
               TransparencyBit = CBool((BitConverter.ToUInt16(TransparencyMask.ToArray(), ByteIndex) >> BitIndex) And &H1%)

               If TransparencyBit Then
                  Cursor.SetPixel(x, y, Color.Gray)
               Else
                  Cursor.SetPixel(x, y, If(Bit, Color.White, Color.Black))
               End If
               x += 1
            Next BitIndex
            x = 0
            y += 1
         Next ByteIndex

         Return Cursor
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure manages Cartooner's executable region information.
   Private Function Regions() As List(Of RegionClass)
      Try
         Dim Properties() As String = {}
         Dim RegionLines As List(Of String) = Nothing
         Static CurrentRegions As List(Of RegionClass) = Nothing

         If CurrentRegions Is Nothing Then
            CurrentRegions = New List(Of RegionClass)

            RegionLines = New List(Of String)(My.Resources.Cartooners_Executable.Split({NewLine}, StringSplitOptions.None))
            RegionLines.RemoveAt(0)
            For Each RegionLine As String In RegionLines
               If Not RegionLine.Trim() = Nothing Then
                  Properties = RegionLine.Split(REGION_PROPERTY_DELIMITER)
                  CurrentRegions.Add(New RegionClass With {.Description = Properties(RegionPropertiesE.Description), .Type = Properties(RegionPropertiesE.Type).Trim().ToLower(), .Offset = CInt(Properties(RegionPropertiesE.Offset)), .Related = CInt(Properties(RegionPropertiesE.Related)), .Length = CInt(Properties(RegionPropertiesE.Length)), .EndO = .Offset + .Length})
               End If
            Next RegionLine
         End If

         Return CurrentRegions
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure handles the region selections.
   Private Sub RegionSelected(sender As Object, e As EventArgs)
      Try
         Dim Description As String = DirectCast(sender, ToolStripMenuItem).Text.Substring(1)
         Dim Type As String = DirectCast(sender, ToolStripMenuItem).OwnerItem.Text.Substring(1)

         DisplayRegion(Description, Type)
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub
End Class
