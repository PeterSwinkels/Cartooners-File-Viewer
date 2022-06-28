'This class's imports and settings.
Option Compare Binary
Option Explicit On
Option Infer Off
Option Strict On

Imports System
Imports System.Collections.Generic
Imports System.Convert

'This module contains the LZW compression related procedures.
Public Module CompressLZWModule
   'This procedure adds the specified value to the specified compressed data.
   Private Sub AddToCompressed(Compressed As List(Of Byte), BitCount As Integer, Value As Integer, ByRef Bits As Integer, ByRef Buffer As Integer)
      Try
         Buffer = Buffer Or (Value << Bits)
         Bits += BitCount
         While Bits > &H7%
            Compressed.Add(ToByte(Buffer And &HFF%))
            Buffer = Buffer >> &H8%
            Bits -= &H8%
         End While
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure compresses the specified data and returns the result.
   Public Function CompressLZW(Uncompressed As List(Of Byte)) As List(Of Byte)
      Try
         Dim BitCount As Integer = &H9%
         Dim Bits As Integer = &H0%
         Dim Buffer As New Integer
         Dim Compressed As New List(Of Byte)
         Dim LZWDictionary As Dictionary(Of Integer, LZWEntryStr) = InitializeDictionary()
         Dim PreviousValue As Integer = LZW_NO_VALUE

         AddToCompressed(Compressed, BitCount, LZW_START, Bits, Buffer)
         For Each Value As Byte In Uncompressed
            If LZWDictionary.ContainsValue(New LZWEntryStr With {.Prefix = PreviousValue, .Suffix = Value}) Then
               For Each KeyO As Integer In LZWDictionary.Keys
                  If LZWDictionary.Item(KeyO).Prefix = PreviousValue AndAlso LZWDictionary.Item(KeyO).Suffix = Value Then
                     PreviousValue = KeyO
                     Exit For
                  End If
               Next KeyO
            Else
               AddToCompressed(Compressed, BitCount, PreviousValue, Bits, Buffer)
               If LZWDictionary.Count >= LZW_MAXIMUM_ENTRIES Then
                  AddToCompressed(Compressed, BitCount, LZW_START, Bits, Buffer)
                  LZWDictionary = InitializeDictionary()
                  BitCount = &H9%
               Else
                  LZWDictionary.Add(LZWDictionary.Count, New LZWEntryStr With {.Prefix = PreviousValue, .Suffix = Value})
                  If LZWDictionary.Count > (&H1% << BitCount) Then BitCount += &H1%
               End If
               PreviousValue = Value
            End If
         Next Value

         If Not PreviousValue = LZW_NO_VALUE Then AddToCompressed(Compressed, BitCount, PreviousValue, Bits, Buffer)
         AddToCompressed(Compressed, BitCount, LZW_END, Bits, Buffer)
         If Bits > &H0% Then Compressed.Add(ToByte(Buffer And &HFF%))

         Return Compressed
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure creates and returns a new LZW dictionary.
   Private Function InitializeDictionary() As Dictionary(Of Integer, LZWEntryStr)
      Try
         Dim LZWDictionary As New Dictionary(Of Integer, LZWEntryStr)

         For LZWIndex As Integer = &H0% To LZW_END
            LZWDictionary.Add(LZWIndex, New LZWEntryStr With {.Prefix = LZW_NO_VALUE, .Suffix = (LZWIndex And &HFF%)})
         Next LZWIndex

         Return LZWDictionary
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function
End Module
