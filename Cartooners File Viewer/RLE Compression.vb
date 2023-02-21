'This module's imports and settings.
Option Compare Binary
Option Explicit On
Option Infer Off
Option Strict On

Imports System
Imports System.Collections.Generic
Imports System.Convert
Imports System.Linq
Imports System.Windows.Forms

'This procedure contains the RLE compression procedures for image color indexes.
Public Module RLECompressionModule
   'This enumeration lists the RLE compression levels.
   Private Enum RLECompressionLevelsE As Integer
      RLEByte4   'Defines a run of a single byte repeated for a specific number (x4) of times.
      RLEDWord   'Defines a run of a single dword repeated for a specific number of times.
      RLEByte1   'Defines a run of a single byte repeated for a specific number (x1) of times.
      RLEBytes   'Defines a run of bytes of a specific length.
   End Enum


   Private Const MAXIMUM_RUN_ELEMENT_COUNT As Integer = &H40%   'Defines the maximum number of elements allowed in a run.
   Private Const RLE_BYTE1 As Integer = &H40%                   'Defines a run of a single byte repeated for a specific number (x1) of times.
   Private Const RLE_BYTE4 As Integer = &HC0%                   'Defines a run of a single byte repeated for a specific number (x4) of times.
   Private Const RLE_BYTES As Integer = &H0%                    'Defines a run of bytes of a specific length.
   Private Const RLE_COUNT_MASK As Integer = &H3F%              'Defines the bits representing a run's element count.
   Private Const RLE_DWORD As Integer = &H80%                   'Defines a run of a single dword repeated for a specific number of times.
   Private Const RLE_LEVEL_MASK As Integer = &HC0%              'Defines the bits representing a run's compression level.

   'This procedure returns the specified color indexes compressed using RLE compression.
   Public Function CompressRLE(Indexes As List(Of Byte)) As List(Of Byte)
      Try
         Dim Compressed As New List(Of Byte)
         Dim Incompressible As New List(Of Byte)
         Dim Position As Integer = &H0%
         Dim RunLengths(0 To 2) As Integer

         Do While Position < Indexes.Count
            RunLengths(RLECompressionLevelsE.RLEByte4) = DetermineRunLength(Indexes, Position, ElementSize:=&H1%, Multiplier:=&H4%)
            RunLengths(RLECompressionLevelsE.RLEDWord) = DetermineRunLength(Indexes, Position, ElementSize:=&H4%, Multiplier:=&H1%)
            RunLengths(RLECompressionLevelsE.RLEByte1) = DetermineRunLength(Indexes, Position, ElementSize:=&H1%, Multiplier:=&H1%)

            If RunLengths(RLECompressionLevelsE.RLEByte4) >= &H4% AndAlso RunLengths(RLECompressionLevelsE.RLEByte4) > RunLengths(RLECompressionLevelsE.RLEDWord) AndAlso RunLengths(RLECompressionLevelsE.RLEByte4) > RunLengths(RLECompressionLevelsE.RLEByte1) Then
               MoveIncompressible(Incompressible, Compressed)
               Compressed.Add(ToByte(RLE_BYTE4 Or (CInt(RunLengths(RLECompressionLevelsE.RLEByte4) >> &H2%) - &H1%)))
               Compressed.Add(Indexes(Position))
               Position += RunLengths(RLECompressionLevelsE.RLEByte4)
            Else
               If RunLengths(RLECompressionLevelsE.RLEDWord) >= &H2% AndAlso RunLengths(RLECompressionLevelsE.RLEDWord) > RunLengths(RLECompressionLevelsE.RLEByte4) AndAlso RunLengths(RLECompressionLevelsE.RLEDWord) > RunLengths(RLECompressionLevelsE.RLEByte1) Then
                  MoveIncompressible(Incompressible, Compressed)
                  Compressed.Add(ToByte(RLE_DWORD Or (RunLengths(1) - &H1%)))
                  Compressed.AddRange(GetBytes(Indexes, Position, Count:=&H4%))
                  Position += (RunLengths(1) * &H4%)
               Else
                  If RunLengths(RLECompressionLevelsE.RLEByte1) >= &H3% AndAlso RunLengths(RLECompressionLevelsE.RLEByte1) > RunLengths(RLECompressionLevelsE.RLEByte4) AndAlso RunLengths(RLECompressionLevelsE.RLEByte1) > RunLengths(RLECompressionLevelsE.RLEDWord) Then
                     MoveIncompressible(Incompressible, Compressed)
                     Compressed.Add(ToByte(RLE_BYTE1 Or (RunLengths(2) - &H1%)))
                     Compressed.Add(Indexes(Position))
                     Position += RunLengths(2)
                  Else
                     Incompressible.Add(Indexes(Position))
                     If Incompressible.Count = MAXIMUM_RUN_ELEMENT_COUNT OrElse Position = Indexes.Count - &H1% Then MoveIncompressible(Incompressible, Compressed)
                     Position += &H1%
                  End If
               End If
            End If
         Loop

         Return Compressed
      Catch ExceptionO As Exception
         DisplayException(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure returns the specified color indexes decompressed using RLE decompression.
   Public Function DecompressRLE(Compressed As List(Of Byte), Offset As Integer, Size As Integer) As List(Of Byte)
      Try
         Dim Decompressed As New List(Of Byte)
         Dim Instruction As New Integer
         Dim Position As Integer = Offset
         Dim RunLength As New Integer

         Decompressed.Clear()
         Do While Position < Offset + Size
            Instruction = Compressed(Position)
            Position += &H1%
            RunLength = (Instruction And RLE_COUNT_MASK) + &H1%

            Select Case Instruction And RLE_LEVEL_MASK
               Case RLE_BYTES
                  Decompressed.AddRange(Compressed.GetRange(Position, RunLength))
                  Position += RunLength
               Case RLE_BYTE1
                  Decompressed.AddRange(Enumerable.Repeat(Compressed(Position), RunLength))
                  Position += &H1%
               Case RLE_DWORD
                  If RunLength > &H1% Then
                     For DWord As Integer = &H1% To RunLength
                        Decompressed.AddRange(Compressed.GetRange(Position, &H4%))
                     Next DWord
                     Position += &H4%
                  Else
                     MessageBox.Show($"Invalid instruction found at position {Position:X} while decompressing data.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                     Exit Do
                  End If
               Case RLE_BYTE4
                  Decompressed.AddRange(Enumerable.Repeat(Compressed(Position), RunLength * &H4%))
                  Position += &H1%
            End Select
         Loop

         If Position > Offset + Size Then MessageBox.Show($"The RLE decompressor read {Position - (Offset + Size):X} byte(s) more than specified.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Warning)

         Return Decompressed
      Catch ExceptionO As Exception
         DisplayException(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure returns the run-length for the color indexes at the specified position.
   Private Function DetermineRunLength(Indexes As List(Of Byte), Offset As Integer, ElementSize As Integer, Multiplier As Integer) As Integer
      Try
         Dim Position As Integer = Offset
         Dim RunLength As Integer = &H0%

         Do Until Position + ElementSize >= Indexes.Count OrElse RunLength >= (MAXIMUM_RUN_ELEMENT_COUNT * Multiplier)
            If Not Indexes.GetRange(Offset, ElementSize).SequenceEqual(Indexes.GetRange(Position, ElementSize)) Then Exit Do
            RunLength += &H1%
            Position += ElementSize
         Loop

         Return RunLength - (RunLength Mod Multiplier)
      Catch ExceptionO As Exception
         DisplayException(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure moves the specified incompressible data to the specified RLE compressed data's tail.
   Private Sub MoveIncompressible(ByRef Incompressible As List(Of Byte), ByRef Compressed As List(Of Byte))
      Try
         If Incompressible.Any Then
            Compressed.Add(ToByte(RLE_BYTES Or (Incompressible.Count - &H1%)))
            Compressed.AddRange(Incompressible)
            Incompressible.Clear()
         End If
      Catch ExceptionO As Exception
         DisplayException(ExceptionO)
      End Try
   End Sub
End Module
