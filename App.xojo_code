#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  // Save the preferences when the app quits. You can do this at any time, of course.
		  If Not Preferences.Save Then
		    MsgBox("Could not save preferences.")
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  PreferencesModule.Initialize("wowam")
		  
		  'Set default preferences on firstload
		  If Not Preferences.Load Then
		    Preferences.wowpath = "false"
		    Preferences.logging = "false"
		    Preferences.checkonstart = "false"
		    Preferences.columnsizes = "250, 100, 85, 300, 1*"
		    Preferences.proxy = "false"
		    Preferences.proxyServer = "none"
		    Preferences.proxyUser = "none"
		    Preferences.proxyUser = "none"
		    Preferences.proxyPassword = "none"
		    Preferences.cloudSave = "false"
		  End If
		  
		  'update pref prozedure
		  if Preferences.proxy = "none"  then
		    Preferences.proxy = "false"
		  end if
		  
		  if Preferences.cloudSave = "none" then
		    Preferences.cloudSave = "false"
		  end if
		  
		  
		  'proxy handling
		  if Preferences.proxy = "true" then
		    app.proxy_server = Preferences.proxyServer
		    app.proxy_port = Preferences.proxyPort
		    app.proxy_user = Preferences.proxyUser
		    app.proxy_password  = Preferences.proxyPassword
		  end if
		  
		  'check if the wow path is set
		  if Preferences.wowpath = "false" then
		    
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
		      checkfile = checkfile.Child("wow.exe")
		      
		      If checkfile.Exists = False Then
		        MsgBox  "World of Warcraft was not found in this folder!"
		        Quit
		      else
		        Preferences.wowpath = f.NativePath
		        f = f.Child("interface").Child("addons")
		        Preferences.addonpath = f.NativePath
		      End If
		      
		    Else
		      Msgbox "You have to choose your World of Warcraft location! WoWAM will not work without it."
		      Quit
		    End If
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindRow(searchString as String, aListbox as Listbox) As integer
		  //search a file in a listbox
		  //return rownr when found
		  
		  dim i,j as Integer
		  dim FoundAt as Integer
		  
		  for i = 0 to aListbox .listcount -1
		    for j = 0 to aListbox.columnCount
		      if FindWholeWord( aListbox .cell(i,j), searchString) = True then
		        FoundAt = i
		        exit
		      end
		    next
		  next
		  if FoundAt >=0 then
		    return FoundAt
		  else
		    return -1
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindWholeWord(source As string, find As string) As boolean
		  Dim rg as New RegEx
		  Dim myMatch as RegExMatch
		  rg.SearchPattern=find
		  myMatch=rg.search(source)
		  if myMatch <> Nil then
		    return True
		  else
		    return False
		  End if
		  exception err as RegExException
		    MsgBox err.message
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getFilesByExt(fFolder As FolderItem, sExtension As String, Optional bRecursive As Boolean) As FolderItem()
		  // Returns FolderItem() with items from bRecursive fFolder that have File Extension sExtension
		  Dim fWrk, fResult(), fRecursive() As FolderItem
		  Dim sNameParts() As String
		  If fFolder <> Nil And fFolder.Directory Then
		    // Use iItems to speed things up
		    Dim iItems As Integer = fFolder.Count
		    For i As Integer = 1 To iItems
		      // Use fTmp to speed things up
		      fWrk = fFolder.Item(i)
		      If fWrk.Directory Then
		        If bRecursive Then
		          // Go recursive
		          fRecursive = getFilesByExt(fWrk, sExtension, bRecursive)
		          Dim iItemsR As Integer = fRecursive.Ubound
		          For r As Integer = 0 To iItemsR
		            fResult.Append(fRecursive(r))
		          Next
		        End If
		      Else
		        // Add to fResult() if Extension matches
		        sNameParts = Split(fWrk.Name, ".")
		        If sNameParts.Ubound > 0 And sNameParts.Pop = sExtension Then
		          fResult.Append(fWrk)
		        End If
		      End If
		    Next
		  End If
		  Return fResult()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPatreonLink(source as string) As string
		  'figures out the patreon link https?:\/\/(?:www.)?patreon\.com\/([^<\/]+)
		  Dim RegExer as New RegEx
		  Dim RegExerMatch as New RegExMatch
		  Dim Result as String
		  
		  RegExer.SearchPattern="https?:\/\/(?:www.)?patreon\.com\/([^<\/]+)"
		  RegExerMatch=RegExer.search(source)
		  if RegExerMatch <> Nil then
		    result = RegExerMatch.SubExpressionString(0)
		  end if
		  
		  if result = "" then
		    result = "none"
		  end if
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getRegex(source as String, search as String) As string
		  Dim RegExer as New RegEx
		  Dim RegExerMatch as New RegExMatch
		  Dim Result as String
		  
		  'search addon name
		  RegExer.SearchPattern=search
		  RegExerMatch=RegExer.search(source)
		  if RegExerMatch <> Nil then
		    result = RegExerMatch.SubExpressionString(1)
		  else
		    result = "nomatch"
		  end if
		  
		  return result
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		proxy_password As string
	#tag EndProperty

	#tag Property, Flags = &h0
		proxy_port As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		proxy_server As string
	#tag EndProperty

	#tag Property, Flags = &h0
		proxy_user As string
	#tag EndProperty

	#tag Property, Flags = &h0
		refreshIsRunning As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		UpdateInitiater As Kaju.UpdateInitiater
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="proxy_password"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="proxy_port"
			Group="Behavior"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="proxy_server"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="proxy_user"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="refreshIsRunning"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
