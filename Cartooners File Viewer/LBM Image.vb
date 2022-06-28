'This class's imports and settings.
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

'This class contains the LBM image related procedures.
Public Class LBMImageClass
   Inherits DataFileClass

   'This structure defines an IFF record.
   Private Structure IFFRecordStr
      Public Identifier As String   'Defines an IFF record's identifier.
      Public Offset As Integer      'Defines an IFF record's offset within its file.
      Public Size As Integer        'Defines an IFF record's size.
      Public Recognized As Boolean  'Indicates whether or not this program recognized the record's identifier.
   End Structure

   'This structure defines a LBM file's information.
   Private Structure FileStr
      Public BitsPerPixel As Integer               'Defines the number of bits per pixel.
      Public Data As List(Of Byte)                 'Defines the file's data.
      Public ImageO As Bitmap                      'Defines the file's image.
      Public IFFFileSize As Integer                'Defines the file's size.
      Public IFFIdentifier As String               'Defines the IFF identifier.
      Public IFFRecords As List(Of IFFRecordStr)   'Defines the list of IFF records in the file.
      Public IFFType As String                     'Defines the IFF type.
      Public IsCompressed As Boolean               'Indicates whether or not the image is compressed.
      Public Palette As List(Of Color)             'Defines the image's palette.
      Public Path As String                        'Defines the file's path.
      Public Thumbnail As Bitmap                   'Defines the thumbnail.
   End Structure

   Private Const BODY_IFF_RECORD As String = "BODY"                  'Indicates that an IFF record contains pixel data.
   Private Const BMHD_IFF_RECORD As String = "BMHD"                  'Indicates that an IFF record contains a header.
   Private Const BMHD_IFF_RECORD_SIZE As Integer = &H14%             'Defines a BMHD IFF record's size.
   Private Const CMAP_IFF_RECORD As String = "CMAP"                  'Indicates that an IFF record contains a palette.
   Private Const CRNG_IFF_RECORD As String = "CRNG"                  'Indicates that an IFF record contains a color range.
   Private Const GRAB_IFF_RECORD As String = "GRAB"                  'Indicates that an IFF record contains a hotspot.
   Private Const IFF_IDENTIFIER As String = "FORM"                   'Indicates that an IFF file contains an image.
   Private Const IFF_TYPE As String = "ILBM"                         'Indicates that an IFF file contains an interleaved bitmap image.
   Private Const LBM_4_BIT As Byte = &H4%                            'Indicates that an LBM file uses 4 bits per pixel.
   Private Const LBM_4_BIT_PIXELS_PER_BYTE As Integer = &H2%         'Defines the number of pixels per byte for a 4 bits per pixel image.
   Private Const LBM_4_BIT_CMPA_IFF_RECORD_SIZE As Integer = &H30%   'Defines a CMAP IFF record's size for a 4 bits per pixel image.
   Private Const LBM_4_BIT_COLOR_DEPTH As Byte = &H10%               'Defines the number of colors in a 4 bits per pixel image.
   Private Const TINY_IFF_RECORD As String = "TINY"                  'Indicates that an IFF record contains a thumbnail.
   Private Const UNCOMPRESSED As Integer = &H0%                      'Indicates that an image is uncompressed.

   'The menu items used by this class.
   Private WithEvents DisplayIFFRecordsMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F1, .Text = "Display IFF &Records"}
   Private WithEvents DisplayInformationMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F2, .Text = "Display &Information"}
   Private WithEvents DisplayPaletteMenu As New ToolStripMenuItem With {.ShortcutKeys = Keys.F3, .Text = "Display &Palette"}

   'This procedure initializes this class.
   Public Sub New(ByRef PathO As String, Optional DataFileMenu As ToolStripMenuItem = Nothing)
      Try
         Dim ImportedImagePath As String = PathO

         If Not Array.IndexOf({".bbm", ".iff", ".lbm"}, Path.GetExtension(PathO).ToLower()) >= 0 Then
            ImportedImagePath = Import(PathO)
            If ImportedImagePath Is Nothing Then MessageBox.Show(String.Format("Could not import the image ""{0}"".", PathO), My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Information)
            PathO = ImportedImagePath
         End If

         If PathO IsNot Nothing AndAlso FileData(LBMFilePath:=PathO).Data.Count > 0 AndAlso DataFileMenu IsNot Nothing Then
            With DataFileMenu
               .DropDownItems.Clear()
               .DropDownItems.AddRange({DisplayIFFRecordsMenu, DisplayInformationMenu, DisplayPaletteMenu})
               .Text = "&LBM"
               .Visible = True
            End With
         End If
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure decompresses the data read from the specified file handle.
   Private Function Decompress(BytesPerRow As Integer, DataStream As BinaryReader) As List(Of Byte)
      Try
         Dim ByteO As New Integer
         Dim Data As New Byte
         Dim Decompressed As New List(Of Byte)

         Do Until (Decompressed.Count >= BytesPerRow) OrElse (DataStream.BaseStream.Position >= DataStream.BaseStream.Length)
            ByteO = DataStream.ReadByte()
            Select Case ByteO
               Case &H0% To &H7F%
                  Decompressed.AddRange(DataStream.ReadBytes(ByteO + &H1%))
               Case &H81% To &HFF%
                  ByteO = &H100% - ByteO
                  Data = DataStream.ReadByte()
                  For Index As Integer = &H0% To ByteO
                     Decompressed.Add(Data)
                  Next Index
            End Select
         Loop

         Return Decompressed
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure displays the current LBM file's IFF records.
   Private Sub DisplayIFFRecordsMenu_Click(sender As Object, e As EventArgs) Handles DisplayIFFRecordsMenu.Click
      Try
         Dim NewText As New StringBuilder

         NewText.Append($"IFF records:{NewLine}")

         For Each IFFRecord As IFFRecordStr In FileData.IFFRecords
            With IFFRecord
               NewText.Append($"{NewLine}IFF record identifier: { .Identifier}{NewLine}")
               NewText.Append($"Recognized: { .Recognized}{NewLine}")
               NewText.Append($"Offset: { .Offset}{NewLine}")
               NewText.Append($"Size: { .Size}{NewLine}")
               NewText.Append(Escape(GetString(FileData().Data, .Offset, (.Size - &H1%)), " "c, EscapeAll:=True).Trim())
               NewText.Append(NewLine)
            End With
         Next IFFRecord

         UpdateDataBox(NewText.ToString())
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure displays the current LBM file's information.
   Private Sub DisplayInformationMenu_Click(sender As Object, e As EventArgs) Handles DisplayInformationMenu.Click
      Try
         With New StringBuilder
            .Append($"General information:{NewLine}")
            .Append($"-Path: {FileData().Path}{NewLine}")
            .Append($"-IFF file size: {FileData().IFFFileSize}{NewLine}")
            .Append($"-IFF identifier: {FileData().IFFIdentifier}{NewLine}")
            .Append($"-IFF type: {FileData().IFFType}{NewLine}")
            .Append($"-Bits per pixel: {FileData().BitsPerPixel}{NewLine}")
            .Append($"-Compressed: {FileData().IsCompressed}{NewLine}")
            .Append($"-Width: {FileData().ImageO.Width}{NewLine}")
            .Append($"-Height: {FileData().ImageO.Height}")
            UpdateDataBox(.ToString())
         End With
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure displays the current LBM file's palette.
   Private Sub DisplayPaletteMenu_Click(sender As Object, e As EventArgs) Handles DisplayPaletteMenu.Click
      Try
         UpdateDataBox(GBRToText("The LBM image's palette:", New List(Of List(Of Color))({FileData.Palette})))
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure exports the current image.
   Public Overloads Sub Export(ExportPath As String)
      Try
         ExportPath = Path.Combine(ExportPath, Path.GetFileNameWithoutExtension(FileData().Path))

         FileData.ImageO.Save($"{ExportPath}.png")
         If FileData.Thumbnail IsNot Nothing Then FileData.Thumbnail.Save($"{ExportPath}.thumbnail.png")

         Process.Start(New ProcessStartInfo With {.FileName = Path.GetDirectoryName(ExportPath), .WindowStyle = ProcessWindowStyle.Normal})
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure manages the LBM file's data.
   Private Function FileData(Optional LBMFilePath As String = Nothing) As FileStr
      Try
         Dim FilePosition As New Long
         Dim IFFRecord As New IFFRecordStr
         Static LBMFile As New FileStr

         If Not LBMFilePath = Nothing Then
            With LBMFile
               .Data = New List(Of Byte)(File.ReadAllBytes(LBMFilePath))
               .IFFRecords = New List(Of IFFRecordStr)
               Using DataStream As New BinaryReader(New MemoryStream(.Data.ToArray()))
                  .IFFIdentifier = DataStream.ReadChars(&H4%)
                  .IFFFileSize = GetBENumberFromBytes(DataStream.ReadBytes(&H4%).ToList())
                  .IFFType = DataStream.ReadChars(&H4%)

                  If .IFFIdentifier = IFF_IDENTIFIER AndAlso .IFFType = IFF_TYPE Then
                     Do While DataStream.BaseStream.Position < DataStream.BaseStream.Length - &H1%
                        IFFRecord = New IFFRecordStr With {.Offset = CInt(DataStream.BaseStream.Position), .Identifier = DataStream.ReadChars(&H4%), .Size = GetBENumberFromBytes(DataStream.ReadBytes(&H4%).ToList())}
                        IFFRecord.Recognized = (Array.IndexOf({BMHD_IFF_RECORD, BODY_IFF_RECORD, CMAP_IFF_RECORD, CRNG_IFF_RECORD, GRAB_IFF_RECORD, TINY_IFF_RECORD}, IFFRecord.Identifier) >= 0)
                        .IFFRecords.Add(IFFRecord)
                        FilePosition = DataStream.BaseStream.Position()
                        Select Case IFFRecord.Identifier
                           Case BMHD_IFF_RECORD
                              .ImageO = New Bitmap(GetBENumberFromBytes(DataStream.ReadBytes(&H2%).ToList()), GetBENumberFromBytes(DataStream.ReadBytes(&H2%).ToList()))
                              DataStream.BaseStream.Seek(&H4%, SeekOrigin.Current)
                              .BitsPerPixel = DataStream.ReadByte()
                              DataStream.BaseStream.Seek(&H1%, SeekOrigin.Current)
                              .IsCompressed = CBool(DataStream.ReadByte())
                              DataStream.BaseStream.Seek(&H9%, SeekOrigin.Current)
                              If Array.IndexOf({&H1%, &H4%, &H8%}, .BitsPerPixel) < 0 Then Exit Do
                           Case BODY_IFF_RECORD
                              .ImageO = GetImage(.ImageO.Width, .ImageO.Height, .BitsPerPixel, .IsCompressed, .Palette, IFFRecord, DataStream)
                           Case CMAP_IFF_RECORD
                              .Palette = New List(Of Color)

                              For Index As Integer = 0 To (&H1% << .BitsPerPixel) - &H1%
                                 .Palette.Add(Color.FromArgb(DataStream.ReadByte(), DataStream.ReadByte(), DataStream.ReadByte()))
                              Next Index
                           Case TINY_IFF_RECORD
                              .Thumbnail = New Bitmap(GetBENumberFromBytes(DataStream.ReadBytes(&H2%).ToList()), GetBENumberFromBytes(DataStream.ReadBytes(&H2%).ToList()))
                              .Thumbnail = GetImage(.Thumbnail.Width, .Thumbnail.Height, .BitsPerPixel, .IsCompressed, .Palette, IFFRecord, DataStream)
                        End Select

                        DataStream.BaseStream.Seek(FilePosition + IFFRecord.Size, SeekOrigin.Begin)
                     Loop
                  End If
               End Using

               .Path = LBMFilePath
            End With

            DisplayInformationMenu.PerformClick()
         End If

         Return LBMFile
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure returns an image inside an IFF record.
   Private Function GetImage(Width As Integer, Height As Integer, BitsPerPixel As Integer, IsCompressed As Boolean, Palette As List(Of Color), IFFRecord As IFFRecordStr, DataStream As BinaryReader) As Bitmap
      Try
         Dim BitPlaneWidth As New Integer
         Dim Bits As New List(Of Byte)
         Dim ColorIndex As New Integer
         Dim ImageO As New Bitmap(Width, Height)
         Dim UnpaddedBitmapSize As New Integer

         BitPlaneWidth = If(ImageO.Width Mod &H8% = &H0%, CInt(ImageO.Width / &H8%), (ImageO.Width \ &H8%) + &H1%)
         If IsCompressed Then
            If Not (BitPlaneWidth Mod &H2% = &H0%) Then BitPlaneWidth += &H1%
         Else
            UnpaddedBitmapSize = (ImageO.Height * (BitsPerPixel * BitPlaneWidth))
            If UnpaddedBitmapSize < IFFRecord.Size Then BitPlaneWidth += CInt(((IFFRecord.Size - UnpaddedBitmapSize) / ImageO.Height) / BitsPerPixel)
         End If

         For y As Integer = 0 To ImageO.Height - 1
            Bits.Clear()
            Bits.AddRange(If(IsCompressed, Decompress(BitPlaneWidth * BitsPerPixel, DataStream).ToArray(), DataStream.ReadBytes(BitPlaneWidth * BitsPerPixel)))
            For x As Integer = 0 To ImageO.Width - 1
               ColorIndex = &H0%
               For BitPlane As Integer = &H0% To BitsPerPixel - &H1%
                  ColorIndex = ColorIndex Or (GET_BIT(Bits((BitPlane * BitPlaneWidth) + (x \ &H8%)), &H7% - (x Mod &H8%)) << BitPlane)
               Next BitPlane
               ImageO.SetPixel(x, y, Palette(ColorIndex))
            Next x
         Next y

         Return ImageO
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procudure converts the specified image to a 4 bit color image and returns the resulting color indexes.
   Private Function GetIndexes(ImageO As Bitmap, ARGBPalette As List(Of Color), ByRef PlaneWidth As Integer) As List(Of Byte)
      Try
         Dim BestMatch As New Integer
         Dim BytesPerRow As New Integer
         Dim Difference As New Integer
         Dim Indexes As New List(Of Byte)
         Dim LeastDifference As New Integer
         Dim NewIndexes As New Integer

         With ImageO
            PlaneWidth = .Width
            PlaneWidth += (PlaneWidth - ((PlaneWidth \ LBM_4_BIT_PIXELS_PER_BYTE) * LBM_4_BIT_PIXELS_PER_BYTE))
            BytesPerRow = PlaneWidth \ LBM_4_BIT_PIXELS_PER_BYTE

            For y As Integer = 0 To .Height - 1
               For x As Integer = 0 To (BytesPerRow * LBM_4_BIT_PIXELS_PER_BYTE) - 1
                  If x < PlaneWidth Then
                     LeastDifference = &H100%
                     For Index As Integer = &H0% To LBM_4_BIT_COLOR_DEPTH - &H1%
                        Difference = COLOR_DIFFERENCE(If(x < .Width, .GetPixel(x, y), Color.Black), ARGBPalette(Index))
                        If Difference <= LeastDifference Then
                           BestMatch = Index
                           LeastDifference = Difference
                        End If
                     Next Index

                     NewIndexes = SetNibble(NewIndexes, BestMatch, If(x Mod LBM_4_BIT_PIXELS_PER_BYTE = &H0%, NibblesE.HighNibble, NibblesE.LowNibble))

                     If Not x Mod LBM_4_BIT_PIXELS_PER_BYTE = &H0% Then
                        Indexes.Add(ToByte(NewIndexes))
                        NewIndexes = &H0%
                     End If
                  End If
               Next x
            Next y
         End With

         Return Indexes
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure imports the specified image file and saves it in the LBM file format.
   Private Function Import(ImportPath As String) As String
      Try
         Dim BitmapO As New Bitmap(ImportPath)
         Dim BitPlaneWidth As New Integer
         Dim Bits() As Byte = Nothing
         Dim BitX As New Integer
         Dim BytesPerRow As New Integer
         Dim Color1 As Integer = 0
         Dim ColorList As New List(Of Color)
         Dim Data As New List(Of Byte)
         Dim Difference As New Integer
         Dim Image4Bit As New List(Of Byte)
         Dim ImageO As New Bitmap(BitmapO.Width, BitmapO.Height)
         Dim Index As New Integer
         Dim LBMBodyIFFRecordSize As New Integer
         Dim LBMBytesPerRow As New Integer
         Dim LBMImagePath As String = $"{Path.Combine(Path.GetDirectoryName(ImportPath), Path.GetFileNameWithoutExtension(ImportPath))}.lbm"
         Dim LeastDifference As Integer = Integer.MaxValue
         Dim NewColor As New Color
         Dim PlaneWidth As New Integer

         With BitmapO
            Graphics.FromImage(ImageO).DrawImage(DirectCast(BitmapO, Image), .GetBounds(GraphicsUnit.Pixel), ImageO.GetBounds(GraphicsUnit.Pixel), GraphicsUnit.Pixel)
         End With

         With ImageO
            BytesPerRow = If(.Width Mod LBM_4_BIT_PIXELS_PER_BYTE = &H0%, .Width \ LBM_4_BIT_PIXELS_PER_BYTE, (.Width + 1) \ LBM_4_BIT_PIXELS_PER_BYTE)
            LBMBytesPerRow = If(.Width Mod LBM_4_BIT_PIXELS_PER_BYTE = &H0%, CInt(.Width / LBM_4_BIT_PIXELS_PER_BYTE), (.Width \ LBM_4_BIT_PIXELS_PER_BYTE) + &H1%)
            If Not LBMBytesPerRow Mod LBM_4_BIT = &H0% Then LBMBytesPerRow = ((LBMBytesPerRow \ LBM_4_BIT) * LBM_4_BIT) + LBM_4_BIT
            LBMBodyIFFRecordSize = LBMBytesPerRow * .Height
            BitPlaneWidth = LBMBytesPerRow \ LBM_4_BIT

            For y As Integer = 0 To .Height - 1
               For x As Integer = 0 To .Width - 1
                  If Not ColorList.Contains(.GetPixel(x, y)) Then ColorList.Add(.GetPixel(x, y))
               Next x
            Next y

            Do While ColorList.Count >= LBM_4_BIT_COLOR_DEPTH
               For Color2 As Integer = 0 To ColorList.Count - 1
                  If Not Color1 = Color2 Then
                     Difference = COLOR_DIFFERENCE(ColorList(Color1), ColorList(Color2))
                     If Difference <= LeastDifference Then
                        Index = Color2
                        LeastDifference = Difference
                        If LeastDifference = &H0% Then Exit For
                     End If
                  End If
               Next Color2

               With ColorList(Color1)
                  NewColor = Color.FromArgb(CInt((CInt(.R) + CInt(ColorList(Index).R)) \ 2), CInt((CInt(.G) + CInt(ColorList(Index).G)) \ 2), CInt((CInt(.B) + CInt(ColorList(Index).B)) \ 2))
               End With
               ColorList.RemoveAt(Color1)
               If Index > Color1 Then Index -= 1
               ColorList.RemoveAt(Index)
               ColorList.Add(NewColor)
               If Color1 >= ColorList.Count - 1 Then Color1 = 0 Else Color1 += 1
            Loop

            Do Until ColorList.Count = LBM_4_BIT_COLOR_DEPTH
               ColorList.Add(Color.Black)
            Loop
         End With

         Image4Bit = GetIndexes(ImageO, ColorList, PlaneWidth)

         With Data
            .AddRange(TEXT_TO_BYTES(IFF_IDENTIFIER))
            .AddRange(NumberToBENumberBytes(BMHD_IFF_RECORD_SIZE + LBM_4_BIT_CMPA_IFF_RECORD_SIZE + LBMBodyIFFRecordSize + &H18%, &H4%))
            .AddRange(TEXT_TO_BYTES((IFF_TYPE)))

            .AddRange(TEXT_TO_BYTES((BMHD_IFF_RECORD)))
            .AddRange(NumberToBENumberBytes(BMHD_IFF_RECORD_SIZE, &H4%))
            .AddRange(NumberToBENumberBytes(ImageO.Width, &H2%))
            .AddRange(NumberToBENumberBytes(ImageO.Height, &H2%))
            .AddRange(TEXT_TO_BYTES(New String(ControlChars.NullChar, &H4%)))
            .AddRange({LBM_4_BIT, &H0%, UNCOMPRESSED})
            .AddRange(TEXT_TO_BYTES(New String(ControlChars.NullChar, &H9%)))

            .AddRange(TEXT_TO_BYTES(CMAP_IFF_RECORD))
            .AddRange(NumberToBENumberBytes(LBM_4_BIT_CMPA_IFF_RECORD_SIZE, &H4%))

            ColorList.ForEach(Sub(ColorO As Color) .AddRange({ColorO.R, ColorO.G, ColorO.B}))

            .AddRange(TEXT_TO_BYTES((BODY_IFF_RECORD)))
            .AddRange(NumberToBENumberBytes(LBMBodyIFFRecordSize, &H4%))
            For y As Integer = 0 To ImageO.Height - 1
               ReDim Bits(0 To (BitPlaneWidth * LBM_4_BIT) - 1)
               For x As Integer = 0 To PlaneWidth - 1
                  For BitPlane As Integer = &H0% To LBM_4_BIT - &H1%
                     BitX = (BitPlane * BitPlaneWidth) + (x \ &H8%)
                     Bits(BitX) = SET_BIT(Bits(BitX), &H7% - (x Mod &H8%), GET_BIT(Image4Bit((y * (PlaneWidth \ LBM_4_BIT_PIXELS_PER_BYTE)) + (x \ LBM_4_BIT_PIXELS_PER_BYTE)), If(x Mod LBM_4_BIT_PIXELS_PER_BYTE = &H0%, &H4% + BitPlane, BitPlane)))
                  Next BitPlane
               Next x
               .AddRange(Bits)
            Next y
         End With

         File.WriteAllBytes(LBMImagePath, Data.ToArray())

         BitmapO.Dispose()
         ImageO.Dispose()

         Return LBMImagePath
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function
End Class
