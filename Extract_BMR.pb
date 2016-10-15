#Window = 0

Enumeration
  #TargetFiles_0
EndEnumeration

Gosub  LoadPreferences
If OpenWindow(#Window, x, y, 0, 90, "", #PB_Window_SystemMenu)

  ButtonGadget(#TargetFiles_0, 0, 0, 134, 90, "Перетащите сюда"+Chr(10)+"BOOTMGR"+Chr(10)+""+Chr(10)+"чтобы извлечь"+Chr(10)+"BOOTMGR.EXE", #PB_Button_MultiLine )
  EnableGadgetDrop(#TargetFiles_0, #PB_Drop_Files, #PB_Drag_Copy)
  Repeat
    
    Event = WaitWindowEvent()

   If Event = #PB_Event_GadgetDrop
      Select EventGadget()
                  Case #TargetFiles_0
                    Files$ = EventDropFiles()
                    Path$ = GetPathPart(Files$)
                    RunProgram ("bmzip.exe", ""+Chr(34)+""+Files$+""+Chr(34)+" "+Chr(34)+""+Path$+"bootmgr.exe"+Chr(34)+"", "", #PB_Program_Hide)
      EndSelect
    EndIf
    
  Until Event = #PB_Event_CloseWindow
  Gosub SavePreferences
EndIf
End

LoadPreferences:
 OpenPreferences("Extract_BMR.ini")
  PreferenceGroup("window")
  x=ReadPreferenceLong("x",200)
  y=ReadPreferenceLong("y",200)
 ClosePreferences()
Return

SavePreferences:
 If CreatePreferences("Extract_BMR.ini")
  PreferenceGroup("window")
  WritePreferenceLong("x",WindowX(0) )
  WritePreferenceLong("y", WindowY(0) )
  ClosePreferences()
 EndIf
Return

; IDE Options = PureBasic 5.30 (Windows - x86)
; CursorPosition = 28
; FirstLine = 8
; EnableUnicode
; EnableXP
; UseIcon = Extract_BMR.ico
; Executable = Extract_BMR.exe
; IncludeVersionInfo
; VersionField0 = 1.0.0.0
; VersionField1 = 1.0.0.0
; VersionField2 = Joker-2013
; VersionField3 = Extract_BMR
; VersionField4 = 1.0.0.0
; VersionField5 = 1.0.0.0
; VersionField6 = Extract_BMR
; VersionField7 = Extract_BMR
; VersionField8 = Extract_BMR.exe
; VersionField9 = Joker-2013
