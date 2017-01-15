#tag Class
Protected Class uThread
Inherits Thread
	#tag Event
		Sub Run()
		  'set HTTPSocket
		  Dim h as new whttps
		  Dim ht as new HTTPSocket
		  ht.Yield = true
		  h.Yield = true
		  h.SetRequestHeader("User-Agent:", "curl/7.21.0 (i686-pc-linux-gnu) libcurl/7.21.0 OpenSSL/0.9.8o zlib/1.2.3.4 libidn/1.18")
		  
		  Dim source as String
		  Dim DownloadSource as String
		  Dim AddonVersion as String 
		  Dim DownloadLink as String 
		  Dim DownloadPage as String
		  
		  'curse operation
		  if gUrl.InStr("https://mods.curse.com/addons/wow") >0 then 
		    'get sourcecode
		    source=h.Get(gUrl,15)
		    
		    'search AddonVersion
		    AddonVersion = app.getRegex(source,"<li class=""newest-file"">[^:]+: ([^<]+)")
		    rAddonVersion = AddonVersion
		    
		    'add support links
		    Dim patreon as string = app.getPatreonLink(source)
		    rPatreon = patreon
		    
		    'search DownloadPage
		    DownloadPage = app.getRegex(source,"<tr class=""even""><td><a href=""(.+)""")
		    DownloadPage = "https://mods.curse.com" + DownloadPage
		    
		    'Search DownloadLink
		    DownloadSource = h.Get(DownloadPage,50)
		    DownloadLink = app.getRegex(DownloadSource,"data-href=""(.+)"" class=""download-link""")
		    
		    'correct the download link to https
		    if DownloadLink = "nomatch" then
		      rDownloadLink = "link catch failed (No Curse Addon?)"
		    else
		      rDownloadLink = main.createDownloadURL(DownloadLink)
		    end if
		  end if
		  'end curse operations
		  
		  'git operations
		  if gUrl.InStr("http://git.tukui.org/elv") >0 then 
		    'get sourcecode
		    source=ht.Get(gUrl,15)
		    AddonVersion = app.getRegex(source, "^## Version: (.+)")
		    DownloadLink = "http://www.tukui.org/downloads/elvui-" + AddonVersion + ".zip"
		    rAddonVersion = AddonVersion
		    rDownloadLink = DownloadLink
		  end if
		  
		  'git sysworx operations
		  if gUrl.InStr("https://raw.githubusercontent.com/sysworx/elvui_fork") >0 then 
		    'get sourcecode
		    source=h.Get(gUrl,15)
		    AddonVersion = app.getRegex(source, "^## Version: (.+)")
		    DownloadLink = "https://raw.githubusercontent.com/sysworx/elvui_fork/master/elvui.zip"
		    rAddonVersion = AddonVersion
		    rDownloadLink = DownloadLink
		  end if
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(addon as string, version as string, url as string, entry as integer)
		  gAddon = addon
		  gVersion = version
		  gUrl = url
		  lbEntry = entry
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		gAddon As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gUrl As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gVersion As String
	#tag EndProperty

	#tag Property, Flags = &h0
		lbEntry As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		rAddonVersion As String
	#tag EndProperty

	#tag Property, Flags = &h0
		rDownloadLink As String
	#tag EndProperty

	#tag Property, Flags = &h0
		rPatreon As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="gAddon"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gUrl"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gVersion"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lbEntry"
			Group="Behavior"
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
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="rAddonVersion"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="rDownloadLink"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="rPatreon"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
