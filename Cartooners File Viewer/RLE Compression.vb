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
   'This procedure adds the specified incompressible data to the specified RLE compressed data.
   Private Function AddIncompressible(ByRef Incompressible As List(Of Byte), Compressed As List(Of Byte)) As List(Of Byte)
      Try
         If Incompressible.Any Then
            Compressed.Add(ToByte(Incompressible.Count - &H1%))
            Compressed.AddRange(Incompressible)
            Incompressible.Clear()
         End If

         Return Compressed
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure RLE compresses the specified image color indexes.
   Public Function CompressRLE(Indexes As List(Of Byte)) As List(Of Byte)
      Try
         Dim Compressed As New List(Of Byte)
         Dim Count(0 To 2) As Integer
         Dim Incompressible As New List(Of Byte)
         Dim Position As Integer = &H0%

         Do While Position < Indexes.Count
            Count(0) = (DetermineRunLength(Indexes, Position, Maximum:=&H100%, ItemSize:=&H1%) \ &H4%) * &H4%
            Count(1) = DetermineRunLength(Indexes, Position, Maximum:=&H40%, ItemSize:=&H4%)
            Count(2) = DetermineRunLength(Indexes, Position, Maximum:=&H40%, ItemSize:=&H1%)

            If Count(0) > &H3% AndAlso Count(0) > Count(1) AndAlso Count(0) > Count(2) Then
               Compressed = AddIncompressible(Incompressible, Compressed)
               Compressed.Add(ToByte(&HC0% Or (CInt(Count(0) >> &H2%) - &H1%)))
               Compressed.Add(Indexes(Position))
               Position += Count(0)
            Else
               If Count(1) > &H1% AndAlso Count(1) > Count(0) AndAlso Count(1) > Count(2) Then
                  Compressed = AddIncompressible(Incompressible, Compressed)
                  Compressed.Add(ToByte(&H80% Or (Count(1) - &H1%)))
                  Compressed.AddRange(GetBytes(Indexes, Position, Count:=&H4%))
                  Position += (Count(1) * &H4%)
               Else
                  If Count(2) > &H2% AndAlso Count(2) > Count(0) AndAlso Count(2) > Count(1) Then
                     Compressed = AddIncompressible(Incompressible, Compressed)
                     Compressed.Add(ToByte(&H40% Or (Count(2) - &H1%)))
                     Compressed.Add(Indexes(Position))
                     Position += Count(2)
                  Else
                     Incompressible.Add(Indexes(Position))
                     If Incompressible.Count = &H40% OrElse Position = Indexes.Count - &H1% Then Compressed = AddIncompressible(Incompressible, Compressed)
                     Position += &H1%
                  End If
               End If
            End If
         Loop

         Return Compressed
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure decompresses the specified RLE compressed image color indexes.
   Public Function DecompressRLE(Compressed As List(Of Byte), Offset As Integer, Size As Integer) As List(Of Byte)
      Try
         Dim Count As New Integer
         Dim Decompressed As New List(Of Byte)
         Dim Instruction As New Integer
         Dim Position As Integer = Offset

         Decompressed.Clear()
         Do While Position < Offset + Size
            Instruction = Compressed(Position)
            Position += &H1%

            Select Case Instruction
               Case &H0% To &H3F%
                  Count = Instruction + &H1%
                  Decompressed.AddRange(Compressed.GetRange(Position, Count))
                  Position += Count
               Case &H40% To &H7F%
                  Count = Instruction - &H3F%
                  Decompressed.AddRange(Enumerable.Repeat(Compressed(Position), Count))
                  Position += &H1%
               Case &H81% To &HBF%
                  Count = Instruction - &H80%
                  For Repeat As Integer = &H0% To Count
                     Decompressed.AddRange(Compressed.GetRange(Position, &H4%))
                  Next Repeat
                  Position += &H4%
               Case &HC0% To &HFF%
                  Count = (Instruction - &HBF%) * &H4%
                  Decompressed.AddRange(Enumerable.Repeat(Compressed(Position), Count))
                  Position += &H1%
               Case Else
                  MessageBox.Show($"Invalid instruction found at byte #{Position:X} while decompressing data.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                  Exit Do
            End Select
         Loop

         If Position > Offset + Size Then MessageBox.Show($"The RLE decompressor read {Position - (Offset + Size):X} byte(s) more than specified.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Warning)

         Return Decompressed
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function

   'This procedure determines the run-length for the indexes at the specified position.
   Private Function DetermineRunLength(Indexes As List(Of Byte), Offset As Integer, Maximum As Integer, ItemSize As Integer) As Integer
      Try
         Dim Count As Integer = 0
         Dim Match As New Boolean
         Dim Position As Integer = Offset

         Do Until Position >= Indexes.Count OrElse Count >= Maximum
            Match = True
            For SubPosition As Integer = Position To Position + (ItemSize - 1)
               If SubPosition >= Indexes.Count OrElse Not Indexes(SubPosition) = Indexes(Offset + (SubPosition - Position)) Then
                  Match = False
                  Exit For
               End If
            Next SubPosition

            If Not Match Then Exit Do

            Count += 1
            Position += ItemSize
         Loop

         Return Count
      Catch ExceptionO As Exception
         HandleError(ExceptionO)
      End Try

      Return Nothing
   End Function
End Module
