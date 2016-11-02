#tag Module
Protected Module PreferencesModule
	#tag Method, Flags = &h1
		Protected Sub Initialize(appName As String)
		  Preferences = New Prefs(appName)
		  gAppName = appName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Log(topic as String, message as string)
		  'logging function
		  
		  Dim mLogFile as FolderItem
		  Dim appFolder As FolderItem = SpecialFolder.ApplicationData.Child(gAppName)
		  Dim prefFolder As FolderItem = appFolder.Child("logs")
		  
		  'create missing folder
		  if prefFolder.Exists = false then
		    prefFolder.createAsFolder
		  end if
		  
		  'create filename
		  Dim d As New Date
		  Dim dateFile as String = "_" + d.Day.ToText + d.Month.ToText + d.Year.ToText
		  Dim prefName As String = gAppName + dateFile + ".log"
		  
		  'set logfile
		  mLogFile = prefFolder.Child(prefName)
		  
		  'cleaning and encodings
		  topic = ReplaceLineEndings(topic,"")
		  message = ReplaceLineEndings(message,"")
		  topic = ConvertEncoding(topic, Encodings.UTF8)
		  message = ConvertEncoding(message, Encodings.UTF8)
		  
		  'build the entry
		  Dim finishedEntry as string = d.ShortDate + " - " + d.LongTime + ": " + "[" + topic + "] " + message + endofline
		  System.DebugLog("Log-File Entry: " + " [" + topic + "]" + message )
		  if Preferences.logging = "true" then
		    'write entry to log
		    If mLogFile <> Nil then
		      Try
		        Dim t as TextOutputStream = TextOutputStream.Append(mLogFile)
		        t.Write finishedEntry
		      Catch e as IOException
		        //handle error
		        MsgBox("LogFile-Error: " + e.Message)
		      End Try
		    End if
		  end if 
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Documentation
		Manages your local application preferences.  Preferences are loaded and saved
		automatically.
		
		Usage:
		
		In your App.Open event, call PreferencesModule.Initialize("MyAppName")
		before using the PreferencesModule
		
		Preferences.Load loads your preferences
		Preferences.Save saves your preferences
		
		To assign preferences values:
		
		Preferences.PrefName = value Or Preferences.Set("PrefName") = value
		value = Preferences.PrefName Or value = Preferences.Get("PrefName")
		
		If you attempt to access a preference that does not exist, a
		PreferenceNotFoundException is raised.
		
	#tag EndNote


	#tag Property, Flags = &h0
		gAppName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Preferences As Prefs
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="gAppName"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
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
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
