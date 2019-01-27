
Global SerialPortHandle.l, UDPServerHandle.l
Global NetzwerkGestartet.b, Ergebnis.s

Global *GlobalText = AllocateMemory(16384)

XIncludeFile "Serial.pbi"
XIncludeFile "Listview.pbi"
XIncludeFile "MainWindow.pbi"

InitWindow_0() ; Öffnet das erste Fenster. Dieser Prozedurname ist immer 'Open' gefolgt vom Fensternamen.

*DatenPuffer = AllocateMemory(21)

; Die übliche Haupt-Ereignisschleife, die einzige Änderung ist der automatische Aufruf der
; für jedes Fenster generierten Ereignis-Prozedur.



Repeat
  Event = WaitWindowEvent(10)
  ;Debug(Event)

  Select EventWindow()
    Case Window_0
      If Not Window_0_Events(Event)
        Event = #PB_Event_CloseWindow
      EndIf
  
  EndSelect
  
  If NetzwerkGestartet
    UDPEvent = NetworkServerEvent()
    Select UDPEvent
      Case #PB_NetworkEvent_Data
        FillMemory(*DatenPuffer, 21)   ;Puffer mit Nullen füllen
        UDPClient = EventClient()
        UDPDaten = ReceiveNetworkData(UDPClient, *DatenPuffer, 20)
        PufferText.s = PeekS(*DatenPuffer)
        TextSchreiben(Editor_5, "Von: " + IPString(GetClientIP(UDPClient)) + " Daten: " + PufferText.s)
        If SerialPortHandle.l
          ;Hier der Translator für "$" > ","
          PufferText.s = ReplaceString(PufferText.s, "$", ",")
          PufferText.s = Trim(PufferText.s)   ;allen Scheiss entfernen
          PufferText.s = UCase(PufferText.s)   ;und in Grossbuchstaben umwandeln
          WriteSerialPortString(SerialPortHandle.l, PufferText.s)
        EndIf
    EndSelect
  EndIf

Until Event = #PB_Event_CloseWindow

OpenPreferences("ibm.ini")
PreferenceGroup("settings")
;dekoder=U:\Projekte\Intellibox-Manager\MERG.csv
WritePreferenceLong("fensterposition_x", WindowX(Window_0))
WritePreferenceLong("fensterposition_y", WindowY(Window_0))
WritePreferenceLong("loknummer", Val(GetGadgetText(Spin_0)))
WritePreferenceLong("udp-port", Val(GetGadgetText(Spin_5)))
WritePreferenceString("dekoder", ListViewDekoder.s)
ClosePreferences()

If ListViewHandle
  Vernichte_Listview()
EndIf

If ListViewLibraryHandle
  CloseLibrary(ListViewLibraryHandle)
EndIf

If IsSerialPort(SerialPortHandle.l)
  CloseSerialPort(SerialPortHandle.l)
EndIf

FreeMemory(*DatenPuffer)
FreeMemory(*GlobalText)


; IDE Options = PureBasic 5.62 (Windows - x86)
; CursorPosition = 5
; EnableXP
; UseIcon = gP.ico
; Executable = IBM.exe
; Watchlist = Text;Text;Text;SerialPortHandle