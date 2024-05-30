Option Compare Binary
Option Explicit On
Option Infer Off
Option Strict On

Imports System
Imports System.Convert
Imports System.Diagnostics
Imports System.IO

Public Module Module1
   Private Const HEADER_SIZE As Integer = &H2E00%
   Private Const NOP As Integer = &H90%
   Private Const RETF As Integer = &HCB%
   Private Const RETFC As Integer = &HCA%

   Public Sub Main()
      Dim DosBox As New Process
      Dim Data() As Byte = File.ReadAllBytes("D:\Other\Cartoons.unpacked.exe")
      Dim Offset As Integer = HEADER_SIZE

      Data(Offset) = &HCB%

      File.WriteAllBytes("D:\Cartmod.exe", Data)

      DosBox.StartInfo = New ProcessStartInfo With {.Arguments = "-noconsole", .FileName = "C:\Program Files (x86)\DOSBox-0.74-3\Dosbox.exe"}
      DosBox.Start()
      Environment.Exit(0)
   End Sub

End Module
