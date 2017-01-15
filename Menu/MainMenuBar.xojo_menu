#tag Menu
Begin Menu MainMenuBar
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "&File"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem FileMenuOptions
         SpecialMenu = 0
         Text = "Options"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FileMenuCloud
         SpecialMenu = 0
         Text = "Cloud-Sync"
         Index = -2147483648
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem Separator0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Text = "#App.kFileQuit"
         Index = -2147483648
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem AddonsMenu
      SpecialMenu = 0
      Text = "&Addons"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem AddonsAddNoncurseaddon
         SpecialMenu = 0
         Text = "Add ""non-curse"" addon"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Visible = True
         Begin MenuItem AddonsAddNoncurseaddonElvUI
            SpecialMenu = 0
            Text = "ElvUI"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
      End
   End
   Begin MenuItem HelpMenu
      SpecialMenu = 0
      Text = "&?"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem HelpMenuUpdates
         SpecialMenu = 0
         Text = "Check for updates"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem Separator1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem HelpMenuHelp
         SpecialMenu = 0
         Text = "&Help"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem HelpMenuAbout
         SpecialMenu = 0
         Text = "&About"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
   End
End
#tag EndMenu
