#tag Module
Protected Module helper
	#tag Method, Flags = &h0
		Function IsConnected() As Boolean
		  'online check
		  Dim https as new whttps
		  Dim Result as String = https.Get("https://www.google.de",5)
		  if Result <> "" then
		    return true
		  else
		    return false
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pathOpen(f as FolderItem)
		  'This opens a path in the explorer / finder
		  Dim exec as new Shell 
		  Dim cmd as string 
		  if f<>  nil then 
		    if f.Exists then 
		      #IF TargetWin32 then 
		        cmd  = "explorer.exe /select,"+ chr(34)+ f.NativePath+ chr(34) 
		        System.DebugLog(cmd)
		        exec.execute(cmd) 
		      #elseIf TargetMachO or TargetMacOS then 
		        cmd  = "Open -R "+  f.ShellPath 
		        exec.execute(cmd) 
		      #else 
		        ' Linux
		      #endif 
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowDialog(form As Window, parent As Window)
		  'form position in the parent form
		  form.Left = parent.Left+(parent.Width-form.Width) / 2
		  form.Top = parent.Top+(parent.Height-form.Height) / 2
		  form.ShowModal
		End Sub
	#tag EndMethod


	#tag ViewBehavior
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
