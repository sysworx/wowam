#tag Window
Begin Window main
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   327
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   114595839
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   True
   Title           =   "WoW Addon Manager"
   Visible         =   True
   Width           =   1045
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   5
      ColumnsResizable=   True
      ColumnWidths    =   "250,100,85,300,0"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   306
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Version	State	Url	Download	Patreon"
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   True
      ScrollBarVertical=   True
      SelectionType   =   1
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   1045
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin toolbar_main tb_main
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Visible         =   True
   End
   Begin Rectangle rec
      AutoDeactivate  =   True
      BorderWidth     =   0
      BottomRightColor=   &c00000000
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   21
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      Top             =   306
      TopLeftColor    =   &c00000000
      Visible         =   True
      Width           =   1045
      Begin ProgressBar proBar
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   15
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "rec"
         Left            =   671
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Maximum         =   100
         Scope           =   0
         TabPanelIndex   =   0
         Top             =   309
         Value           =   0
         Visible         =   False
         Width           =   370
      End
      Begin Label lblState
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "rec"
         Italic          =   False
         Left            =   3
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         Text            =   ""
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   306
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   653
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  'save the listbox entries
		  saveListbox
		  
		  'save column settings
		  Preferences.columnsizes = listbox1.ColumnWidths
		  
		  'clear download folder
		  Dim appFolder As FolderItem = SpecialFolder.ApplicationData.Child(gAppName)
		  Dim prefFolder As FolderItem = appFolder.Child("download")
		  DeleteFiles(prefFolder)
		  
		  'exit for osx
		  Quit
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  'load the listbox entries
		  loadListbox
		  
		  'load the listbox ColumnWidths
		  ListBox1.ColumnWidths=Preferences.columnsizes
		  
		  'check for update
		  kajuUpdate
		  
		  'menuicons
		  FileMenuOptions.Icon = resources.toPic(resources.icon_mb_option16)
		  FileQuit.Icon = resources.toPic(resources.icon_mb_close16)
		  AddonsAddNoncurseaddon.Icon = resources.toPic(resources.icon_mb_addon16)
		  HelpMenuHelp.Icon = resources.toPic(resources.icon_mb_help16)
		  HelpMenuAbout.Icon = resources.toPic(resources.icon_mb_about16)
		  HelpMenuUpdates.Icon = resources.toPic(resources.icon_cell_update16)
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function AddonsAddNoncurseaddonElvUI() As Boolean Handles AddonsAddNoncurseaddonElvUI.Action
			if app.FindRow("ElvUI - tukui.org",main.listbox1) = 0 then
			main.Listbox1.AddRow("ElvUI - tukui.org", "New", "none", "http://git.tukui.org/Elv/elvui/raw/master/ElvUI/ElvUI.toc")
			main.listbox1.CellTag(main.listbox1.listcount -1, 3) = "http://www.tukui.org/premium.php"
			main.listbox1.RowPicture(main.listbox1.listcount -1) = resources.toPic(resources.icon_cell_no16)
			else
			MsgBox "You already have ElvUI in your List!"
			end if
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpMenuAbout() As Boolean Handles HelpMenuAbout.Action
			about.ShowModal
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpMenuUpdates() As Boolean Handles HelpMenuUpdates.Action
			kajuUpdate
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function createDownloadURL(f As string) As String
		  'crap method to correct the downloadlink from sourcecode to the new mirror
		  dim parts() as string = f.Split( "/" )
		  return "https://addons-origin.cursecdn.com/files/" + parts(4) + "/" + parts(5) + "/" + parts(6)
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteFiles(dir as FolderItem)
		  'DeleteFiles in a folder
		  for i As Integer = dir.Count DownTo 1 
		    Dim f As FolderItem = dir.TrueItem(i) 
		    if f.Directory then DeleteFiles f 
		    f.Delete 
		  next 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFilename(f As string) As String
		  'split url and get the zip filename
		  dim filename as string
		  dim parts() as string = f.Split( "/" )
		  filename = parts(UBound(parts))
		  return filename
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub getLocalAddonsWin()
		  Dim tocList() as String
		  Dim tocSearch as new Shell
		  Dim drive() as String = split(Preferences.addonpath, "\")
		  Dim addonPath as FolderItem = GetFolderItem(Preferences.addonpath)
		  Dim addon_before as String
		  
		  'count fields from addon path
		  static pathSep as string = if( TargetWindows, "\", "/" )
		  dim depth as integer = addonPath.NativePath.CountFields( pathSep )
		  
		  'exec windows crap method
		  tocSearch.Execute drive(0) +" & cd " + Preferences.addonpath + " & dir /b /s *.toc"
		  
		  'read lines in a array
		  dim lines() as string = tocSearch.Result.Split(EndOfLine)
		  for i as integer = 0 to lines.Ubound -1
		    tocList.Append(lines(i).ToText)
		  next
		  
		  'start read process
		  for i As integer = 0 to tocList.Ubound
		    
		    'set the file to read
		    Dim R as FolderItem = GetFolderItem(tocList(i))
		    
		    'check path depth with addonpath
		    Dim addondepth as integer = R.NativePath.CountFields( pathSep )
		    PreferencesModule.Log("TOC found", R.NativePath)
		    
		    'filter path depth
		    if addondepth <= depth+1 then
		      
		      Dim toc as string
		      Dim tocInput As TextInputStream
		      Dim addon as String
		      Dim version as String
		      Dim Package as String
		      
		      'open the toc file
		      If (Not R.Directory) And (R.Exists) Then
		        tocInput = TextInputStream.Open(R)
		        toc = tocInput.ReadAll
		        tocInput.Close
		      End If
		      
		      'search Addon name
		      Dim aName as New RegEx
		      Dim NameMatch as RegExMatch
		      aName.SearchPattern="^## X-Curse-Project-Name: (.+)"
		      NameMatch=aName.search(toc)
		      if NameMatch <> Nil then
		        'regex the addon name new format
		        addon = NameMatch.SubExpressionString(1)
		        PreferencesModule.Log("Addon", "Name: " + NameMatch.SubExpressionString(1) )
		      else
		        'regex the addon name old format
		        PreferencesModule.Log("Error 010", "Name could not be determined, try the old method" )
		        Dim aNameA as New RegEx
		        Dim NameMatchA as RegExMatch
		        aNameA.SearchPattern="^## Title: (.+)"
		        NameMatchA=aNameA.search(toc)
		        if NameMatchA <> Nil then
		          'set the variable
		          addon = NameMatchA.SubExpressionString(1)
		          PreferencesModule.Log("Addon", "Name found: " + NameMatchA.SubExpressionString(1) )
		        else
		          PreferencesModule.Log("Error 011", "Old method failed, addon name could not be determined" )
		        end if
		      End if
		      
		      'state label texz
		      lblState.text = "Found local Addon: " + addon
		      
		      'search Addon version
		      Dim aVersion as New RegEx
		      Dim VersionMatch as RegExMatch
		      aVersion.SearchPattern="^## X-Curse-Packaged-Version: (.+)"
		      VersionMatch=aVersion.search(toc)
		      if VersionMatch <> Nil then
		        'regex the addon name new format
		        version = VersionMatch.SubExpressionString(1)
		        PreferencesModule.Log("Addon", "Version: " + VersionMatch.SubExpressionString(1) )
		      else
		        'regex the addon name old format
		        PreferencesModule.Log("Error 020", "version could not be determined, try the old method" )
		        Dim aVersionA as New RegEx
		        Dim VersionMatchA as RegExMatch
		        aVersionA.SearchPattern="^## Version: (.+)"
		        VersionMatchA=aVersionA.search(toc)
		        if VersionMatchA <> Nil then
		          version = VersionMatchA.SubExpressionString(1)
		          PreferencesModule.Log("Addon", "Version found: " + VersionMatchA.SubExpressionString(1) )
		        else
		          'maximal read error (no handling anymore)
		          PreferencesModule.Log("Error 021", "Old method failed, addon name could not be determined" )
		        end if
		      End if
		      
		      'send the data to sys-worx and get url if available
		      Dim sender as new HTTPSecureSocket 
		      sender.Yield = true
		      Dim senddata As New Dictionary
		      Dim addonCurseUrl as String
		      senddata.Value("addon") = addon
		      Dim result As String
		      sender.SetFormData(senddata)
		      result = sender.Post("",5)
		      
		      if result = "none" then
		        addonCurseUrl = "No URL available"
		      else
		        addonCurseUrl = result
		      end if
		      
		      'add entry to the listbox
		      if instr(addon, addon_before) < 1 then
		        if version.Len > 0 then
		          Listbox1.AddRow(addon, version, "none", addonCurseUrl)
		          listbox1.RowPicture(main.listbox1.listcount -1) = resources.toPic(resources.icon_cell_no16)
		        else
		          PreferencesModule.Log("Addon", "Deleted because no versionnumber determined" )
		        end if
		      else
		        PreferencesModule.Log("Addon", "Deleted because several times found" )
		      end if 
		      
		      addon_before = addon
		      addon = ""
		      version= ""
		      package = ""
		      toc = ""
		    else
		      PreferencesModule.Log("Addon", "Deleted because path is too deep")
		    end if
		  next
		  
		  lblState.text = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub kajuUpdate()
		  'updater
		  Dim appFolder As FolderItem = SpecialFolder.ApplicationData.Child(gAppName)
		  dim updater as new Kaju.UpdateChecker(appFolder)
		  updater.ServerPublicRSAKey = "30820120300D06092A864886F70D01010105000382010D00308201080282010100BE309D13C50CB40272B96F0604D12C4B08245B0DF0E44ACDA66169AF1479BC02BC042E84C761D60B5B4350A7FB60F1D2CF999FB44AD95763152C732C6105004144C4F82AA6402A5F31421FC25EB7C60C7A4C7B598A12366DF0172FFBFB2F5A88FCABE73310D8B941215A5B8CCA937B662D2A6FF6E2B06879EFAEC98AABF3A733944CE7D37E2ABA861830E7867D029FAB69745DD5CFEF93A92CF17A57299A1D385B5C614DE0927DFE9DC430D2F09C854EFBD00BBEA6162A449EFE7824AF38A53EF32935DC4355454A9ED0DF8B2C5EFC6C300DDA55BD5A4FCC22FBD7789DA68074F025F3452F34CC4FE25D3C61DC02DF4BD402F3755650F45BF7146287CF4FBACB020111"
		  updater.UpdateURL = "https://wowam.sys-worx.net/UpdateInformation.json"
		  PreferencesModule.Log("StartUp", "Checking for APP updates")
		  updater.Execute
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadListbox()
		  Dim listboxFile as FolderItem
		  Dim appFolder As FolderItem = SpecialFolder.ApplicationData.Child(gAppName)
		  Dim prefFolder As FolderItem = appFolder
		  Dim prefName As String = "addons.dat"
		  Dim entries as String
		  
		  'set addonlist
		  listboxFile = prefFolder.Child(prefName)
		  
		  If listboxFile <> Nil then
		    If listboxFile.Exists Then
		      PreferencesModule.Log("StartUp", "Loading Listbox-File: " + listboxFile.NativePath)
		      // Be aware that TextInputStream.Open coud raise an exception
		      Dim t As TextInputStream
		      Try
		        t = TextInputStream.Open(listboxFile)
		        entries = t.ReadAll
		        t.Close
		      Catch e As IOException
		        MsgBox("Error accessing file.")
		        PreferencesModule.Log("Error@ListboxFile", e.Message)
		      End Try
		    else
		      PreferencesModule.Log("StartUp", "Listbox-File does not exists")
		    End If
		  end if
		  
		  dim lines() as string =entries.Split(EndOfLine)
		  for i as integer = 0 to lines.Ubound -1
		    Dim entry() as String = split(lines(i), ";")
		    main.Listbox1.AddRow(entry(0), entry(1), "none", entry(2))
		    
		    'check for celltag on url cause update 0.1.5 and set none for addons.dat integrity
		    Dim count as integer = UBound(entry)
		    if count > 2 then
		      if main.listbox1.CellTag(i,3) = "" then
		        main.listbox1.CellTag(i,3) = "none"
		      else 
		        main.listbox1.CellTag(i,3) = entry(3)
		      end if
		    else
		      main.listbox1.CellTag(i,3) = "none"
		    end if
		    
		    main.listbox1.RowPicture(i) = resources.toPic(resources.icon_cell_no16)
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub refreshAddons()
		  'reset icons
		  for i as integer = 0 to main.listbox1.listcount -1
		    main.listbox1.RowPicture(i) = resources.toPic(resources.icon_cell_no16)
		  next
		  
		  'set HTTPSocket
		  Dim h as new whttps
		  h.HTTPProxyAddress = app.proxy_server
		  h.HTTPProxyPort = app.proxy_port
		  Dim updates as integer = 0
		  h.Yield = true
		  
		  
		  'set progressbarMax to listbox
		  proBar.Maximum =  main.listbox1.listCount
		  App.refreshIsRunning = 1
		  
		  for i as integer = 0 to main.listbox1.listcount -1
		    'disable toolbutton
		    tb_main.tb_refresh.Enabled = false
		    tb_main.tb_update.Enabled = false
		    tb_main.tb_delete.Enabled = false
		    tb_main.tb_scanlocal.Enabled = false
		    tb_main.tb_new.Enabled = false
		    tb_main.tb_edit.Enabled = false
		    'disable listbox
		    Listbox1.Enabled = false
		    'statbar state
		    lblState.text = "Checking " + listbox1.Cell(i,0)
		    probar.Visible = true
		    proBar.Value = proBar.Value +1
		    
		    if listbox1.Cell(i,3) = "No URL available" then
		      listbox1.RowPicture(i) = resources.toPic(resources.icon_cell_nok16)
		      PreferencesModule.Log("Refresh", "-------- Starting Refresh Procedure for " + listbox1.Cell(i,0) + " -----------------")
		      PreferencesModule.Log("Refresh","No URL availiable")
		      PreferencesModule.Log("Refresh", "-------- End of Refresh Procedure for " + listbox1.Cell(i,0) + " -------------------")
		    else
		      'curse operations
		      if listbox1.Cell(i,3).InStr("https://mods.curse.com/addons/wow") >0 then 
		        h.SetRequestHeader("User-Agent:", "curl/7.21.0 (i686-pc-linux-gnu) libcurl/7.21.0 OpenSSL/0.9.8o zlib/1.2.3.4 libidn/1.18")
		        PreferencesModule.Log("Refresh", "-------- Starting Refresh Procedure for " + listbox1.Cell(i,0) + " -----------------")
		        Dim source as String
		        Dim DownloadSource as String
		        Dim AddonVersion as String 
		        Dim DownloadLink as String 
		        Dim DownloadPage as String
		        
		        'get sourcecode
		        source=h.Get(main.listbox1.Cell(i,3),50)
		        'search AddonVersion
		        AddonVersion = app.getRegex(source,"<li class=""newest-file"">[^:]+: ([^<]+)")
		        PreferencesModule.Log("Refresh", "Addon-Version: " + AddonVersion)
		        listbox1.Cell(i,2) = AddonVersion
		        'search DownloadPage
		        DownloadPage = app.getRegex(source,"<tr class=""even""><td><a href=""(.+)""")
		        DownloadPage = "https://mods.curse.com" + DownloadPage
		        PreferencesModule.Log("Refresh", "Download-Page: " + DownloadPage)
		        'Search DownloadLink
		        DownloadSource = h.Get(DownloadPage,50)
		        'regex old "data-href=""(.+)"" class=""download-link""" 
		        DownloadLink = app.getRegex(DownloadSource,"data-href=""(.+)"" class=""download-link""")
		        PreferencesModule.Log("Refresh", "created DownloadLink: " + DownloadLink)
		        'correct the download link to https
		        if DownloadLink = "nomatch" then
		          listbox1.Cell(i,4) = "link catch failed (No Curse Addon?)"
		        else
		          listbox1.Cell(i,4) = createDownloadURL(DownloadLink)
		        end if
		        'check versions
		        if listbox1.Cell(i,2) > listbox1.Cell(i,1) then
		          listbox1.RowPicture(i) = resources.toPic(resources.icon_cell_update16)
		          updates = 1
		          PreferencesModule.Log("Refresh", "Update available: Yes")
		          updateCount = updateCount+1
		        else
		          listbox1.RowPicture(i) = resources.toPic(resources.icon_cell_ok16)
		          PreferencesModule.Log("Refresh", "Update available: No")
		        end if 
		        'new addon
		        if listbox1.Cell(i,1) = "New" then
		          listbox1.RowPicture(i) = resources.toPic(resources.icon_cell_update16)
		          updates = 1
		          updateCount = updateCount+1
		          PreferencesModule.Log("Refresh", "Update Type: New Install")
		        end if
		        PreferencesModule.Log("Refresh", "-------- End of Refresh Procedure for " + listbox1.Cell(i,0) + " -------------------")
		      end if
		      'end curse operations
		      
		      'git operations for elvui
		      if listbox1.Cell(i,3).InStr("http://git.tukui.org/elv") >0 then 
		        PreferencesModule.Log("Refresh", "-------- Starting Refresh Procedure for " + listbox1.Cell(i,0) + " -----------------")
		        Dim source as String
		        Dim AddonVersion as String 
		        Dim DownloadLink as String 
		        Dim ht as new HTTPSocket
		        'get sourcecode
		        source=ht.Get(main.listbox1.Cell(i,3),50)
		        AddonVersion = app.getRegex(source, "^## Version: (.+)")
		        DownloadLink = "http://www.tukui.org/downloads/elvui-" + AddonVersion + ".zip"
		        PreferencesModule.Log("Refresh", "Addon-Version: " + AddonVersion)
		        PreferencesModule.Log("Refresh", "Not needed")
		        listbox1.Cell(i,2) = AddonVersion
		        listbox1.Cell(i,4) = DownloadLink
		        PreferencesModule.Log("Refresh", "created DownloadLink: " + DownloadLink)
		        
		        'check versions
		        if listbox1.Cell(i,2) > listbox1.Cell(i,1) then
		          listbox1.RowPicture(i) = resources.toPic(resources.icon_cell_update16)
		          updates = 1
		          PreferencesModule.Log("Refresh", "Update available: Yes")
		          updateCount = updateCount+1
		        else
		          listbox1.RowPicture(i) = resources.toPic(resources.icon_cell_ok16)
		          PreferencesModule.Log("Refresh", "Update available: No")
		        end if 
		        'new addon
		        if listbox1.Cell(i,1) = "New" then
		          listbox1.RowPicture(i) = resources.toPic(resources.icon_cell_update16)
		          updates = 1
		          updateCount = updateCount+1
		          PreferencesModule.Log("Refresh", "Update Type: New Install")
		        end if
		        PreferencesModule.Log("Refresh", "-------- End of Refresh Procedure for " + listbox1.Cell(i,0) + " -------------------")
		      end if
		      'end git operations
		    end if
		    
		  next
		  'check if updatebutton musst be availiable
		  if updates = 1 then
		    tb_main.tb_update.Enabled = true
		  else
		    tb_main.tb_update.Enabled = false
		  end if
		  
		  'enable Refresh button again
		  tb_main.tb_refresh.Enabled = true
		  tb_main.tb_delete.Enabled = true
		  tb_main.tb_scanlocal.Enabled = true
		  tb_main.tb_new.Enabled = true
		  tb_main.tb_edit.Enabled = true
		  App.refreshIsRunning = 0
		  'enable listbox again
		  Listbox1.Enabled = true
		  'reset progressbar
		  proBar.Value = 0
		  probar.Visible = false
		  'setlabel
		  lblState.text = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveDuplicates(list as ListBox, column as Integer) As Integer
		  'removes duplicates from listbox
		  Dim i,j as Integer
		  Dim duplicatesRemoved as Integer = 0
		  
		  While i<list.ListCount
		    j = i+1
		    while j<list.ListCount
		      if list.Cell(i,column) = list.Cell(j,column) Then
		        list.RemoveRow(j)
		        duplicatesRemoved = duplicatesRemoved + 1
		      else
		        j = j+1
		      end if
		    wend
		    i=i+1
		  wend
		  
		  return duplicatesRemoved
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub saveListbox()
		  Dim listboxFile as FolderItem
		  Dim appFolder As FolderItem = SpecialFolder.ApplicationData.Child(gAppName)
		  Dim prefFolder As FolderItem = appFolder
		  Dim prefName As String = "addons.dat"
		  
		  'set addonlist
		  listboxFile = prefFolder.Child(prefName)
		  
		  'clear the old file
		  listboxFile.Delete
		  
		  'write to file
		  PreferencesModule.Log("Quit", "Saving Listbox-File: " + listboxFile.NativePath)
		  for i as integer = 0 to main.listbox1.listcount -1
		    If listboxFile <> Nil then
		      Try
		        Dim t as TextOutputStream = TextOutputStream.Append(listboxFile)
		        t.Write main.listbox1.Cell(i,0) + ";" + main.listbox1.Cell(i,1) + ";" + main.listbox1.Cell(i,3) + ";" +  main.listbox1.CellTag(i,3) +EndOfLine
		      Catch e as IOException
		        //handle error
		        MsgBox("AddonFile-Error: " + e.Message)
		        PreferencesModule.Log("Error@ListboxFile", e.Message)
		      End Try
		    End if
		  next
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updateAddons()
		  'set progressbarMax to listbox
		  proBar.Maximum =  updateCount
		  
		  'to disable contextmenu
		  app.refreshIsRunning = 1 
		  
		  'disable toolbutton
		  tb_main.tb_refresh.Enabled = false
		  tb_main.tb_update.Enabled = false
		  tb_main.tb_delete.Enabled = false
		  tb_main.tb_scanlocal.Enabled = false
		  tb_main.tb_new.Enabled = false
		  tb_main.tb_edit.Enabled = false
		  proBar.Visible = true
		  
		    'download function
		  Dim loadfile as FolderItem
		  Dim appFolder As FolderItem = SpecialFolder.ApplicationData.Child(gAppName)
		  Dim prefFolder As FolderItem = appFolder.Child("download")
		  
		  'create missing folder
		  if prefFolder.Exists = false then
		    prefFolder.createAsFolder
		  end if
		  
		  for i as integer = 0 to listbox1.listcount -1
		    'statbar state
		    'download all new addons
		    if listbox1.Cell(i,2) > listbox1.Cell(i,1) or listbox1.Cell(i,1) = "New" then
		      if  listbox1.Cell(i,2) = "none" then
		      else
		        if listbox1.Cell(i,4) = "link catch failed (No Curse Addon?)" then
		        else
		          PreferencesModule.Log("Update", "-------- Starting Download Procedure for " + listbox1.Cell(i,0) + " -----------------")
		          http = new Downloader
		          http.Yield = true
		          
		          dim link as string = listbox1.Cell(i,4)
		          PreferencesModule.Log("Update","Link: " + link)
		          Dim zipname as String 
		          'handling for no curse sites
		          if listbox1.Cell(i,3).InStr("http://git.tukui.org/") >0 then 
		            zipname = listbox1.Cell(i,0) + ".zip"
		          else
		            zipname = GetFilename(link)
		          end if
		          System.DebugLog("zipname: " + zipname)
		          PreferencesModule.Log("Update", "ZipName: " + zipname)
		          loadfile = prefFolder.Child(zipname)
		          System.DebugLog("loadfile: " + loadfile.NativePath)
		          PreferencesModule.Log("Update", "Destination Path: " + loadfile.NativePath)
		          if listbox1.Cell(i,3).InStr("https") >0 then 
		            http.Get(link, loadfile)
		            'set the zipfilename 
		            http.zipFile = loadfile
		            http.i = i
		          else
		            Dim httpN as new DownloaderN
		            httpN.Get(link, loadfile)
		            'set the zipfilename 
		            httpN.zipFile = loadfile
		            httpN.i = i
		          end if
		          PreferencesModule.Log("Update", "Starting Download...")
		          
		        end if
		      end if
		    end if
		  next
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		EditAddon As MenuItem
	#tag EndProperty

	#tag Property, Flags = &h0
		http As Downloader
	#tag EndProperty

	#tag Property, Flags = &h0
		loadcount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		updateCount As Integer = 0
	#tag EndProperty


#tag EndWindowCode

#tag Events Listbox1
	#tag Event
		Sub DoubleClick()
		  'doubleclick edit thing
		  if listbox1.Cell(listbox1.ListIndex,3).InStr("https://mods.curse.com/addons/wow") =0 then 
		    MsgBox "This is no Curse.com Addon, you can't change the Link to the addon!"
		  else
		    if listbox1.Cell(listbox1.ListIndex,0).Len < 26 then
		      if listbox1.ListCount > 0 then 
		        'check the listbox and open edit window
		        edit_addon.lbl_desc.text = "Edit the url from Addon: " + listbox1.Cell(listbox1.ListIndex,0) 
		        edit_addon.txt_url.text = listbox1.Cell(listbox1.ListIndex,3)
		        edit_addon.listboxRow = listbox1.ListIndex
		        edit_addon.listboxAddon =  listbox1.Cell(listbox1.ListIndex,0) 
		        edit_addon.ShowModal
		      end if 
		    end if
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  'create the context menu
		  Dim openEdit As New MenuItem("Edit Addon")
		  openEdit.Icon = resources.toPic(resources.icon_context_edit16)
		  
		  Dim openDelete As New MenuItem("Delete Addon")
		  openDelete.Icon = resources.toPic(resources.icon_context_del16)
		  
		  Dim openWebsite As New MenuItem("Open Website of the Addon")
		  openWebsite.Icon = resources.toPic(resources.icon_context_web16)
		  
		  Dim openPatreon As New MenuItem("Support the Addon")
		  openPatreon.Icon = resources.toPic(resources.icon_context_pat16)
		  
		  If Me.RowFromXY(x, y) >= 0 Then
		    base.Append(New MenuItem(openEdit))
		    base.Append(New MenuItem(openDelete))
		    base.Append(New MenuItem("-"))
		    base.Append(openWebsite)
		    base.Append(openPatreon)
		  End If
		  Return True
		  
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  'kontextmenu actions
		  if app.refreshIsRunning = 0 then
		    Select Case hitItem.Text
		    Case "Edit Addon"
		      'check the listbox and open edit window
		      if listbox1.ListCount > 0 then 
		        edit_addon.lbl_desc.text = "Edit the url from Addon: " + listbox1.Cell(listbox1.ListIndex,0) 
		        edit_addon.txt_url.text = listbox1.Cell(listbox1.ListIndex,3)
		        edit_addon.listboxRow = listbox1.ListIndex
		        edit_addon.listboxAddon =  listbox1.Cell(listbox1.ListIndex,0) 
		        edit_addon.ShowModal
		      end if 
		    Case "Delete Addon"
		      'delete Addons
		      for i as integer=listbox1.listcount-1 downto 0
		        if listbox1.selected(i) then
		          listbox1.removeRow(i)
		        end if
		      next
		    Case "Open Website of the Addon"
		      'open default browser for website
		      ShowURL(listbox1.Cell(listbox1.ListIndex,3))
		    Case "Support the Addon"
		      'open default browser for patreon
		      if listbox1.CellTag(listbox1.ListIndex,3) = "none" then
		        msgbox "There was no Patreon Link found! Go to the Curse-Homepage and look for other support possibilities."
		      else
		        ShowURL(listbox1.CellTag(listbox1.ListIndex,3))
		      end if
		    End Select
		  end if
		  
		  
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events tb_main
	#tag Event
		Sub Open()
		  'Set images
		  tb_main.tb_new.icon = resources.toPic(resources.icon_tb_new32)
		  tb_main.tb_edit.icon = resources.toPic(resources.icon_tb_edit32)
		  tb_main.tb_delete. icon = resources.toPic(resources.icon_tb_delete32)
		  tb_main.tb_scanlocal.icon = resources.toPic(resources.icon_tb_search32)
		  tb_main.tb_refresh.icon = resources.toPic(resources.icon_tb_refresh32)
		  tb_main.tb_update.icon = resources.toPic(resources.icon_tb_update32)
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action(item As ToolItem)
		  'create the MessageDialog
		  Dim md1 as New MessageDialog               
		  Dim bmd1 as MessageDialogButton              
		  md1.icon=MessageDialog.GraphicCaution      
		  md1.ActionButton.Caption="OK"
		  md1.CancelButton.Visible=True                
		  md1.AlternateActionButton.Visible=false 
		  md1.AlternateActionButton.Caption="ListBox already filled"
		  md1.Message="You already have addons in your list. If you scan again, all your addons in the list will be deleted!"
		  md1.Explanation="Are you sure about that?"
		  
		  Select Case item.Name
		  Case "tb_new"
		    'show the add_addon form
		    Dim addAddon as new Window 
		    addAddon = add_addon
		    addAddon.ShowModal
		  Case "tb_edit"
		    'link check
		    if listbox1.Cell(listbox1.ListIndex,3).InStr("https://mods.curse.com/addons/wow") =0 then 
		      MsgBox "This is no Curse.com Addon, you can't change the Link to the addon!"
		    else
		      if listbox1.Cell(listbox1.ListIndex,0).Len < 26 then
		        if listbox1.ListCount > 0 then 
		          'check the listbox and open edit window
		          edit_addon.lbl_desc.text = "Edit the url from Addon: " + listbox1.Cell(listbox1.ListIndex,0) 
		          edit_addon.txt_url.text = listbox1.Cell(listbox1.ListIndex,3)
		          edit_addon.listboxRow = listbox1.ListIndex
		          edit_addon.listboxAddon =  listbox1.Cell(listbox1.ListIndex,0) 
		          edit_addon.ShowModal
		        end if 
		      end if
		    end if
		  Case "tb_scanlocal"
		    'check listbox empty
		    if listbox1.ListCount > 0 then 
		      'show warning
		      bmd1=md1.ShowModal   
		      Select Case bmd1
		      Case md1.ActionButton
		        'ok pressed    
		        ListBox1.DeleteAllRows 
		        getLocalAddonsWin
		      End select
		    else
		      'listbox is empty no warning here
		      ListBox1.DeleteAllRows 
		      getLocalAddonsWin
		    end if
		  Case "tb_refresh"
		    'start the addon refresh
		    refreshAddons
		  Case "tb_delete"
		    'delete rows from listbox
		    for i as integer=listbox1.listcount-1 downto 0
		      if listbox1.selected(i) then
		        listbox1.removeRow(i)
		      end if
		    next
		  Case "tb_update"
		    'start the downloader method
		    updateAddons
		  End Select
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
		Name="loadcount"
		Group="Behavior"
		Type="Integer"
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
		Name="updateCount"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
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
