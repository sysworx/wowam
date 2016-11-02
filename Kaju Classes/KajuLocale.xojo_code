#tag Module
Protected Module KajuLocale
	#tag Note, Name = About
		
		Any data that needs to be localized (strings, mostly) goes here.
		
		The only exceptions are strings that might need to be compared by the developer, 
		like error messages in KajuException.
	#tag EndNote


	#tag Constant, Name = kAppMarker, Type = String, Dynamic = False, Default = \"<<AppName>>", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kBadDownloadMessage, Type = String, Dynamic = True, Default = \"The downloaded file appears to be corrupted.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"The downloaded file appears to be corrupted."
	#tag EndConstant

	#tag Constant, Name = kBinaryInfoInvalidReason, Type = String, Dynamic = True, Default = \"Binary information is not valid", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Binary information is not valid"
	#tag EndConstant

	#tag Constant, Name = kCancelButton, Type = String, Dynamic = True, Default = \"&Cancel", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"&Cancel"
	#tag EndConstant

	#tag Constant, Name = kCannotSkipVersionsMessage, Type = String, Dynamic = True, Default = \"You cannot skip versions until you have updated to version <<Version>> or beyond.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"You cannot skip versions until you have updated to version <<Version>> or beyond."
	#tag EndConstant

	#tag Constant, Name = kChoose64bitMessage, Type = String, Dynamic = True, Default = \"The update is only available as 64-bit. Proceed\?", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"The update is only available as 64-bit. Proceed\?"
	#tag EndConstant

	#tag Constant, Name = kChooseBetweenBitsMessage, Type = String, Dynamic = True, Default = \"This update is also available as 64-bit. Which would you prefer\?", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"This update is also available as 64-bit. Which would you prefer\?"
	#tag EndConstant

	#tag Constant, Name = kCurrenlyUsing32bitMessage, Type = String, Dynamic = True, Default = \"You are currently using the 32-bit version.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"You are currently using the 32-bit version."
	#tag EndConstant

	#tag Constant, Name = kDownloadingMessage, Type = String, Dynamic = True, Default = \"Downloading...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Downloading..."
	#tag EndConstant

	#tag Constant, Name = kDryRunMessage, Type = String, Dynamic = True, Default = \"(Dry run\x2C not really installing)", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"(Dry run\x2C not really installing)"
	#tag EndConstant

	#tag Constant, Name = kErrorBadUpdateData, Type = String, Dynamic = True, Default = \"The update data cannot be read.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"The update data cannot be read."
	#tag EndConstant

	#tag Constant, Name = kErrorIncorrectPacketMarker, Type = String, Dynamic = True, Default = \"The update packet signature marker was incorrect.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"The update packet signature marker was incorrect."
	#tag EndConstant

	#tag Constant, Name = kErrorIncorrectPacketSignature, Type = String, Dynamic = True, Default = \"The RSA signature of the update packet cannot be verified.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"The RSA signature of the update packet cannot be verified."
	#tag EndConstant

	#tag Constant, Name = kErrorNoUpdateData, Type = String, Dynamic = True, Default = \"No update data was available.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"No update data was available."
	#tag EndConstant

	#tag Constant, Name = kErrorOccurredMessage, Type = String, Dynamic = True, Default = \"An error has occurred. Would you like to try again now or later\?", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"An error has occurred. Would you like to try again now or later\?"
	#tag EndConstant

	#tag Constant, Name = kExplain64bitMessage, Type = String, Dynamic = True, Default = \"Your system may not be able to run the 64-bit version. If you\xE2\x80\x99re not sure\x2C do not select it.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Your system may not be able to run the 64-bit version. If you\xE2\x80\x99re not sure\x2C do not select it."
	#tag EndConstant

	#tag Constant, Name = kGenericErrorMessage, Type = String, Dynamic = True, Default = \"An error has occurred.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"An error has occurred."
	#tag EndConstant

	#tag Constant, Name = kInstallButton, Type = String, Dynamic = True, Default = \"Install Update", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Install Update"
	#tag EndConstant

	#tag Constant, Name = kLaterButton, Type = String, Dynamic = True, Default = \"Later", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Later"
	#tag EndConstant

	#tag Constant, Name = kMainNotice, Type = String, Dynamic = True, Default = \"A new version of <<AppName>> is available!", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"A new version of <<AppName>> is available!"
	#tag EndConstant

	#tag Constant, Name = kMissingAppNameReason, Type = String, Dynamic = True, Default = \"Missing app name", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Missing app name"
	#tag EndConstant

	#tag Constant, Name = kMissingReason, Type = String, Dynamic = True, Default = \"Missing", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Missing"
	#tag EndConstant

	#tag Constant, Name = kNewVersionMarker, Type = String, Dynamic = False, Default = \"<<NewVersion>>", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kNoUpdateInfoMessage, Type = String, Dynamic = True, Default = \"NO UPDATE INFORMATION", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"NO UPDATE INFORMATION"
	#tag EndConstant

	#tag Constant, Name = kPaymentRequiredMessage, Type = String, Dynamic = True, Default = \"This update is not free and will require payment. Proceed anyway\?", Scope = Protected
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Das ist ein kostenpflichtiges Update. Dennoch installieren\?"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Cette mise \xC3\xA0 jour est payante. Souhaitez-vous continuer \?"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Esta actualizaci\xC3\xB3n no es gratuita y requerir\xC3\xA1 un pago. \xC2\xBFContinuar\?"
		#Tag Instance, Platform = Any, Language = fi, Definition  = \"T\xC3\xA4m\xC3\xA4 on maksullinen p\xC3\xA4ivitys. Jatketaanko kuitenkin\?"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Questo aggiornamento non \xC3\xA8 gratuito e richieder\xC3\xA0 un pagamento. Vuoi proseguire comunque\?"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Deze update is niet gratis en zal betaling vragen\x2C wilt u doorgaan\?"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"This update is not free and will require payment. Proceed anyway\?"
	#tag EndConstant

	#tag Constant, Name = kProceedButton, Type = String, Dynamic = True, Default = \"Proceed", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Proceed"
	#tag EndConstant

	#tag Constant, Name = kProcessingFileMessage, Type = String, Dynamic = True, Default = \"Processing file...", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Processing file..."
	#tag EndConstant

	#tag Constant, Name = kQuitButton, Type = String, Dynamic = True, Default = \"Quit && Install", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Quit && Install"
	#tag EndConstant

	#tag Constant, Name = kReadyMessage, Type = String, Dynamic = True, Default = \"Ready to install", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Ready to install"
	#tag EndConstant

	#tag Constant, Name = kReleaseNotesLabel, Type = String, Dynamic = True, Default = \"Release Notes:", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Release Notes:"
	#tag EndConstant

	#tag Constant, Name = kRemindMeLaterButton, Type = String, Dynamic = True, Default = \"Remind Me Later", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Remind Me Later"
	#tag EndConstant

	#tag Constant, Name = kSecondaryNoticeMultiple, Type = String, Dynamic = True, Default = \"You have version <<ThisVersion>> and there are multiple updates available. Install one\?", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"You have version <<ThisVersion>> and there are multiple updates available. Install one\?"
	#tag EndConstant

	#tag Constant, Name = kSecondaryNoticeOne, Type = String, Dynamic = True, Default = \"You have version <<ThisVersion>>. Would you like to install version <<NewVersion>>\?", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"You have version <<ThisVersion>>. Would you like to install version <<NewVersion>>\?"
	#tag EndConstant

	#tag Constant, Name = kSkipVersionButton, Type = String, Dynamic = True, Default = \"Skip Version", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Skip Version"
	#tag EndConstant

	#tag Constant, Name = kStopButton, Type = String, Dynamic = True, Default = \"Stop", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Stop"
	#tag EndConstant

	#tag Constant, Name = kThisApplication, Type = String, Dynamic = True, Default = \"this application", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"this application"
	#tag EndConstant

	#tag Constant, Name = kThisVersionMarker, Type = String, Dynamic = False, Default = \"<<ThisVersion>>", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTimedOutMessage, Type = String, Dynamic = True, Default = \"The operation has timed out.", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"The operation has timed out."
	#tag EndConstant

	#tag Constant, Name = kTryAgainButton, Type = String, Dynamic = True, Default = \"Try Again", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Try Again"
	#tag EndConstant

	#tag Constant, Name = kTryLaterButton, Type = String, Dynamic = True, Default = \"Try Later", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Try Later"
	#tag EndConstant

	#tag Constant, Name = kUse32bitLabel, Type = String, Dynamic = True, Default = \"Stay With 32-bit", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Stay With 32-bit"
	#tag EndConstant

	#tag Constant, Name = kUse64bitLabel, Type = String, Dynamic = True, Default = \"Switch To 64-bit", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Switch To 64-bit"
	#tag EndConstant

	#tag Constant, Name = kVersionMarker, Type = String, Dynamic = False, Default = \"<<Version>>", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kVersionMustBeInFormReason, Type = String, Dynamic = True, Default = \"Version must be in one of these forms", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Version must be in one of these forms"
	#tag EndConstant

	#tag Constant, Name = kVersionsLabel, Type = String, Dynamic = True, Default = \"Available Versions:", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Available Versions:"
	#tag EndConstant

	#tag Constant, Name = kWindowTitle, Type = String, Dynamic = True, Default = \"Update Available", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Update Available"
	#tag EndConstant


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
