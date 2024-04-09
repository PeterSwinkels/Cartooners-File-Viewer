<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class InterfaceWindow
   Inherits System.Windows.Forms.Form

   'Form overrides dispose to clean up the component list.
   <System.Diagnostics.DebuggerNonUserCode()>
   Protected Overrides Sub Dispose(disposing As Boolean)
      Try
         If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
         End If
      Finally
         MyBase.Dispose(disposing)
      End Try
   End Sub

   'Required by the Windows Form Designer
   Private components As System.ComponentModel.IContainer

   'NOTE: The following procedure is required by the Windows Form Designer
   'It can be modified using the Windows Form Designer.  
   'Do not modify it using the code editor.
   <System.Diagnostics.DebuggerStepThrough()>
   Private Sub InitializeComponent()
      Me.components = New System.ComponentModel.Container()
      Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(InterfaceWindow))
      Me.MenuBar = New System.Windows.Forms.MenuStrip()
      Me.ProgramMenuMenu = New System.Windows.Forms.ToolStripMenuItem()
      Me.ExportFilesMenu = New System.Windows.Forms.ToolStripMenuItem()
      Me.LoadFileMenu = New System.Windows.Forms.ToolStripMenuItem()
      Me.ProgramMenuSeparator1 = New System.Windows.Forms.ToolStripSeparator()
      Me.FileFormatsMenu = New System.Windows.Forms.ToolStripMenuItem()
      Me.HelpMenu = New System.Windows.Forms.ToolStripMenuItem()
      Me.InformationMenu = New System.Windows.Forms.ToolStripMenuItem()
      Me.ProgramMenuSeparator2 = New System.Windows.Forms.ToolStripSeparator()
      Me.CloseMenu = New System.Windows.Forms.ToolStripMenuItem()
      Me.DataFileMenu = New System.Windows.Forms.ToolStripMenuItem()
      Me.DataBox = New System.Windows.Forms.TextBox()
      Me.ToolTip = New System.Windows.Forms.ToolTip(Me.components)
      Me.MenuBar.SuspendLayout()
      Me.SuspendLayout()
      '
      'MenuBar
      '
      Me.MenuBar.ImageScalingSize = New System.Drawing.Size(20, 20)
      Me.MenuBar.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ProgramMenuMenu, Me.DataFileMenu})
      Me.MenuBar.Location = New System.Drawing.Point(0, 0)
      Me.MenuBar.Name = "MenuBar"
      Me.MenuBar.Size = New System.Drawing.Size(423, 24)
      Me.MenuBar.TabIndex = 0
      Me.MenuBar.Text = "MenuStrip1"
      '
      'ProgramMenuMenu
      '
      Me.ProgramMenuMenu.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ExportFilesMenu, Me.LoadFileMenu, Me.ProgramMenuSeparator1, Me.FileFormatsMenu, Me.HelpMenu, Me.InformationMenu, Me.ProgramMenuSeparator2, Me.CloseMenu})
      Me.ProgramMenuMenu.Name = "ProgramMenuMenu"
      Me.ProgramMenuMenu.Size = New System.Drawing.Size(65, 20)
      Me.ProgramMenuMenu.Text = "&Program"
      '
      'ExportFilesMenu
      '
      Me.ExportFilesMenu.Name = "ExportFilesMenu"
      Me.ExportFilesMenu.ShortcutKeys = CType((System.Windows.Forms.Keys.Control Or System.Windows.Forms.Keys.E), System.Windows.Forms.Keys)
      Me.ExportFilesMenu.Size = New System.Drawing.Size(181, 22)
      Me.ExportFilesMenu.Text = "&Export File(s)"
      '
      'LoadFileMenu
      '
      Me.LoadFileMenu.Name = "LoadFileMenu"
      Me.LoadFileMenu.ShortcutKeys = CType((System.Windows.Forms.Keys.Control Or System.Windows.Forms.Keys.L), System.Windows.Forms.Keys)
      Me.LoadFileMenu.Size = New System.Drawing.Size(181, 22)
      Me.LoadFileMenu.Text = "&Load File"
      '
      'ProgramMenuSeparator1
      '
      Me.ProgramMenuSeparator1.Name = "ProgramMenuSeparator1"
      Me.ProgramMenuSeparator1.Size = New System.Drawing.Size(178, 6)
      '
      'FileFormatsMenu
      '
      Me.FileFormatsMenu.Name = "FileFormatsMenu"
      Me.FileFormatsMenu.ShortcutKeys = CType((System.Windows.Forms.Keys.Control Or System.Windows.Forms.Keys.F), System.Windows.Forms.Keys)
      Me.FileFormatsMenu.Size = New System.Drawing.Size(181, 22)
      Me.FileFormatsMenu.Text = "&File Formats"
      '
      'HelpMenu
      '
      Me.HelpMenu.Name = "HelpMenu"
      Me.HelpMenu.ShortcutKeys = CType((System.Windows.Forms.Keys.Control Or System.Windows.Forms.Keys.H), System.Windows.Forms.Keys)
      Me.HelpMenu.Size = New System.Drawing.Size(181, 22)
      Me.HelpMenu.Text = "&Help"
      '
      'InformationMenu
      '
      Me.InformationMenu.Name = "InformationMenu"
      Me.InformationMenu.ShortcutKeys = CType((System.Windows.Forms.Keys.Control Or System.Windows.Forms.Keys.I), System.Windows.Forms.Keys)
      Me.InformationMenu.Size = New System.Drawing.Size(181, 22)
      Me.InformationMenu.Text = "&Information"
      '
      'ProgramMenuSeparator2
      '
      Me.ProgramMenuSeparator2.Name = "ProgramMenuSeparator2"
      Me.ProgramMenuSeparator2.Size = New System.Drawing.Size(178, 6)
      '
      'CloseMenu
      '
      Me.CloseMenu.Name = "CloseMenu"
      Me.CloseMenu.ShortcutKeys = CType((System.Windows.Forms.Keys.Alt Or System.Windows.Forms.Keys.F4), System.Windows.Forms.Keys)
      Me.CloseMenu.Size = New System.Drawing.Size(181, 22)
      Me.CloseMenu.Text = "&Close"
      '
      'DataFileMenu
      '
      Me.DataFileMenu.Name = "DataFileMenu"
      Me.DataFileMenu.Size = New System.Drawing.Size(12, 20)
      Me.DataFileMenu.Visible = False
      '
      'DataBox
      '
      Me.DataBox.AllowDrop = True
      Me.DataBox.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
      Me.DataBox.BackColor = System.Drawing.SystemColors.Window
      Me.DataBox.CausesValidation = False
      Me.DataBox.Font = New System.Drawing.Font("Consolas", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
      Me.DataBox.Location = New System.Drawing.Point(0, 27)
      Me.DataBox.MaxLength = 0
      Me.DataBox.Multiline = True
      Me.DataBox.Name = "DataBox"
      Me.DataBox.ReadOnly = True
      Me.DataBox.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
      Me.DataBox.Size = New System.Drawing.Size(423, 342)
      Me.DataBox.TabIndex = 2
      '
      'InterfaceWindow
      '
      Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
      Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
      Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
      Me.ClientSize = New System.Drawing.Size(423, 368)
      Me.Controls.Add(Me.DataBox)
      Me.Controls.Add(Me.MenuBar)
      Me.DoubleBuffered = True
      Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
      Me.KeyPreview = True
      Me.MainMenuStrip = Me.MenuBar
      Me.Name = "InterfaceWindow"
      Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
      Me.MenuBar.ResumeLayout(False)
      Me.MenuBar.PerformLayout()
      Me.ResumeLayout(False)
      Me.PerformLayout()

   End Sub
   Friend WithEvents MenuBar As System.Windows.Forms.MenuStrip
   Friend WithEvents ProgramMenuMenu As System.Windows.Forms.ToolStripMenuItem
   Friend WithEvents InformationMenu As System.Windows.Forms.ToolStripMenuItem
   Friend WithEvents CloseMenu As System.Windows.Forms.ToolStripMenuItem
   Friend WithEvents DataBox As System.Windows.Forms.TextBox
   Friend WithEvents ProgramMenuSeparator1 As System.Windows.Forms.ToolStripSeparator
   Friend WithEvents ImportLBMFileMenu As System.Windows.Forms.ToolStripMenuItem
   Friend WithEvents LoadFileMenu As System.Windows.Forms.ToolStripMenuItem
   Friend WithEvents ProgramMenuSeparator2 As System.Windows.Forms.ToolStripSeparator
   Friend WithEvents ExportFilesMenu As System.Windows.Forms.ToolStripMenuItem
   Friend WithEvents DataFileMenu As System.Windows.Forms.ToolStripMenuItem
   Friend WithEvents FileFormatsMenu As System.Windows.Forms.ToolStripMenuItem
   Friend WithEvents HelpMenu As System.Windows.Forms.ToolStripMenuItem
   Friend WithEvents ToolTip As System.Windows.Forms.ToolTip
End Class
