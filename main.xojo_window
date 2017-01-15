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
   Placement       =   0
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
      InitialValue    =   "Name	Version	State	Url	Download"
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
      SelectionType   =   0
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
   Begin Timer updateTimer
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  'check on start on windows
		  #if TargetWindows then
		    if Preferences.checkonstart = "true" and app.loaded = 0 then
		      refreshAddons
		    end if
		    'app started
		    app.loaded = 1
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub Close()
		  'save the listbox entries
		  saveListbox
		  
		  'save column settings
		  Preferences.columnsizes = listbox1.ColumnWidths
		  
		  'save window state
		  Preferences.windowWidth = main.Width
		  Preferences.windowHeight = main.Height
		  Preferences.windowL = main.Left
		  Preferences.windowT = main.Top
		  
		  'clear download folder
		  Dim appFolder As FolderItem = SpecialFolder.ApplicationData.Child(gAppName)
		  Dim prefFolder As FolderItem = appFolder.Child("download")
		  DeleteFiles(prefFolder)
		  
		  'exit for osx
		  Quit
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Maximize()
		  Preferences.windowMaxed = "true"
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  'load the listbox entries
		  loadListbox
		  
		  'load the listbox ColumnWidths
		  ListBox1.ColumnWidths=Preferences.columnsizes
		  
		  'check for update if enabled
		  if Preferences.autoUpdate = "true" then
		    PreferencesModule.Log("StartUp", "Checking for APP updates")
		    Dim updater as Kaju.UpdateChecker.ResultType 
		    updater = kajuUpdate()
		  else
		    PreferencesModule.Log("StartUp", "Checking for APP updates is disabled")
		  end if
		  
		  'menuicons
		  FileMenuOptions.Icon = resources.toPic(resources.icon_mb_option16)
		  FileMenuCloud.Icon = resources.toPic(resources.icon_mb_cloud16)
		  FileQuit.Icon = resources.toPic(resources.icon_mb_close16)
		  AddonsAddNoncurseaddon.Icon = resources.toPic(resources.icon_mb_addon16)
		  HelpMenuHelp.Icon = resources.toPic(resources.icon_mb_help16)
		  HelpMenuAbout.Icon = resources.toPic(resources.icon_mb_about16)
		  HelpMenuUpdates.Icon = resources.toPic(resources.icon_cell_update16)
		  
		  'download function
		  Dim appFolder As FolderItem = SpecialFolder.ApplicationData.Child(gAppName)
		  Dim prefFolder As FolderItem = appFolder.Child("download")
		  
		  'create missing folder
		  if prefFolder.Exists = false then
		    prefFolder.createAsFolder
		  end if
		  
		  'check on start on macos
		  #if TargetMacOS then
		    if Preferences.checkonstart = "true" and app.loaded = 0 then
		      refreshAddons
		    end if
		    'app started
		    app.loaded = 1
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub Restore()
		  Preferences.windowMaxed = "false"
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function AddonsAddNoncurseaddonElvUI() As Boolean Handles AddonsAddNoncurseaddonElvUI.Action
			if app.FindRow("ElvUI - tukui.org",main.listbox1) = 0 then
			main.Listbox1.AddRow("ElvUI - tukui.org", "New", "none", "https://raw.githubusercontent.com/sysworx/elvui_fork/master/ElvUI/ElvUI.toc")
			'main.Listbox1.AddRow("ElvUI - tukui.org", "New", "none", "http://git.tukui.org/Elv/elvui/raw/master/ElvUI/ElvUI.toc")
			main.listbox1.CellTag(main.listbox1.listcount -1, 3) = "http://www.tukui.org/premium.php"
			main.listbox1.RowPicture(main.listbox1.listcount -1) = resources.toPic(resources.icon_cell_no16)
			else
			MsgBox "You already have ElvUI in your List!"
			end if
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileMenuCloud() As Boolean Handles FileMenuCloud.Action
			ShowDialog(optionsCloud, main)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileMenuOptions() As Boolean Handles FileMenuOptions.Action
			ShowDialog(options, main)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpMenuAbout() As Boolean Handles HelpMenuAbout.Action
			ShowDialog(about, main)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpMenuUpdates() As Boolean Handles HelpMenuUpdates.Action
			Dim updater as Kaju.UpdateChecker.ResultType 
			updater = kajuUpdate()
			
			if updater = Kaju.UpdateChecker.ResultType.NoUpdateAvailable then
			MsgBox "There is no update available!"
			end if
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function createDownloadURL(f As string) As String
		  'crap method to correct the downloadlink from sourcecode to the new mirror this should be handled in httpssocket later
		  Dim parts() as string = f.Split( "/" )
		  return "https://addons-origin.cursecdn.com/files/" + parts(4) + "/" + parts(5) + "/" + parts(6)
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteFiles(dir as FolderItem)
		  'Delete all files in a folder
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
		Sub getLocalAddons()
		  Dim tocList() as String
		  Dim tocSearch as new Shell
		  Dim addonPath as FolderItem = GetFolderItem(DecodeBase64(Preferences.addonpath))
		  Dim drive() as String = split(addonPath.NativePath, "\")
		  Dim addon_before as String
		  
		  'count fields from addon path
		  static pathSep as string = if( TargetWindows, "\", "/" )
		  dim depth as integer = addonPath.NativePath.CountFields( pathSep )
		  
		  'exec os methods to get toc files quickly
		  #if TargetWindows then
		    tocSearch.Execute drive(0) +" & cd " + addonPath.NativePath + " & dir /b /s *.toc"
		  #Elseif TargetMacOS
		    tocSearch.Execute "find """ + addonPath.NativePath +  """ -type f -name ""*.toc"""
		  #Else
		    'Linux?
		  #endif
		  
		  'read lines in a array
		  dim lines() as string = tocSearch.Result.Split(EndOfLine)
		  for i as integer = 0 to lines.Ubound -1
		    tocList.Append(lines(i).ToText)
		  next
		  
		  'start read process for each toc
		  for i As integer = 0 to tocList.Ubound
		    
		    'set the file to read
		    Dim R as FolderItem = GetFolderItem(tocList(i),FolderItem.PathTypeNative)
		    
		    'check path depth with addonpath
		    Dim addondepth as integer = R.NativePath.CountFields( pathSep )
		    PreferencesModule.Log("TOC found", R.NativePath)
		    
		    'special filter for macos (maybe linux too?)
		    #if TargetMacOS then
		      addondepth = addondepth-1
		    #endif
		    
		    'filter path depth
		    if addondepth <= depth+1 then
		      
		      Dim toc as string
		      Dim tocInput As TextInputStream
		      Dim Package as String
		      Dim addonCurseUrl as String
		      
		      'open the toc file
		      If (Not R.Directory) And (R.Exists) Then
		        tocInput = TextInputStream.Open(R)
		        toc = tocInput.ReadAll
		        tocInput.Close
		      End If
		      
		      'search Addon name
		      Dim addonName as String = app.getRegex(toc, "^## X-Curse-Project-Name: (.+)")
		      'check Addon name
		      if addonName = "nomatch" then
		        PreferencesModule.Log("Error 010", "Name could not be determined, try the old method" )
		        addonName = app.getRegex(toc, "^## Title: (.+)") 
		        if addonName = "nomatch" then
		          PreferencesModule.Log("Error 011", "Old method failed, addon name could not be determined" )
		        end if
		      else
		        PreferencesModule.Log("Addon", "Name found: " + addonName)
		      end if
		      
		      'state label text
		      lblState.text = "Found local Addon: " + addonName
		      
		      'search Addon version
		      Dim addonVersion as String = app.getRegex(toc, "^## X-Curse-Packaged-Version: (.+)")
		      'check Addon version
		      if addonVersion = "nomatch" then
		        PreferencesModule.Log("Error 020", "Version could not be determined, try the old method" )
		        addonVersion = app.getRegex(toc, "^## Version: (.+)") 
		        if addonVersion = "nomatch" then
		          PreferencesModule.Log("Error 021", "Old method failed, addon version could not be determined" )
		        end if
		      else
		        PreferencesModule.Log("Addon", "Version found: " + addonVersion)
		      end if
		      
		      'send the data to sys-worx and get url if available when activated
		      if Preferences.cloudSave = "true" then
		        Dim sender as new HTTPSecureSocket 
		        sender.Yield = true
		        Dim senddata As New Dictionary
		        senddata.Value("addon") = addonName
		        Dim result As String
		        sender.SetFormData(senddata)
		        result = sender.Post(app.swgetAddonURL,5)
		        'check the result
		        if result = "none" then
		          PreferencesModule.Log("WoWAM-Cloud", "No Url found" )
		          addonCurseUrl = "No URL available"
		        else
		          PreferencesModule.Log("WoWAM-Cloud", "Found url in the cloud: " + result )
		          addonCurseUrl = result
		        end if
		      else
		        PreferencesModule.Log("WoWAM-Cloud", "Cloud check disabled" )
		        addonCurseUrl = "No URL available"
		      end if
		      
		      'add entry to the listbox
		      if instr(addonName, addon_before) < 1 then
		        if addonVersion <> "" then
		          if addonVersion = "nomatch" then
		            PreferencesModule.Log("Addon", "Deleted because no versionnumber determined" )
		          else
		            Listbox1.AddRow(addonName, addonVersion, "none", addonCurseUrl)
		            listbox1.CellTag(main.listbox1.listcount -1,3) = "none"
		            listbox1.RowPicture(main.listbox1.listcount -1) = resources.toPic(resources.icon_cell_no16)
		          end if
		        else
		          PreferencesModule.Log("Addon", "Deleted because no versionnumber determined" )
		        end if
		      else
		        PreferencesModule.Log("Addon", "Deleted because several times found" )
		      end if 
		      'reset variables
		      addon_before = addonName
		      addonName = ""
		      addonVersion= ""
		      package = ""
		      toc = ""
		    else
		      PreferencesModule.Log("Addon", "Deleted because path is too deep")
		    end if
		  next
		  'reset state label
		  lblState.text = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function kajuUpdate() As Kaju.UpdateChecker.ResultType
		  'updater
		  Dim appFolder As FolderItem = SpecialFolder.ApplicationData.Child(gAppName)
		  dim updater as new Kaju.UpdateChecker(appFolder)
		  updater.ServerPublicRSAKey = "30820120300D06092A864886F70D01010105000382010D00308201080282010100BE309D13C50CB40272B96F0604D12C4B08245B0DF0E44ACDA66169AF1479BC02BC042E84C761D60B5B4350A7FB60F1D2CF999FB44AD95763152C732C6105004144C4F82AA6402A5F31421FC25EB7C60C7A4C7B598A12366DF0172FFBFB2F5A88FCABE73310D8B941215A5B8CCA937B662D2A6FF6E2B06879EFAEC98AABF3A733944CE7D37E2ABA861830E7867D029FAB69745DD5CFEF93A92CF17A57299A1D385B5C614DE0927DFE9DC430D2F09C854EFBD00BBEA6162A449EFE7824AF38A53EF32935DC4355454A9ED0DF8B2C5EFC6C300DDA55BD5A4FCC22FBD7789DA68074F025F3452F34CC4FE25D3C61DC02DF4BD402F3755650F45BF7146287CF4FBACB020111"
		  updater.UpdateURL = app.swUpateURL
		  updater.Execute
		  'prepare Update result
		  Dim result as Kaju.UpdateChecker.ResultType = updater.Result
		  return result
		  
		End Function
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
		  
		  'read file
		  If listboxFile <> Nil then
		    If listboxFile.Exists Then
		      PreferencesModule.Log("StartUp", "Loading Listbox-File: " + listboxFile.NativePath)
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
		  
		  'fill listbox
		  dim lines() as string =entries.Split(EndOfLine)
		  for i as integer = 0 to lines.Ubound -1
		    Dim entry() as String = split(lines(i), ";")
		    main.Listbox1.AddRow(entry(0), entry(1), "none", entry(2))
		    main.listbox1.CellTag(i,3) = entry(3)
		    main.listbox1.RowPicture(i) = resources.toPic(resources.icon_cell_no16)
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub refreshAddons()
		  'check internet Connection
		  If helper.IsConnected = false then
		    msgbox "It seems you dont have a valid internet connection, please check this!"
		    Quit
		  End if
		  
		  'reset icons
		  for i as integer = 0 to main.listbox1.listcount -1
		    main.listbox1.RowPicture(i) = resources.toPic(resources.icon_cell_no16)
		  next
		  
		  'reset label
		  lblState.text = ""
		  
		  'disable UI
		  tb_main.tb_refresh.Enabled = false
		  tb_main.tb_update.Enabled = false
		  tb_main.tb_delete.Enabled = false
		  tb_main.tb_scanlocal.Enabled = false
		  tb_main.tb_new.Enabled = false
		  tb_main.tb_edit.Enabled = false
		  'disable listbox
		  Listbox1.Enabled = false
		  
		  'reset updatecounter
		  updates = 0
		  
		  'set progressbarMax to listbox
		  proBar.Maximum =  main.listbox1.listCount
		  probar.Visible = true
		  App.refreshIsRunning = 1
		  updateCount = 0
		  
		  'create threads for entries
		  for i as integer = 0 to main.listbox1.listcount -1
		    if listbox1.Cell(i,3) = "No URL available" then
		      listbox1.RowPicture(i) = resources.toPic(resources.icon_cell_nok16)
		      PreferencesModule.Log("Refresh", "-------- Starting Refresh Procedure for " + listbox1.Cell(i,0) + " -----------------")
		      PreferencesModule.Log("Refresh","No URL availiable")
		      PreferencesModule.Log("Refresh", "-------- End of Refresh Procedure for " + listbox1.Cell(i,0) + " -------------------")
		    else
		      'start thread
		      main.listbox1.Cell(i,2) = "Searching..."
		      Dim t as new uThread(main.listbox1.Cell(i,0), main.listbox1.Cell(i,1), main.listbox1.Cell(i,3),i)
		      t.run
		      wUThread().Append(t)
		    end if
		  next
		  
		  'start thread timer
		  updateTimer.Mode = Timer.ModeMultiple
		  updateTimer.Enabled = True
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
		  
		  'check internet Connection
		  If helper.IsConnected = false then
		    msgbox "It seems you dont have a valid internet connection, please check this!"
		    Quit
		  End if
		  
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
		  
		  for i as integer = 0 to listbox1.listcount -1
		    'download all new addons
		    if listbox1.Cell(i,2) > listbox1.Cell(i,1) or listbox1.Cell(i,1) = "New" then
		      if  listbox1.Cell(i,2) = "none" then
		      else
		        if listbox1.Cell(i,4) = "link catch failed (No Curse Addon?)" then
		        else
		          PreferencesModule.Log("Update", "-------- Starting Download Procedure for " + listbox1.Cell(i,0) + " -----------------")
		          Dim http as new Downloader
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
		          PreferencesModule.Log("Update", "ZipName: " + zipname)
		          loadfile = prefFolder.Child(zipname)
		          System.DebugLog("loadfile: " + loadfile.NativePath)
		          PreferencesModule.Log("Update", "Destination Path: " + loadfile.NativePath)
		          if listbox1.Cell(i,3).InStr("https") >0 then 
		            http.Get(link, loadfile)
		            http.SetRequestHeader("User-Agent:", "Anything")
		            'set the zipfilename 
		            http.zipFile = loadfile
		            http.i = i
		          else
		            Dim httpN as new DownloaderN
		            httpN.Yield = true
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
		loadcount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		updateCount As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		updates As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			_
			
		#tag EndNote
		wUThread() As uThread
	#tag EndProperty


#tag EndWindowCode

#tag Events Listbox1
	#tag Event
		Sub DoubleClick()
		  'doubleclick edit thing
		  if listbox1.Cell(listbox1.ListIndex,3).InStr("https://mods.curse.com/addons/wow") > 0 or listbox1.Cell(listbox1.ListIndex,3) = "No URL available" then 
		    if listbox1.Cell(listbox1.ListIndex,0).Len < 26 then
		      if listbox1.ListCount > 0 then 
		        'check the listbox and open edit window
		        edit_addon.lbl_desc.text = "Edit the url from Addon: " + listbox1.Cell(listbox1.ListIndex,0) 
		        edit_addon.txt_url.text = listbox1.Cell(listbox1.ListIndex,3)
		        edit_addon.listboxRow = listbox1.ListIndex
		        edit_addon.listboxAddon =  listbox1.Cell(listbox1.ListIndex,0) 
		        'edit_addon.ShowModal
		        ShowDialog(edit_addon, main)
		      end if 
		    end if
		  else
		    MsgBox "This is no Curse.com Addon, you can't change the Link to the addon!"
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
		        'edit_addon.ShowModal
		        ShowDialog(edit_addon, main)
		      end if 
		    Case "Delete Addon"
		      'delete Addons
		      'delete rows from listbox
		      for i as integer=listbox1.listcount-1 downto 0
		        if listbox1.selected(i) then
		          'check versions
		          if listbox1.Cell(i,2) > listbox1.Cell(i,1) or listbox1.Cell(i,1) = "New" then
		            if  listbox1.Cell(i,2) = "none" then
		              listbox1.removeRow(i)
		            else
		              'correct update count if the deleted addons needs updates
		              updateCount = updateCount -1 
		              listbox1.removeRow(i)
		              'set progressbarMax to listbox and update label
		              proBar.Maximum =  updateCount
		              lblState.text = updateCount.ToText + " update(s) available..."
		            end if
		          else
		            listbox1.removeRow(i)
		          end if
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
		  tb_main.tb_curse.icon = Resources.toPic(Resources.icon_tb_curse32)
		  
		  
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
		    'addAddon.ShowModalWithin(main)
		    ShowDialog(addAddon, main)
		  Case "tb_edit"
		    'link check
		    'doubleclick edit thing
		    if listbox1.Cell(listbox1.ListIndex,3).InStr("https://mods.curse.com/addons/wow") > 0 or listbox1.Cell(listbox1.ListIndex,3) = "No URL available" then 
		      if listbox1.Cell(listbox1.ListIndex,0).Len < 26 then
		        if listbox1.ListCount > 0 then 
		          'check the listbox and open edit window
		          edit_addon.lbl_desc.text = "Edit the url from Addon: " + listbox1.Cell(listbox1.ListIndex,0) 
		          edit_addon.txt_url.text = listbox1.Cell(listbox1.ListIndex,3)
		          edit_addon.listboxRow = listbox1.ListIndex
		          edit_addon.listboxAddon =  listbox1.Cell(listbox1.ListIndex,0) 
		          'edit_addon.ShowModal
		          ShowDialog(edit_addon, main)
		        end if 
		      end if
		    else
		      MsgBox "This is no Curse.com Addon, you can't change the Link to the addon!"
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
		        getLocalAddons
		      End select
		    else
		      'listbox is empty no warning here
		      ListBox1.DeleteAllRows 
		      getLocalAddons
		    end if
		  Case "tb_refresh"
		    'start the addon refresh
		    refreshAddons
		  Case "tb_delete"
		    'delete Addons
		    'delete rows from listbox
		    for i as integer=listbox1.listcount-1 downto 0
		      if listbox1.selected(i) then
		        'check versions
		        if listbox1.Cell(i,2) > listbox1.Cell(i,1) or listbox1.Cell(i,1) = "New" then
		          if  listbox1.Cell(i,2) = "none" then
		            listbox1.removeRow(i)
		          else
		            'correct update count if the deleted addons needs updates
		            updateCount = updateCount -1 
		            listbox1.removeRow(i)
		            'set progressbarMax to listbox and update label
		            proBar.Maximum =  updateCount
		            lblState.text = updateCount.ToText + " update(s) available..."
		          end if
		        else
		          listbox1.removeRow(i)
		        end if
		      end if
		    next
		  Case "tb_update"
		    'start the downloader method
		    updateAddons
		  Case "tb_curse"
		    MsgBox "Note: We are not affiliates of Curse.com and have no revenue through this software. Please support Curse.com and their great service."
		    ShowURL("https://mods.curse.com/premium/plan")
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events updateTimer
	#tag Event
		Sub Action()
		  for i as integer = wUThread.Ubound DownTo 0
		    
		    if wUThread(i).State = Thread.NotRunning then
		      'count probar
		      proBar.Value = proBar.Value +1
		      
		      main.listbox1.Cell(wUThread(i).lbEntry,2) = wUThread(i).rAddonVersion
		      main.listbox1.Cell(wUThread(i).lbEntry,4) = wUThread(i).rDownloadLink
		      Listbox1.Refresh
		      
		      'new addon
		      if listbox1.Cell(wUThread(i).lbEntry,1) = "New" then
		        updates = 1
		        updateCount = updateCount+1
		        listbox1.RowPicture(wUThread(i).lbEntry) = resources.toPic(resources.icon_cell_update16)
		      else 
		        'check versions
		        if listbox1.Cell(wUThread(i).lbEntry,2) > listbox1.Cell(wUThread(i).lbEntry,1) then
		          updates = 1
		          updateCount = updateCount+1
		          listbox1.RowPicture(wUThread(i).lbEntry) = resources.toPic(resources.icon_cell_update16)
		        else
		          listbox1.RowPicture(wUThread(i).lbEntry) = resources.toPic(resources.icon_cell_ok16)
		        end if 
		      end if
		      
		      'do logs
		      PreferencesModule.Log("Refresh", "-------- Starting Refresh Procedure for " + wUThread(i).gAddon + " -----------------")
		      PreferencesModule.Log("Refresh", "Addon-Version: " + wUThread(i).rAddonVersion)
		      PreferencesModule.Log("Refresh", "Support-Link " + wUThread(i).rPatreon)
		      PreferencesModule.Log("Refresh", "Download-Page: " + wUThread(i).gUrl)
		      PreferencesModule.Log("Refresh", "created Download-Link: " + wUThread(i).rDownloadLink)
		      PreferencesModule.Log("Refresh", "-------- End of Refresh Procedure for " + wUThread(i).gAddon + " -------------------")
		      
		      'remove
		      wUThread.Remove(i)
		    end if
		    
		  next
		  
		  if wUThread.Ubound < 0 then
		    me.Enabled = false
		    
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
		    App.refreshIsRunning = 0
		    
		    'check if updatebutton have to be availiable
		    if updates = 1 then
		      tb_main.tb_update.Enabled = true
		      lblState.text = updateCount.ToText + " update(s) available..."
		    else
		      tb_main.tb_update.Enabled = false
		      lblState.text = "No updates available..."
		    end if
		    
		  end if
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
		Name="updates"
		Group="Behavior"
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
