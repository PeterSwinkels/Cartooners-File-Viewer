'This class's imports and settings.
Option Compare Binary
Option Explicit On
Option Infer Off
Option Strict On

Imports System
Imports System.Collections.Generic
Imports System.Convert
Imports System.Linq

'This module contains the LZW decompression related procedures.
Public Module DecompressLZWModule
   'This procedure adds the specified entry to the specified LZW dictionary.
   Private Sub AddDictionaryEntry(Prefix As Integer, Suffix As Integer, ByRef DictionaryIndex As Integer, DictionaryO As List(Of LZWEntryStr))
      Try
         DictionaryO(DictionaryIndex) = New LZWEntryStr With {.Prefix = Prefix, .Suffix = Suffix}
         DictionaryIndex += &H1%
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try
   End Sub

   'This procedure creates and returns a new LZW dictionary.
   Private Function InitializeDictionary() As List(Of LZWEntryStr)
      Try
         Dim DictionaryO As List(Of LZWEntryStr) = Nothing

         DictionaryO = New List(Of LZWEntryStr)

         For Index As Integer = &H0% To LZW_MAXIMUM_ENTRIES - &H1%
            DictionaryO.Add(New LZWEntryStr With {.Prefix = -1, .Suffix = If(Index < LZW_START, Index, -1)})
         Next Index

         Return DictionaryO
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure decompresses the specified LZW data and returns the result.
   Public Function DecompressLZW(Compressed As List(Of Byte)) As List(Of Byte)
      Try
         Dim Buffer As New List(Of Byte)
         Dim Decompressed As New List(Of Byte)
         Dim DictionaryO As List(Of LZWEntryStr) = InitializeDictionary()
         Dim Parent As Integer = -1
         Dim BitsPerValue As Integer = &H9%
         Dim BitsUsed As Integer = &H0%
         Dim DictionaryIndex As Integer = LZW_SYMBOL_BASE
         Dim Literal As New Integer
         Dim Value As Integer = &H0%

         For Each ByteO As Byte In Compressed
            For Bit As Integer = &H0% To &H7%
               Value = Value Or ((ByteO >> Bit) And &H1%) << BitsUsed
               BitsUsed += &H1%
               If BitsUsed >= BitsPerValue Then
                  If Value = LZW_END Then
                     Exit For
                  ElseIf Value = LZW_START Then
                     DictionaryO = InitializeDictionary()
                     BitsPerValue = &H9%
                     DictionaryIndex = LZW_SYMBOL_BASE
                     Parent = -1
                  Else
                     If Value < DictionaryIndex Then
                        If Parent = -1 Then
                           Decompressed.Add(ToByte(Value))
                        Else
                           Buffer = GetBuffer(Value, DictionaryO)
                           Literal = Buffer.First
                           Decompressed.AddRange(Buffer)
                           AddDictionaryEntry(Parent, Literal, DictionaryIndex, DictionaryO)
                        End If
                     Else
                        Buffer = GetBuffer(Parent, DictionaryO)
                        Literal = Buffer.First
                        Decompressed.AddRange(Buffer)
                        Decompressed.Add(ToByte(Literal))
                        AddDictionaryEntry(Parent, Literal, DictionaryIndex, DictionaryO)
                     End If
                     Parent = Value
                  End If
                  BitsUsed = &H0%
                  Value = &H0%
                  If (&H1% << BitsPerValue) = DictionaryIndex AndAlso DictionaryIndex < LZW_MAXIMUM_ENTRIES Then BitsPerValue += &H1%
               End If
            Next Bit
         Next ByteO

         Return Decompressed
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure decompresses a sequence of LZW literals and returns the result.
   Private Function GetBuffer(Value As Integer, DictionaryO As List(Of LZWEntryStr)) As List(Of Byte)
      Try
         Dim Buffer As New List(Of Byte)

         Do While Value > LZW_START
            Buffer.Add(ToByte(DictionaryO(Value).Suffix And &HFF%))
            Value = DictionaryO(Value).Prefix
         Loop

         Buffer.Add(ToByte(Value And &HFF%))
         Buffer.Reverse()

         Return Buffer
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function
End Module
