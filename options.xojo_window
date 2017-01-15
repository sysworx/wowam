#tag Window
Begin Window options
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   True
   Height          =   391
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   False
   Title           =   "Options"
   Visible         =   True
   Width           =   542
   Begin GroupBox gb_wow
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "World of Warcraft"
      Enabled         =   True
      Height          =   93
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   502
      Begin Label lbl_path
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gb_wow"
         Italic          =   False
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "WoW Path:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   41
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   68
      End
      Begin TextField txtWowPath
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gb_wow"
         Italic          =   False
         Left            =   110
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   40
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   342
      End
      Begin PushButton lblSelectPath
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "..."
         Default         =   False
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gb_wow"
         Italic          =   False
         Left            =   464
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   39
         Underline       =   False
         Visible         =   True
         Width           =   46
      End
      Begin CheckBox cbBackup
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Backup old Addons (on every update)"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gb_wow"
         Italic          =   False
         Left            =   110
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   68
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   342
      End
      Begin CheckBox cbCheckStart
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Check for Addon-Updates at on startup"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gb_wow"
         Italic          =   False
         Left            =   110
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   86
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   342
      End
   End
   Begin GroupBox gb_wowam
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Addon Manager"
      Enabled         =   True
      Height          =   222
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   125
      Underline       =   False
      Visible         =   True
      Width           =   502
      Begin CheckBox cbUpdate
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Check for application updates on startup"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gb_wowam"
         Italic          =   False
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   147
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   472
      End
      Begin CheckBox cbCloud
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Use WOWAM-Cloud (i.e. to get links from Curse automatically)"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "This options just helps me to collect links and bring them back with the ""scan local"" prozedure. This option will not collect any private data from you!"
         Index           =   -2147483648
         InitialParent   =   "gb_wowam"
         Italic          =   False
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   166
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   472
      End
      Begin CheckBox cbLogging
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Activate Log-Files"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "This can be used for debugging on errors and will help at error reports. "
         Index           =   -2147483648
         InitialParent   =   "gb_wowam"
         Italic          =   False
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   184
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   472
      End
      Begin CheckBox cbProxy
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Use a Proxy-Server"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "This can be used for debugging on errors and will help at error reports. "
         Index           =   -2147483648
         InitialParent   =   "gb_wowam"
         Italic          =   False
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   203
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   472
      End
      Begin TextField txtProxyServer
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gb_wowam"
         Italic          =   False
         Left            =   172
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   226
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   330
      End
      Begin Label lbl_server
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gb_wowam"
         Italic          =   False
         Left            =   112
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Server:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   227
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   48
      End
      Begin TextField txtProxyPort
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gb_wowam"
         Italic          =   False
         Left            =   172
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   253
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   330
      End
      Begin Label lbl_user
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gb_wowam"
         Italic          =   False
         Left            =   112
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "User:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   281
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   48
      End
      Begin TextField txtProxyUser
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gb_wowam"
         Italic          =   False
         Left            =   172
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   280
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   330
      End
      Begin Label lbl_port
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gb_wowam"
         Italic          =   False
         Left            =   112
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Port:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   254
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   48
      End
      Begin TextField txtProxyPassword
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gb_wowam"
         Italic          =   False
         Left            =   172
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   True
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   307
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   330
      End
      Begin Label lbl_password
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "gb_wowam"
         Italic          =   False
         Left            =   112
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   11
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Password:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   308
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   48
      End
   End
   Begin PushButton btn_ok
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Ok"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   231
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   359
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  'load the optons
		  Dim wowpath as FolderItem = GetFolderItem(DecodeBase64(Preferences.wowpath))
		  txtWowPath.text = wowpath.NativePath
		  
		  'app updates on startup
		  if Preferences.autoUpdate = "true" then
		    cbUpdate.State = CheckBox.CheckedStates.Checked
		  else
		    cbUpdate.State = CheckBox.CheckedStates.Unchecked
		  end if
		  
		  'addon updates on startup
		  if Preferences.checkonstart = "true" then
		    cbCheckStart.State = CheckBox.CheckedStates.Checked
		  else
		    cbCheckStart.State = CheckBox.CheckedStates.Unchecked
		  end if
		  
		  'logging
		  if Preferences.logging = "true" then
		    cbLogging.State = CheckBox.CheckedStates.Checked
		  else
		    cbLogging.State = CheckBox.CheckedStates.Unchecked
		  end if
		  
		  'use cloud save
		  if Preferences.cloudSave = "true" then
		    cbCloud.State = CheckBox.CheckedStates.Checked
		  else
		    cbCloud.State = CheckBox.CheckedStates.Unchecked
		  end if
		  
		  'proxy loading
		  if Preferences.proxy = "true" then
		    cbProxy.State = CheckBox.CheckedStates.Checked
		  else
		    cbProxy.State = CheckBox.CheckedStates.Unchecked
		  end if
		  
		  ' ProxyCheckBox handling 
		  select case cbProxy.State
		  case CheckBox.CheckedStates.Unchecked
		    txtProxyServer.Enabled = false
		    txtProxyServer.text = "none"
		    txtProxyPort.Enabled = false
		    txtProxyPort.text = "none"
		    txtProxyUser.Enabled = false
		    txtProxyUser.text = "none"
		    txtProxyPassword.Enabled = false
		    txtProxyPassword.text = "none"
		  case CheckBox.CheckedStates.Checked
		    txtProxyServer.Enabled = true
		    txtProxyServer.text = Preferences.proxyServer
		    txtProxyPort.Enabled = true
		    txtProxyPort.text = Preferences.proxyPort
		    txtProxyUser.Enabled = true
		    txtProxyUser.text = Preferences.proxyUser
		    txtProxyPassword.Enabled = true
		    txtProxyPassword.text = Preferences.proxyPassword
		  end select
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events lblSelectPath
	#tag Event
		Sub Action()
		  'set the folder dialog options
		  Dim dlg As New SelectFolderDialog
		  dlg.ActionButtonCaption = "Select"
		  dlg.Title = "Select your World of Warcraft folder"
		  dlg.PromptText = "Select your World of Warcraft folder"
		  dlg.InitialDirectory = SpecialFolder.Documents
		  
		  Dim f As FolderItem
		  f = dlg.ShowModal
		  If f <> Nil Then
		    
		    Dim checkfile as FolderItem
		    checkfile = f
		    
		    'windows check
		    #if TargetWindows then
		      checkfile = checkfile.Child("wow.exe")
		    #endif
		    
		    'macos check
		    #if TargetMacOS then
		      checkfile = checkfile.Child("World of Warcraft.app")
		    #endif
		    
		    'check if wow exists and then save the paths
		    If checkfile.Exists = False Then
		      MsgBox  "World of Warcraft was not found in this folder!"
		    else
		      txtWowPath.text = f.NativePath
		      preferences.wowpath = EncodeBase64( FolderItem( f ).GetSaveInfo(nil) )
		      f = f.Child("interface").Child("addons")
		      Preferences.addonpath = EncodeBase64( FolderItem( f ).GetSaveInfo(nil) )
		    End If
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbProxy
	#tag Event
		Sub Action()
		  ' ProxyCheckBox handling 
		  select case cbProxy.State
		  case CheckBox.CheckedStates.Unchecked
		    txtProxyServer.Enabled = false
		    txtProxyServer.text = "none"
		    txtProxyPort.Enabled = false
		    txtProxyPort.text = "none"
		    txtProxyUser.Enabled = false
		    txtProxyUser.text = "none"
		    txtProxyPassword.Enabled = false
		    txtProxyPassword.text = "none"
		  case CheckBox.CheckedStates.Checked
		    txtProxyServer.Enabled = true
		    txtProxyServer.text = Preferences.proxyServer
		    txtProxyPort.Enabled = true
		    txtProxyPort.text = Preferences.proxyPort
		    txtProxyUser.Enabled = true
		    txtProxyUser.text = Preferences.proxyUser
		    txtProxyPassword.Enabled = true
		    txtProxyPassword.text = Preferences.proxyPassword
		  end select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_ok
	#tag Event
		Sub Action()
		  'debug logging
		  if cbLogging.State = CheckBox.CheckedStates.Checked then
		    Preferences.logging = "true"
		  else
		    Preferences.logging = "false"
		  end if
		  
		  'updates on app start
		  if cbUpdate.State = CheckBox.CheckedStates.Checked then
		    Preferences.autoUpdate = "true"
		  else
		    Preferences.autoUpdate = "false"
		  end if
		  
		  'cloudsave using
		  if cbCloud.State = CheckBox.CheckedStates.Checked then
		    Preferences.cloudSave = "true"
		  else
		    Preferences.cloudSave = "false"
		  end if
		  
		  'check for addon updates at start
		  if cbCheckStart.State = CheckBox.CheckedStates.Checked then
		    Preferences.checkonstart = "true"
		  else
		    Preferences.checkonstart = "false"
		  end if
		  
		  'proxy saving
		  if cbProxy.State = CheckBox.CheckedStates.Checked then
		    Preferences.proxy = "true"
		    Preferences.proxyServer = txtProxyServer.Text
		    Preferences.proxyPort = txtProxyPort.text
		    Preferences.proxyUser = txtProxyUser.Text
		    Preferences.proxyPassword =txtProxyPassword.text
		  else
		    Preferences.proxy = "false"
		    Preferences.proxyServer = txtProxyServer.Text
		    Preferences.proxyPort = txtProxyPort.text
		    Preferences.proxyUser = txtProxyUser.Text
		    Preferences.proxyPassword =txtProxyPassword.text
		  end if
		  
		  'save the Preferences now
		  If Not Preferences.Save Then
		    MsgBox("Could not save preferences.")
		  End If
		  
		  'close the form
		  options.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
