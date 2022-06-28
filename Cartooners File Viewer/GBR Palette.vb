'This module's imports and settings.
Option Compare Binary
Option Explicit On
Option Infer Off
Option Strict On

Imports System
Imports System.Collections.Generic
Imports System.Convert
Imports System.Drawing
Imports System.Environment
Imports System.Text
Imports System.Windows.Forms

'This module contains the GBR palette related procedures.
Public Module GBRPaletteModule
   Public Const GBR_12_COLOR_DEPTH As Integer = &H10%   'Defines the number of colors in a 12bit GBR palette.
   Public Const GBR_12_COLOR_LENGTH As Integer = &H2%   'Defines the number of bytes per color in a 12bit GBR palette.

   Public ReadOnly ARGB_TO_GBR As Func(Of Color, Byte()) = Function(ARGB As Color) {ToByte(ToInt32(ARGB.G >> &H4%) << &H4% Or ToInt32(ARGB.B >> &H4%)), ToByte(ARGB.R >> &H4%)}   'This procedure converts the specified 24 bit ARGB color to a 12 bit GBR color.

   'This procedure reads the GBR palette from the specified data at the specified location.
   Public Function GBRPalette(Data As List(Of Byte), PaletteLocation As Integer) As List(Of Color)
      Try
         Dim Palette As New List(Of Color)

         For Position As Integer = PaletteLocation To PaletteLocation + ((GBR_12_COLOR_DEPTH - &H1%) * GBR_12_COLOR_LENGTH) Step GBR_12_COLOR_LENGTH
            Palette.Add(GBRToARGB(New List(Of Byte)({Data(Position), Data(Position + &H1%)})))
         Next Position

         Return Palette
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure converts the specified 12 bit GBR color to a 24 bit ARGB color.
   Public Function GBRToARGB(GBR As List(Of Byte)) As Color
      Try
         Dim Blue As Integer = GetNibble(GBR(&H0%), NibblesE.LowNibble)
         Dim Green As Integer = GetNibble(GBR(&H0%), NibblesE.HighNibble)
         Dim Red As Integer = GetNibble(GBR(&H1%), NibblesE.LowNibble)

         If Not GetNibble(GBR(&H1%), NibblesE.HighNibble) = &H0% Then
            MessageBox.Show("Invalid GBR color value.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
         End If

         Return Color.FromArgb((Red << &H4%) Or Red, (Green << &H4%) Or Green, (Blue << &H4%) Or Blue)
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure converts the specified palettes' data to hexadecimal output with descriptions.
   Public Function GBRToText(Optional Header As String = Nothing, Optional Palettes As List(Of List(Of Color)) = Nothing, Optional Descriptions As List(Of String) = Nothing) As String
      Try
         Dim GBRText As New StringBuilder

         If Header IsNot Nothing Then GBRText.Append($"{Header}{NewLine}{NewLine}")
         For Palette As Integer = 0 To Palettes.Count - 1
            If Descriptions IsNot Nothing Then GBRText.Append($"Palette - {Descriptions(Palette)}:{NewLine}")
            GBRText.Append($"I: R: G: B:{NewLine}")
            For Index As Integer = 0 To Palettes(Palette).Count - 1
               With Palettes(Palette)(Index)
                  GBRText.Append($"{Index,2}")
                  GBRText.Append($"{$"{ .R:X2}",3}")
                  GBRText.Append($"{$"{ .G:X2}",3}")
                  GBRText.Append($"{$"{ .B:X2}",3}{NewLine}")
               End With
            Next Index
            GBRText.Append(NewLine)
         Next Palette

         Return GBRText.ToString()
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function
End Module
