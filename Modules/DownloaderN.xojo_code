#tag Class
Protected Class DownloaderN
Inherits HttpSocket
	#tag Event
		Sub DownloadComplete(url as string, httpStatus as integer, headers as internetHeaders, file as folderItem)
		  'extracting addons to destination folder
		  main.lblState.text = "Extracting " + main.listbox1.Cell(i,0)
		  main.proBar.Value = main.proBar.Value +1
		  main.loadcount = main.loadcount + 1
		  
		  Dim addonPath as FolderItem = GetFolderItem(Preferences.addonpath)
		  
		  PreferencesModule.Log("Update", "Download Complete: " + url + httpStatus.ToText)
		  PreferencesModule.Log("Update", "Extracting addon to: " + addonPath.NativePath)
		  
		  Dim zipper as new Kaju.ZipShell
		  zipper.Decompress(zipFile, addonPath)
		  main.listbox1.Cell(i,1) = main.listbox1.Cell(i,2)  
		  main.listbox1.RowPicture(i) = resources.toPic(resources.icon_cell_ok16)
		  PreferencesModule.Log("Update", "-------- End Download Procedure for " + main.listbox1.Cell(i,0) + " -----------------")
		  main.lblState.text = ""
		  
		  if main.loadcount = main.updateCount then
		    main.tb_main.tb_refresh.Enabled = true
		    main.tb_main.tb_update.Enabled = false
		    main.tb_main.tb_delete.Enabled = true
		    main.tb_main.tb_scanlocal.Enabled = true
		    main.tb_main.tb_new.Enabled = true
		    main.tb_main.tb_edit.Enabled = true
		    main.Listbox1.Enabled = true
		    app.refreshIsRunning = 0
		    main.loadcount = 0
		    main.updateCount = 0
		    main.proBar.Maximum = 100
		    main.proBar.Visible = false
		  end if
		  me.Close
		   
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function ProxyAuthenticationRequired(Realm As String, Headers As InternetHeaders, ByRef Name As String, ByRef Password As String) As Boolean
		  Name = app.proxy_user
		  Password = app.proxy_password
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub ReceiveProgress(bytesReceived as integer, totalBytes as integer, newData as string)
		  'to enable contextmenu
		  main.Listbox1.Enabled = false
		  
		  main.lblState.text = "Downloading " + main.listbox1.Cell(i,0)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From HTTPSecureSocket
		  // Constructor() -- From TCPSocket
		  // Constructor() -- From SocketCore
		  Super.Constructor
		  
		  HTTPProxyAddress = app.proxy_server
		  HTTPProxyPort = app.proxy_port
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		i As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		zipFile As FolderItem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Address"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesAvailable"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesLeftToSend"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Handle"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="httpProxyAddress"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="httpProxyPort"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="i"
			Group="Behavior"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsConnected"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastErrorCode"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LocalAddress"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RemoteAddress"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="yield"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
