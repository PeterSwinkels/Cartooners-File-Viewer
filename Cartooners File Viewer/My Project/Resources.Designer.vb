'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated by a tool.
'     Runtime Version:4.0.30319.42000
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On

Imports System

Namespace My.Resources
    
    'This class was auto-generated by the StronglyTypedResourceBuilder
    'class via a tool like ResGen or Visual Studio.
    'To add or remove a member, edit your .ResX file then rerun ResGen
    'with the /str option, or rebuild your VS project.
    '''<summary>
    '''  A strongly-typed resource class, for looking up localized strings, etc.
    '''</summary>
    <Global.System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "16.0.0.0"),  _
     Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
     Global.System.Runtime.CompilerServices.CompilerGeneratedAttribute(),  _
     Global.Microsoft.VisualBasic.HideModuleNameAttribute()>  _
    Friend Module Resources
        
        Private resourceMan As Global.System.Resources.ResourceManager
        
        Private resourceCulture As Global.System.Globalization.CultureInfo
        
        '''<summary>
        '''  Returns the cached ResourceManager instance used by this class.
        '''</summary>
        <Global.System.ComponentModel.EditorBrowsableAttribute(Global.System.ComponentModel.EditorBrowsableState.Advanced)>  _
        Friend ReadOnly Property ResourceManager() As Global.System.Resources.ResourceManager
            Get
                If Object.ReferenceEquals(resourceMan, Nothing) Then
                    Dim temp As Global.System.Resources.ResourceManager = New Global.System.Resources.ResourceManager("CartoonersFileViewerProgram.Resources", GetType(Resources).Assembly)
                    resourceMan = temp
                End If
                Return resourceMan
            End Get
        End Property
        
        '''<summary>
        '''  Overrides the current thread's CurrentUICulture property for all
        '''  resource lookups using this strongly typed resource class.
        '''</summary>
        <Global.System.ComponentModel.EditorBrowsableAttribute(Global.System.ComponentModel.EditorBrowsableState.Advanced)>  _
        Friend Property Culture() As Global.System.Globalization.CultureInfo
            Get
                Return resourceCulture
            End Get
            Set
                resourceCulture = value
            End Set
        End Property
        
        '''<summary>
        '''  Looks up a localized string similar to Description:	Type:	Offset:	Size:
        '''80286+ executable code.	binary	0	156224
        '''A new actor.	text	215471	12
        '''About text.	text	208116	226
        '''Button edge style information.	binary	205686	38
        '''C_FILE_INFO.	text	222823	11
        '''Checked circle icon.	icon	201452	69
        '''Circle icon.	icon	201380	69
        '''Clear/erase text.	text	205466	45
        '''Cross arrows icon.	icon	202576	51
        '''Day and month abbreviations.	text	225300	58
        '''Default speech balloon information.	binary	156277	1079
        '''Dialog text.	text	211620	790
        '''Drive letters.	text	205724	84
        '''Eras [rest of string was truncated]&quot;;.
        '''</summary>
        Friend ReadOnly Property Cartooners_Executable() As String
            Get
                Return ResourceManager.GetString("Cartooners_Executable", resourceCulture)
            End Get
        End Property
        
        '''<summary>
        '''  Looks up a localized string similar to Cartooners&apos; File Formats, by: Peter Swinkels ***2015***
        '''
        '''[General Program Information]
        '''Cartooners 1988/1989 - by: Electronic Arts &amp; IDTA
        '''
        '''Note:
        '''This document applies to the game&apos;s MS-DOS version.
        '''
        '''===================================================================================================
        '''
        '''[Animated Actors]
        '''
        '''[File Information]
        '''Endianess: little.
        '''Extension: *.act
        '''
        '''[File Layout]
        '''Begin Structure: Header.
        '''	0x00	BYTE		Null. ***
        '''	0x01	0x03 BYTES	Is used to check if the file is valid. *** [rest of string was truncated]&quot;;.
        '''</summary>
        Friend ReadOnly Property Cartooners_File_Formats() As String
            Get
                Return ResourceManager.GetString("Cartooners_File_Formats", resourceCulture)
            End Get
        End Property
        
        '''<summary>
        '''  Looks up a localized string similar to Cartooners File Viewer - Help
        '''
        '''[About Cartooners]
        '''Note: this is not meant to be a complete description. See the manual that comes with this program if you want to know more.
        '''
        '''Cartooners is a basic animation software package originally developed for the Apple IIGS by ITDA and published by Electronic Arts in 1987 primarily aimed at children. It has also been ported to run under MS-DOS among others. With Cartooners the user can make a simple animated movie by placing static or animated actors over optiona [rest of string was truncated]&quot;;.
        '''</summary>
        Friend ReadOnly Property Cartooners_File_Viewer_Help() As String
            Get
                Return ResourceManager.GetString("Cartooners_File_Viewer_Help", resourceCulture)
            End Get
        End Property
    End Module
End Namespace
