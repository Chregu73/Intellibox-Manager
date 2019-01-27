;MainWindow

;Folgende Variable wird im Listview.pbf deklariert,
;damit sie dort verfügbar ist
;Global Window_0

Global Panel_0, Button_0, Button_1, Button_2, Button_3
Global Button_4, Button_5, Spin_0, Text_1, Text_2, Spin_1
Global Option_0, Option_1, TrackBar_1, Checkbox_0
Global Checkbox_1, Checkbox_2, Checkbox_3, Checkbox_4
Global Text_3, Checkbox_5, Checkbox_7, Checkbox_8
Global Checkbox_9, Text_6, Checkbox_10, Checkbox_11
Global Checkbox_12, Checkbox_13, Button_7, Editor_0
Global Text_7, Spin_2, Checkbox_14, Checkbox_15
Global Checkbox_16, Checkbox_17, Checkbox_18, Checkbox_19
Global Checkbox_20, Checkbox_21, Button_8, Editor_1
Global Text_8, Spin_3, Button_9, Editor_2, Button_10
Global Button_11, Text_9, Spin_4, Button_12, String_0
Global Option_2, Option_3, Button_15, Button_16
Global Button_17, Button_18, Button_19, Button_20
Global Button_21, Button_22, Button_23, Button_24
Global Button_25, ListView, IP_1, Text_0, Button_13
Global Button_14, Text_10, Spin_5, Editor_3

Global Button_26, Button_27, Canvas_1, Button_28
Global Editor_4, Editor_5, Button_29, Button_30, Button_31

Global Img_0, Img_1, Img_2, Img_3, Img_4
Global Img_5, Img_6, Img_7, Img_8, Img_9
Global Img_10, Img_11
Global Img_12, Img_13

Global StartTime.q = ElapsedMilliseconds()

Enumeration #PB_Compiler_EnumerationValue
  #MenuItem_11
  #MenuItem_12
  #MenuItem_21
  #MenuItem_22
  #MenuItem_23
  #MenuItem_24
  #MenuItem_25
  #MenuItem_98
  #MenuItem_99
EndEnumeration

