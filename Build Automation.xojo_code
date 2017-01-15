#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
				Begin IDEScriptBuildStep Sign , AppliesTo = 2
					'CodeSign
					if (not TargetWindows) then
					return
					end if
					
					Dim sPROJECT as String = ProjectShellPath
					Dim n as integer = len(sPROJECT) - 11 'projectname
					Dim sSIGN as String = sPROJECT.Left(n) + "sign\"
					Dim sPROJECT_PATH As String = "$PROJECT_PATH"
					Dim sBUILD_LOCATION As String = CurrentBuildLocation
					Dim sBUILD_APPNAME As String = CurrentBuildAppName
					Dim sBUILD_EXE as String = CurrentBuildLocation + "\" +sBUILD_APPNAME
					
					Dim sShellResult As String
					sShellResult = DoShellCommand(sSIGN + "signtool.exe sign /f " + sSIGN +"\cert.p12 /p Start6916 " + sBUILD_EXE)
					Print "Sign Result: " + sShellResult
					
				End
			End
#tag EndBuildAutomation