Img_0 = LoadImage(#PB_Any,"Icons\Open.ico")
Img_1 = LoadImage(#PB_Any,"Icons\Save.ico")
Img_2 = LoadImage(#PB_Any,"Icons\New.ico")
Img_3 = LoadImage(#PB_Any,"Icons\Print.ico")
Img_4 = LoadImage(#PB_Any,"Icons\SaveAs.ico")

Img_5 = CreateImage(#PB_Any, 120, 30) 
  StartDrawing(ImageOutput(Img_5)) 
    Box(0, 0, 120, 30, RGB(220, 0, 0)) 
  StopDrawing() 

Img_6 = CreateImage(#PB_Any, 120, 30) 
  StartDrawing(ImageOutput(Img_6)) 
    Box(0, 0, 120, 30, RGB(34, 177, 76)) 
  StopDrawing() 
  
Img_7 = CreateImage(#PB_Any, 41, 335) 
StartDrawing(ImageOutput(Img_7))
FillArea(10, 10, -1, GetSysColor_(#COLOR_WINDOW))
  LineXY(0, 0, 40, 0, RGB(0, 0, 0)) 
  LineXY(20, 334, 40, 0, RGB(0, 0, 0)) 
  LineXY(20, 334, 0, 0, RGB(0, 0, 0)) 
  FillArea(10, 10, RGB(0, 0, 0), RGB(0, 0, 0))
StopDrawing() 

Img_8 = LoadImage(#PB_Any,"Icons\Help.ico")
Img_9 = LoadImage(#PB_Any,"Icons\Info.ico")
Img_10 = LoadImage(#PB_Any,"Icons\Settings.ico")
Img_11 = LoadImage(#PB_Any,"Icons\LogOut.ico")

Img_12 = CreateImage(#PB_Any, 30, 30)
  StartDrawing(ImageOutput(Img_12))
  FillArea(15, 10, -1, GetSysColor_(#COLOR_WINDOW))
  LineXY(14, 0, 4, 12, RGB(0, 0, 0))
  LineXY(4, 12, 10, 12, RGB(0, 0, 0))
  LineXY(10, 12, 10, 29, RGB(0, 0, 0))
  LineXY(10, 29, 19, 29, RGB(0, 0, 0))
  LineXY(19, 29, 19, 12, RGB(0, 0, 0))
  LineXY(19, 12, 25, 12, RGB(0, 0, 0))
  LineXY(25, 12, 14, 0, RGB(0, 0, 0))
  FillArea(15, 10, RGB(0, 0, 0), RGB(0, 0, 0))
  StopDrawing()
  
Img_13 = CreateImage(#PB_Any, 30, 30)
  StartDrawing(ImageOutput(Img_13))
  FillArea(15, 10, -1, GetSysColor_(#COLOR_WINDOW))
  LineXY(14, 29-0, 4, 29-12, RGB(0, 0, 0))
  LineXY(4, 29-12, 10, 29-12, RGB(0, 0, 0))
  LineXY(10, 29-12, 10, 29-29, RGB(0, 0, 0))
  LineXY(10, 29-29, 19, 29-29, RGB(0, 0, 0))
  LineXY(19, 29-29, 19, 29-12, RGB(0, 0, 0))
  LineXY(19, 29-12, 25, 29-12, RGB(0, 0, 0))
  LineXY(25, 29-12, 14, 29-0, RGB(0, 0, 0))
  FillArea(15, 10, RGB(0, 0, 0), RGB(0, 0, 0))
  StopDrawing()
  

Procedure InitWindow_0()
  OpenPreferences("ibm.ini")
  PreferenceGroup("settings")
  Window_0 = OpenWindow(#PB_Any, ReadPreferenceLong("fensterposition_x", 50), ReadPreferenceLong("fensterposition_y", 50), 700, 550, "Intellibox-Manager", #PB_Window_SystemMenu)
  Button_26 = ButtonGadget(#PB_Any, 20, 10, 260, 30, "Serielle Schnittstelle öffnen", #PB_Button_Toggle)
  Button_27 = ButtonGadget(#PB_Any, 300, 10, 260, 30, "UDP Server starten", #PB_Button_Toggle)
  Button_29 = ButtonGadget(#PB_Any, 580, 10, 100, 30, "Hilfe")
  CreateStatusBar(0, WindowID(Window_0))
  AddStatusBarField(280)
  StatusBarText(0, 0, "Serielle Schnittstelle geschlossen")
  AddStatusBarField(280)
  StatusBarText(0, 1, "UDP-Server gestoppt")
  AddStatusBarField(#PB_Ignore)
  StatusBarProgress(0, 2, 0)
  CreateImageMenu(0, WindowID(Window_0))
  MenuTitle("Datei")
  MenuItem(#MenuItem_11,"Einstellungen",ImageID(Img_10))
  MenuBar()
  MenuItem(#MenuItem_12,"Beenden",ImageID(Img_11))
  MenuTitle("Dekoder")
  MenuItem(#MenuItem_21,"&Laden" + Chr(9) + "Strg+O",ImageID(Img_0))
  MenuItem(#MenuItem_22,"&Speichern" + Chr(9) + "Strg+S",ImageID(Img_1))
  MenuItem(#MenuItem_23,"Speichern als...",ImageID(Img_4))
  MenuItem(#MenuItem_24,"Leerer Dekoder erzeugen",ImageID(Img_2))
  MenuItem(#MenuItem_25,"Tabelle drucken",ImageID(Img_3))
  MenuTitle("Über")
  MenuItem(#MenuItem_98,"Hilfe" + Chr(9) + "F1",ImageID(Img_8))
  MenuBar()
  MenuItem(#MenuItem_99,"Info",ImageID(Img_9))
  ;F1 #PB_Shortcut_F1 kann man auch drücken für Hilfe
  ;und zum Hilfe-Event #MenuItem_98 angefügt 
  AddKeyboardShortcut(Window_0, #PB_Shortcut_F1, #MenuItem_98)

  
  Panel_0 = PanelGadget(#PB_Any, 10, 50, 680, 440)
  AddGadgetItem(Panel_0, -1, "Zentrale")
  Button_0 = ButtonGadget(#PB_Any, 10, 18, 260, 60, "GO")
  Button_1 = ButtonGadget(#PB_Any, 10, 98, 260, 60, "STOP")
  Button_2 = ButtonGadget(#PB_Any, 10, 178, 120, 30, "Baudrate")
  Button_3 = ButtonGadget(#PB_Any, 150, 178, 120, 30, "Status")
  Button_4 = ButtonGadget(#PB_Any, 10, 228, 120, 30, "Version")
  Button_5 = ButtonGadget(#PB_Any, 150, 228, 120, 30, "HALT")
  Editor_0 = EditorGadget(#PB_Any, 290, 18, 368, 378, #PB_Editor_ReadOnly)
  SetGadgetColor(Editor_0, #PB_Gadget_BackColor, RGB(255, 255, 255))
  
  AddGadgetItem(Panel_0, -1, "Lokbefehl")
  Text_1 = TextGadget(#PB_Any, 10, 18, 120, 20, "Loknummer")
  Spin_0 = SpinGadget(#PB_Any, 150, 18, 120, 20, 1, 10239, #PB_Spin_Numeric)
  SetGadgetColor(Spin_0, #PB_Gadget_BackColor, RGB(255, 255, 255))
  SetGadgetState(Spin_0, ReadPreferenceLong("loknummer", 4))
  Text_2 = TextGadget(#PB_Any, 10, 48, 120, 20, "Geschwindigkeit")
  Spin_1 = SpinGadget(#PB_Any, 150, 48, 120, 20, 0, 127, #PB_Spin_Numeric)
  SetGadgetColor(Spin_1, #PB_Gadget_BackColor, RGB(255, 255, 255))
  SetGadgetState(Spin_1, 0)
  Button_30 = ButtonImageGadget(#PB_Any, 10, 78, 30, 30, ImageID(Img_12))
  Button_31 = ButtonImageGadget(#PB_Any, 10, 108, 30, 30, ImageID(Img_13))
  Option_0 = OptionGadget(#PB_Any, 80, 83, 100, 20, "Vorwärts")
  Option_1 = OptionGadget(#PB_Any, 80, 113, 110, 20, "Rückwärts")
  SetGadgetState(Option_0, 1)
  Checkbox_0 = CheckBoxGadget(#PB_Any, 10, 148, 60, 20, "F0 (FL)")
  Checkbox_1 = CheckBoxGadget(#PB_Any, 10, 178, 40, 20, "F1")
  Checkbox_2 = CheckBoxGadget(#PB_Any, 80, 178, 40, 20, "F2")
  Checkbox_3 = CheckBoxGadget(#PB_Any, 150, 178, 40, 20, "F3")
  Checkbox_4 = CheckBoxGadget(#PB_Any, 220, 178, 40, 20, "F4")
  ;Checkbox_5 = CheckBoxGadget(#PB_Any, 10, 208, 40, 20, "F5")
  ;Checkbox_7 = CheckBoxGadget(#PB_Any, 80, 208, 40, 20, "F6")
  ;Checkbox_8 = CheckBoxGadget(#PB_Any, 150, 208, 40, 20, "F7")
  ;Checkbox_9 = CheckBoxGadget(#PB_Any, 220, 208, 40, 20, "F8")
  Button_7 = ButtonGadget(#PB_Any, 10, 338, 260, 60, "Abfragen")
  Editor_1 = EditorGadget(#PB_Any, 290, 18, 368, 378, #PB_Editor_ReadOnly)
  SetGadgetColor(Editor_1, #PB_Gadget_BackColor, RGB(255, 255, 255))
  
  AddGadgetItem(Panel_0, -1, "Fahren")
  Text_3 = TextGadget(#PB_Any, 10, 18, 110, 20, "Geschwindigkeit")
  TrackBar_1 = TrackBarGadget(#PB_Any, 10, 48, 40, 360, 0, 127, #PB_TrackBar_Ticks | #PB_TrackBar_Vertical)
  ImageGadget(#PB_Any, 60, 60, 41, 335, ImageID(Img_7))

  AddGadgetItem(Panel_0, -1, "Funktionsbefehl")
  Text_7 = TextGadget(#PB_Any, 10, 18, 120, 20, "Loknummer")
  Spin_2 = SpinGadget(#PB_Any, 150, 18, 120, 20, 0, 127, #PB_Spin_Numeric)
  SetGadgetColor(Spin_2, #PB_Gadget_BackColor, RGB(255, 255, 255))
  SetGadgetState(Spin_2, 4)
  Checkbox_14 = CheckBoxGadget(#PB_Any, 10, 168, 40, 20, "F1")
  Checkbox_15 = CheckBoxGadget(#PB_Any, 80, 168, 40, 20, "F2")
  Checkbox_16 = CheckBoxGadget(#PB_Any, 150, 168, 40, 20, "F3")
  Checkbox_17 = CheckBoxGadget(#PB_Any, 220, 168, 40, 20, "F4")
  Checkbox_18 = CheckBoxGadget(#PB_Any, 10, 198, 40, 20, "F5")
  Checkbox_19 = CheckBoxGadget(#PB_Any, 80, 198, 40, 20, "F6")
  Checkbox_20 = CheckBoxGadget(#PB_Any, 150, 198, 40, 20, "F7")
  Checkbox_21 = CheckBoxGadget(#PB_Any, 220, 198, 40, 20, "F8")
  Text_6 = TextGadget(#PB_Any, 10, 238, 140, 20, "Erweiterte Funktionen:")
  Checkbox_10 = CheckBoxGadget(#PB_Any, 10, 268, 40, 20, "F9")
  Checkbox_11 = CheckBoxGadget(#PB_Any, 80, 268, 40, 20, "F10")
  Checkbox_12 = CheckBoxGadget(#PB_Any, 150, 268, 40, 20, "F11")
  Checkbox_13 = CheckBoxGadget(#PB_Any, 220, 268, 50, 20, "F12")
  Button_8 = ButtonGadget(#PB_Any, 10, 338, 260, 60, "Abfragen")
  Editor_2 = EditorGadget(#PB_Any, 290, 18, 368, 378, #PB_Editor_ReadOnly)
  SetGadgetColor(Editor_2, #PB_Gadget_BackColor, RGB(255, 255, 255))
  
  AddGadgetItem(Panel_0, -1, "Weichen")
  Text_8 = TextGadget(#PB_Any, 10, 18, 120, 20, "Weichennummer")
  Spin_3 = SpinGadget(#PB_Any, 150, 18, 120, 20, 0, 2040, #PB_Spin_Numeric)
  SetGadgetColor(Spin_3, #PB_Gadget_BackColor, RGB(255, 255, 255))
  SetGadgetState(Spin_3, 0)
  Button_9 = ButtonGadget(#PB_Any, 10, 338, 260, 60, "Abfragen")
  Button_10 = ButtonImageGadget(#PB_Any, 10, 98, 120, 30, ImageID(Img_5))
  Button_11 = ButtonImageGadget(#PB_Any, 150, 98, 120, 30, ImageID(Img_6))
  Editor_3 = EditorGadget(#PB_Any, 290, 18, 368, 378, #PB_Editor_ReadOnly)
  SetGadgetColor(Editor_3, #PB_Gadget_BackColor, RGB(255, 255, 255))
  
  AddGadgetItem(Panel_0, -1, "S88")
  Text_9 = TextGadget(#PB_Any, 10, 18, 120, 20, "Modulnummer")
  Spin_4 = SpinGadget(#PB_Any, 150, 18, 120, 20, 1, 31, #PB_Spin_Numeric)
  SetGadgetColor(Spin_4, #PB_Gadget_BackColor, RGB(255, 255, 255))
  SetGadgetState(Spin_4, 1)
  Button_12 = ButtonGadget(#PB_Any, 10, 218, 260, 60, "Abfragen")
  String_0 = StringGadget(#PB_Any, 10, 298, 120, 20, "00000000 00000000")
  SetGadgetColor(String_0, #PB_Gadget_BackColor, RGB(255, 255, 255))
  Editor_4 = EditorGadget(#PB_Any, 290, 18, 368, 378, #PB_Editor_ReadOnly)
  SetGadgetColor(Editor_4, #PB_Gadget_BackColor, RGB(255, 255, 255))
  
  AddGadgetItem(Panel_0, -1, "CV-Programmierung")
  ;Option_2 = OptionGadget(#PB_Any, 10, 18, 160, 20, "Programmiermodus ein")
  ;Option_3 = OptionGadget(#PB_Any, 10, 48, 160, 20, "Programmiermodus aus")
  Button_28 = ButtonGadget(#PB_Any, 10, 18, 260, 30, "Programmiermodus ein", #PB_Button_Toggle)
  Button_15 = ButtonGadget(#PB_Any, 10, 58, 260, 20, "Decoder laden")
  Button_16 = ButtonGadget(#PB_Any, 10, 88, 260, 20, "Dekoder speichern")
  Button_17 = ButtonGadget(#PB_Any, 10, 118, 260, 20, "Leerer Dekoder erzeugen")
  Button_18 = ButtonGadget(#PB_Any, 10, 148, 260, 20, "Neuer Eintrag anfügen")
  Button_19 = ButtonGadget(#PB_Any, 10, 178, 260, 20, "Markierter Eintrag entfernen")
  Button_20 = ButtonGadget(#PB_Any, 10, 208, 260, 30, "Alle CV lesen")
  Button_21 = ButtonGadget(#PB_Any, 10, 248, 260, 30, "Alle CV schreiben")
  Button_22 = ButtonGadget(#PB_Any, 10, 288, 260, 20, "Markierte CV lesen")
  Button_23 = ButtonGadget(#PB_Any, 10, 318, 260, 20, "Markierte CV schreiben")
  Button_24 = ButtonGadget(#PB_Any, 10, 348, 260, 20, "Selektierte CV lesen")
  Button_25 = ButtonGadget(#PB_Any, 10, 378, 260, 20, "Selektierte CV schreiben")
  FrameGadget(40, 290, 18, 368, 378, "")
  Zeichne_Listview()
  
  AddGadgetItem(Panel_0, -1, "UDP-Server")
  IP_1 = IPAddressGadget(#PB_Any, 150, 188, 120, 20)
  Text_0 = TextGadget(#PB_Any, 10, 188, 120, 20, "IP-Adresse")
  Button_13 = ButtonGadget(#PB_Any, 10, 18, 260, 60, "Server starten")
  Button_14 = ButtonGadget(#PB_Any, 10, 98, 260, 60, "Server stoppen")
  Text_10 = TextGadget(#PB_Any, 10, 228, 120, 20, "Port")
  Spin_5 = SpinGadget(#PB_Any, 150, 228, 120, 20, 6000, 7000, #PB_Spin_Numeric)
  SetGadgetColor(Spin_5, #PB_Gadget_BackColor, RGB(255, 255, 255))
  SetGadgetState(Spin_5, ReadPreferenceLong("udp-port", 6000))
  Editor_5 = EditorGadget(#PB_Any, 290, 18, 368, 378, #PB_Editor_ReadOnly)
  SetGadgetColor(Editor_5, #PB_Gadget_BackColor, RGB(255, 255, 255))
  CloseGadgetList()
  
  ListViewDekoder.s = ReadPreferenceString("dekoder", "") 
  Lade_CSV(ListViewDekoder.s)
  NeuerTitel(ListViewDekoder.s)
  
  ClosePreferences()
EndProcedure


NetzwerkGestartet = 0

Procedure TextSchreiben(gadget.l, text.s)
  AddGadgetItem(gadget.l, -1, text.s)
  While CountGadgetItems(gadget.l) > 20
    RemoveGadgetItem(gadget.l, 0)
  Wend
EndProcedure

Procedure NetzwerkStarten()
  If NetzwerkGestartet = 0
    InitNetwork()
    NetzwerkGestartet = 1
  EndIf
  StatusBarText(0, 1, "UDP-Server wird gestartet...")
  PortNummer.l = Val(GetGadgetText(Spin_5))
  UDPServerHandle.l = CreateNetworkServer(#PB_Any, PortNummer.l, #PB_Network_UDP)
  If UDPServerHandle.l
    SendMessage_(GadgetID(Spin_5), $000A, 0, 0)   ;Portnummer desaktivieren
    StatusBarText(0, 1, "UDP-Server gestartet Port: " + Str(PortNummer.l))
    TextSchreiben(Editor_5, "UDP-Server gestartet Port: " + Str(PortNummer.l))
    TextSchreiben(Editor_5, "Auf diesem Rechner verfügbare IP-Adressen:")
    If ExamineIPAddresses()
      IPAdresse.l = NextIPAddress()
      SetGadgetState(IP_1, IPAdresse.l)
      TextSchreiben(Editor_5, IPString(IPAdresse.l))
      Repeat
        IPAdresse.l = NextIPAddress()
        If IPAdresse.l = 0
          Break
        EndIf
        TextSchreiben(Editor_5, IPString(IPAdresse.l))
      Until IPAdresse.l = 0
    Else
      TextSchreiben(Editor_5, "Keine IP-Adressen verfügbar!")
    EndIf
    
  Else
    StatusBarText(0, 1, "UDP-Server kann nicht gestartet werden")
  EndIf
EndProcedure

Procedure NetzwerkStoppen()
  If UDPServerHandle.l
    CloseNetworkServer(UDPServerHandle.l)
    SendMessage_(GadgetID(Spin_5), $000A, 1, 0)   ;Portnummer aktivieren
    UDPServerHandle.l = 0
    StatusBarText(0, 1, "UDP-Server gestoppt")
    TextSchreiben(Editor_5, "UDP-Server gestoppt")
  Else
    StatusBarText(0, 1, "UDP-Server gestoppt")
  EndIf
EndProcedure

Procedure LadeDekoder()
  DateiName.s = OpenFileRequester("Dekoder laden...", "", "*.csv | *.CSV", 0)
  If DateiName.s
    ListViewDekoder.s = DateiName.s
    NeuerTitel(ListViewDekoder.s)
    Lade_CSV(ListViewDekoder.s)
  EndIf
EndProcedure

Procedure DekoderSpeichern()
    Speichere_CSV(ListViewDekoder.s)
EndProcedure

Procedure DekoderSpeichernAls()
  DateiName.s = SaveFileRequester("Dekoder speichern als...", ListViewDekoder.s, "*.csv | *.CSV", 0)
  If Not DateiName.s = ""
    If Not FindString(DateiName.s, ".csv", 1, #PB_String_NoCase)
      DateiName.s = DateiName.s + ".csv"
    EndIf
    ListViewDekoder.s = DateiName.s
    NeuerTitel(ListViewDekoder.s)
    DekoderSpeichern()
  EndIf
EndProcedure

Procedure Hilfe()
  RunProgram("WinGuide.exe", "ibm.guide", "")
EndProcedure

Procedure Window_0_Events(event)
  Select event
    Case #PB_Event_CloseWindow
      ProcedureReturn #False

    Case #PB_Event_Gadget
      Select EventGadget()
          
        Case Button_13   ;UDP-Server starten ohne Toggle
          If Not GetGadgetState(Button_27)
            SetGadgetState(Button_27, 1)
            NetzwerkStarten()
          EndIf
              
        Case Button_14   ;UDP-Server stoppen ohne Toggle
          If GetGadgetState(Button_27)
            SetGadgetState(Button_27, 0)
            NetzwerkStoppen()
          EndIf
          
        Case Button_15   ;Lade Dekoder
          LadeDekoder()
          
        Case Button_16
          DekoderSpeichern()
          
        Case Button_17
          LeererDekoderErzeugen()

        Case Button_18   ;Neuer Eintrag anfügen
          NeuerEintragAnfuegen()
            
        Case Button_19   ;Markierte Zeile löschen
          NummerMarkierteZeile.l = CallFunction(ListViewLibraryHandle.l, "GetSelectedLine", ListViewHandle.l)
          SendMessage_(ListViewHandle.l, $1008, NummerMarkierteZeile.l, 0)
          ;SetActiveGadget(ListViewHandle.l)

        Case Button_20   ;Alle CV lesen
          CV_Bearbeiten("lese", "alle")
          
        Case Button_21   ;Alle CV schreiben
          CV_Bearbeiten("schreibe", "alle")

        Case Button_22   ;Markierte CV lesen
          CV_Bearbeiten("lese", "markierte")

        Case Button_23   ;Markierte CV schreiben
          CV_Bearbeiten("schreibe", "markierte")

        Case Button_24   ;Selektierte CV lesen
          CV_Bearbeiten("lese", "selektierte")

        Case Button_25   ;Selektierte CV schreiben
          CV_Bearbeiten("schreibe", "selektierte")

  
        Case Button_26   ;Serielle Schnittstelle öffnen
          If GetGadgetState(Button_26)   ;beim Einschalten
            StatusBarText(0, 0, "Serielle Schnittstelle öffnen...")
            OpenPreferences("ibm.ini")
            PreferenceGroup("port")
            ComPort.s = ReadPreferenceString("port", "COM0")
            ComBaud.l = ReadPreferenceLong("baud", 2400)
            ClosePreferences()
            SerialPortHandle.l = OpenSerialPort(#PB_Any, ComPort.s, ComBaud.l, #PB_SerialPort_NoParity, 8, 2, #PB_SerialPort_RtsCtsHandshake, 1024, 1024)
            If SerialPortHandle.l
              SerialPortTimeouts(SerialPortHandle.l, 100, 100, 100, 10, 100)
              StatusBarText(0, 0, "Serielle Schnittstelle geöffnet")
              TextSchreiben(Editor_0, ComPort.s + " mit " + Str(ComBaud.l) + " Baud geöffnet")
            Else
              StatusBarText(0, 0, "Kann serielle Schnittstelle nicht öffnen")
              SetGadgetState(Button_26, 0)
            EndIf
          Else
            If IsSerialPort(SerialPortHandle.l)
              CloseSerialPort(SerialPortHandle.l)
              SerialPortHandle.l = 0
              StatusBarText(0, 0, "Serielle Schnittstelle geschlossen")
              TextSchreiben(Editor_0, "Serielle Schnittstelle geschlossen")
            EndIf
          EndIf
          
        Case Button_27   ;UDP-Server starten mit Toggle
          If GetGadgetState(Button_27)   ;beim Einschalten
            NetzwerkStarten()
          Else   ;beim Ausschalten
            NetzwerkStoppen()
          EndIf
          
        Case Button_29   ;Hilfe
          Hilfe()
          
        Case Button_30
          SetGadgetState(Option_0, 1)
          
        Case Button_31
          SetGadgetState(Option_1, 1)
          
        Case Button_0   ;GO
          Holen("XGO")
          TextSchreiben(Editor_0, Ergebnis.s)
        Case Button_1   ;STOP
          Holen("XSTOP")
          TextSchreiben(Editor_0, Ergebnis.s)
          
          
        Case Button_2   ;Baudrate
          Holen("XB")
          TextSchreiben(Editor_0, Ergebnis.s)
          
        Case Button_3   ;Status
          Holen("XY")
          TextSchreiben(Editor_0, Ergebnis.s)
          
        Case Button_4   ;Version
          Holen("XV")
          TextSchreiben(Editor_0, Ergebnis.s)
          
        Case Button_5   ;HALT
          Holen("XHALT")
          TextSchreiben(Editor_0, Ergebnis.s)
          
        Case Button_28   ;Programmiermodus
          If GetGadgetState(Button_28)   ;beim Einschalten
            Ergebnis.s = ""
            Holen("XPT1")
            If Ergebnis.s <> "Ok"
              SetGadgetState(Button_28, 0)
            EndIf
          Else
            Holen("XPT0")
            ;TextSchreiben(Editor_0, Ergebnis.s)
          EndIf
          
;---------------------------------------------------------------
; Lokbefehle
; Format:
; Syntax: L {Lok#, [Speed], [FL], [Dir], [F1], [F2], [F3], [F4]}
;---------------------------------------------------------------
          
        Case Button_7   ;Abfragen
          Holen("XL" + GetGadgetText(Spin_0))
          TextSchreiben(Editor_1, "Lok-Nummer: " + GetGadgetText(Spin_0) + ": " + Ergebnis.s)
          
          ;bei Spinwechseln zwei Trigger, muss noch gefixt werden!
          ;auch #PB_EventType_Change bringt nichts
        Case Spin_1   ;Speed
          If #PB_EventType_Change
          Holen("XL" + GetGadgetText(Spin_0) + "," +
                GetGadgetText(Spin_1) + "," +
                Str(GetGadgetState(Checkbox_0)) + "," +
                Str(GetGadgetState(Option_0)) + "," +
                Str(GetGadgetState(Checkbox_1)) + "," +
                Str(GetGadgetState(Checkbox_2)) + "," +
                Str(GetGadgetState(Checkbox_3)) + "," +
                Str(GetGadgetState(Checkbox_4)))
          TextSchreiben(Editor_1, "Lok-Nummer: " +
                                  GetGadgetText(Spin_0) + ": Speed = " +
                                  GetGadgetText(Spin_1) + ", Dir = " +
                                  Str(GetGadgetState(Option_0)) + ", F01234 = " +
                                  Str(GetGadgetState(Checkbox_0)) +
                                  Str(GetGadgetState(Checkbox_1)) +
                                  Str(GetGadgetState(Checkbox_2)) +
                                  Str(GetGadgetState(Checkbox_3)) +
                                  Str(GetGadgetState(Checkbox_4)))
          
        EndIf
        
      Case Checkbox_0   ;F0 (FL)
        Holen("XL" + GetGadgetText(Spin_0) + ",," +
              Str(GetGadgetState(Checkbox_0)) + ",,,,,")
        TextSchreiben(Editor_1, "Lok-Nummer: " +
                                GetGadgetText(Spin_0) + ": F0 = " +
                                Str(GetGadgetState(Checkbox_0)))
              
        Case Checkbox_1   ;F1
        Holen("XL" + GetGadgetText(Spin_0) + ",,,," +
              Str(GetGadgetState(Checkbox_0)) + ",,,")
        TextSchreiben(Editor_1, "Lok-Nummer: " +
                                GetGadgetText(Spin_0) + ": F1 = " +
                                Str(GetGadgetState(Checkbox_1)))
        
        Case Checkbox_2   ;F2
        Holen("XL" + GetGadgetText(Spin_0) + ",,,,," +
              Str(GetGadgetState(Checkbox_0)) + ",,")
        TextSchreiben(Editor_1, "Lok-Nummer: " +
                                GetGadgetText(Spin_0) + ": F2 = " +
                                Str(GetGadgetState(Checkbox_2)))
        
        Case Checkbox_3   ;F3
        Holen("XL" + GetGadgetText(Spin_0) + ",,,,,," +
              Str(GetGadgetState(Checkbox_0)) + ",")
        TextSchreiben(Editor_1, "Lok-Nummer: " +
                                GetGadgetText(Spin_0) + ": F3 = " +
                                Str(GetGadgetState(Checkbox_3)))
        
        Case Checkbox_4   ;F4
        Holen("XL" + GetGadgetText(Spin_0) + ",,,,,,," +
              Str(GetGadgetState(Checkbox_0)))
        TextSchreiben(Editor_1, "Lok-Nummer: " +
                                GetGadgetText(Spin_0) + ": F4 = " +
                                Str(GetGadgetState(Checkbox_4)))
        
;-----------------------------------------------------------------
; Funktionsbefehle, Format:
; Syntax: F {Lok#, [F1], [F2], [F3], [F4], [F5], [F6], [F7], [F8]}
;-----------------------------------------------------------------
        
        Case Button_8   ;Abfragen
          Holen("XF" + GetGadgetText(Spin_2))
          TextSchreiben(Editor_2, "Lok-Nummer: " + GetGadgetText(Spin_2) + ": " + Ergebnis.s)
          Holen("XFX" + GetGadgetText(Spin_2))
          TextSchreiben(Editor_2, "Erweiterte Funktionen: " + Ergebnis.s)
        
        Case Checkbox_14,   ;F1
             Checkbox_15,   ;F2
             Checkbox_16,   ;F3
             Checkbox_17,   ;F4
             Checkbox_18,   ;F5
             Checkbox_19,   ;F6
             Checkbox_20,   ;F7
             Checkbox_21      ;F8
          holen("XF" + GetGadgetText(Spin_2) + "," +
                Str(GetGadgetState(Checkbox_14)) + "," +
                Str(GetGadgetState(Checkbox_15)) + "," +
                Str(GetGadgetState(Checkbox_16)) + "," +
                Str(GetGadgetState(Checkbox_17)) + "," +
                Str(GetGadgetState(Checkbox_18)) + "," +
                Str(GetGadgetState(Checkbox_19)) + "," +
                Str(GetGadgetState(Checkbox_20)) + "," +
                Str(GetGadgetState(Checkbox_21)))
          TextSchreiben(Editor_2, "Lok-Nummer: " + GetGadgetText(Spin_2) + ": " + Ergebnis.s)

;-----------------------------------------------------------------
; Erweiterte Funktionsbefehle, Format:
; Syntax: FX {Lok#, [F9], [F10], [F11], [F12]}
;-----------------------------------------------------------------
        
        Case Checkbox_10,   ;F9
             Checkbox_11,   ;F10
             Checkbox_12,   ;F11
             Checkbox_13   ;F12
          holen("XFX" + GetGadgetText(Spin_2) + "," +
                Str(GetGadgetState(Checkbox_10)) + "," +
                Str(GetGadgetState(Checkbox_11)) + "," +
                Str(GetGadgetState(Checkbox_12)) + "," +
                Str(GetGadgetState(Checkbox_13)))
          TextSchreiben(Editor_2, "Lok-Nummer: " + GetGadgetText(Spin_2) + ": " + Ergebnis.s)
          
        Case TrackBar_1   ;Fahren
          If (ElapsedMilliseconds() - StartTime) > 100   ;nur Ausführen, wenn > 100ms vorbei
            Holen("XL" + GetGadgetText(Spin_0) + "," +
                  Str(GetGadgetState(TrackBar_1)) + "," +   ;Speed
                  GetGadgetText(Spin_1))                           ;Dir
            StartTime.q = ElapsedMilliseconds()
            ;Debug GetGadgetState(TrackBar_1)
          EndIf
          
;Turnout (Weiche oder Signalschaltbefehl)
;Syntax: T {Trnt#, [Color], [Status]}
          
        Case Button_9   ;Abfragen
          Holen("XT" + GetGadgetText(Spin_3))
          TextSchreiben(Editor_3, "Weichen-Nummer: " + GetGadgetText(Spin_3) + " = " + Ergebnis.s)
          
        Case Button_10   ;Rot
          Holen("XT" + GetGadgetText(Spin_3) + ",r")
          TextSchreiben(Editor_3, "Weichen-Nummer: " + GetGadgetText(Spin_3) + " = ROT")
          
        Case Button_11   ;Grün
          Holen("XT" + GetGadgetText(Spin_3) + ",g")
          TextSchreiben(Editor_3, "Weichen-Nummer: " + GetGadgetText(Spin_3) + " = GRÜN")
          
;SS: s88-Modul auslesen
;Syntax: SS {Modulnummer}
;Modulnummer: 1..32
          
        Case Button_12
          Holen("XSS" + GetGadgetText(Spin_4))
          TextSchreiben(Editor_4, Ergebnis.s)
          SetGadgetText(String_0, Right(Ergebnis.s, 17))
          
      EndSelect
      
      
    Case #PB_Event_Menu
      Select EventMenu()
          
        Case #MenuItem_11   ;Einstellungen
          RunProgram("Einst_Schnittstelle_neu.exe", "", "", #PB_Program_Wait)

        Case #MenuItem_12   ;Beenden
          ProcedureReturn #False

        Case #MenuItem_21
          LadeDekoder()
          
        Case #MenuItem_22
          DekoderSpeichern()
          
        Case #MenuItem_23
          DekoderSpeichernAls()
          
        Case #MenuItem_24
          LeererDekoderErzeugen()
          
        Case #MenuItem_25   ;Tabelle drucken
          ListviewDrucken(ListViewDekoder.s)
          
        Case #MenuItem_98   ;Hilfe
          Hilfe()

        Case #MenuItem_99   ;Info
          RunProgram("info.exe", "", "")
          
      EndSelect
      
  EndSelect
  ProcedureReturn #True
EndProcedure


; IDE Options = PureBasic 5.62 (Windows - x86)
; CursorPosition = 217
; FirstLine = 199
; Folding = --
; EnableXP
; DisableDebugger