Global ListViewLibraryHandle.l, ListViewHandle.l, ListViewFont.l
Global ListViewDekoder.s
Global Text.s
Global Window_0   ;Deklarationen für MainWindow.pbf


ListViewLibraryHandle = OpenLibrary(#PB_Any, "Listview.dll")
;32 bit Library, geht nur mit 32bit Version von PB

If ListViewLibraryHandle = 0
  MessageRequester("Fehler", "Kann Listview.dll nicht laden")
EndIf

Procedure Zeichne_Listview()
  
MischFarbe.l = CallFunction(ListViewLibraryHandle.l, "MixRGBs", GetSysColor_(#COLOR_WINDOW), $ffffffff)  
MischFarbe.l = RGB(233, 231, 227)
ListViewHandle.l = CallFunction(ListViewLibraryHandle.l, "CreateListview", GadgetID(40), 0, 0, MischFarbe.l, -1, $00000425)

CallFunction(ListViewLibraryHandle.l, "EnableEdits", ListViewHandle.l, 1)

ListViewFont.l = LoadFont(#PB_Any, "Verdana", 12)
If ListViewFont
  ;Funktioniert (noch) nicht:
  ;Weder die Einte noch die Andere Variante
  ;Debug(SetGadgetFont(ListViewHandle.l, FontID(ListViewFont.l)))
  ;Debug(SetGadgetFont(ListViewHandle.l, ListViewFont.l))
EndIf

*Ascii = Ascii("")
CallFunction(ListViewLibraryHandle.l, "IColumn", ListViewHandle.l, *Ascii, 28, 2)
*Ascii = Ascii("CV#")
CallFunction(ListViewLibraryHandle.l, "IColumn", ListViewHandle.l, *Ascii, 64, 1)
*Ascii = Ascii("Beschreibung")
CallFunction(ListViewLibraryHandle.l, "IColumn", ListViewHandle.l, *Ascii, 192, 0)
*Ascii = Ascii("Wert")
CallFunction(ListViewLibraryHandle.l, "IColumn", ListViewHandle.l, *Ascii, 64, 1)

*SortSpalten = AllocateMemory(16)
PokeL(*SortSpalten+4, 2)
PokeL(*SortSpalten+8, 1)
PokeL(*SortSpalten+12, 2)
CallFunction(ListViewLibraryHandle.l, "ASortListview", ListViewHandle.l, *SortSpalten, 4)
FreeMemory(*SortSpalten)

CallFunction(ListViewLibraryHandle.l, "ShowListview", ListViewHandle.l, 0, 0, 368, 378)
CallFunction(ListViewLibraryHandle.l, "EnableEdits", ListViewHandle.l, 1)
CallFunction(ListViewLibraryHandle.l, "InitMessages", GadgetID(40))

EndProcedure

Procedure NeuerTitel(titel.s)
  titel.s = StringField(titel.s, CountString(titel.s, "\") + 1, "\")
  SetWindowTitle(Window_0, "Intellibox-Manager [" + titel.s + "]")
EndProcedure

Procedure Lade_CSV(ListViewDekoder.s)
  CallFunction(ListViewLibraryHandle.l, "DeleteAllItems", ListViewHandle.l)
  AnzahlBytes.l = FileSize(ListViewDekoder.s)
  If AnzahlBytes.l > 0   ;also grösser als 0
    *Ascii = Ascii(ListViewDekoder.s)
    *bereich = AllocateMemory(AnzahlBytes.l)
    CallFunction(ListViewLibraryHandle.l, "ReadFileQuick", *Ascii, *bereich, 0, AnzahlBytes.l)
    CallFunction(ListViewLibraryHandle.l, "CsvToListview", ListViewHandle.l, *bereich, AnzahlBytes.l, 4)
    
    ListViewCHB.s = ReplaceString(ListViewDekoder.s,"csv","chb",#PB_String_NoCase)
    AnzahlBytes.l = FileSize(ListViewCHB.s)
    If AnzahlBytes.l > 0   ;also grösser als 0
      *Ascii = Ascii(ListViewCHB.s)
      *bereich = ReAllocateMemory(bereich.l, AnzahlBytes.l)
      CallFunction(ListViewLibraryHandle.l, "ReadFileQuick", *Ascii, *bereich, 0, AnzahlBytes.l)
      CallFunction(ListViewLibraryHandle.l, "SetAllCheckboxStates", ListViewHandle.l, *bereich)
    EndIf
    FreeMemory(*bereich)
  EndIf
EndProcedure

Procedure Speichere_CSV(ListViewDekoder.s)
  OpenPreferences("ibm.ini")
  PreferenceGroup("settings")
  WritePreferenceString("dekoder", ListViewDekoder.s)
  ClosePreferences()
  
  AnzahlBytes.l = CallFunction(ListViewLibraryHandle.l, "GetNeededMemory", ListViewHandle.l, 1)
  *Ascii = Ascii(ListViewDekoder.s)
  *bereich = AllocateMemory(AnzahlBytes.l)
  AnzahlBytes.l = CallFunction(ListViewLibraryHandle.l, "ListviewToCsv", ListViewHandle.l, *bereich, 0, 0)
  CallFunction(ListViewLibraryHandle.l, "WriteFileQuick", *Ascii, *bereich, 0, AnzahlBytes.l)
  
  ListViewCHB.s = ReplaceString(ListViewDekoder.s,"csv","chb",#PB_String_NoCase)
  *Ascii = Ascii(ListViewCHB.s)
  AnzahlLinien.l = CallFunction(ListViewLibraryHandle.l, "GetLines", ListViewHandle.l)
  CallFunction(ListViewLibraryHandle.l, "GetAllCheckboxStates", ListViewHandle.l, *bereich)
  CallFunction(ListViewLibraryHandle.l, "WriteFileQuick", *Ascii, *bereich, 0, AnzahlLinien.l)

  FreeMemory(*bereich)
  FreeMemory(*Ascii)
EndProcedure

Procedure Vernichte_Listview()
  ;Muss zuerst stehen, sonst gibt's eine Speicherverletzung,
  ;wenn zuletzt eine Zeile im Listview aktiviert war:
  FreeGadget(40)   
  CallFunction(ListViewLibraryHandle.l, "ClearListview", ListViewHandle.l)
  CallFunction(ListViewLibraryHandle.l, "EraseListview", ListViewHandle.l)
  ;CallFunction(ListViewLibraryHandle.l, "CloseMessages", GadgetID(40))
EndProcedure

Procedure ListviewDrucken(ListViewDekoder.s)
  CallFunction(ListViewLibraryHandle.l, "PrintListview", ListViewHandle.l, GadgetID(40), 0, 56, 200, 200, 200, 200, 16, 16, @ListViewDekoder.s, 0, 5)
  ;PrintListview (listview&,%hwnd,%hinstance,56,200,200,200,200,16,16,addr(text$),0,1)
EndProcedure

Procedure LeererDekoderErzeugen()
  CallFunction(ListViewLibraryHandle.l, "DeleteAllItems", ListViewHandle.l)
  NeuerTitel("UNGESPEICHERT")  
EndProcedure

Procedure NeuerEintragAnfuegen()
  *Ascii =  Ascii("")
  *bereich = AllocateMemory(20)
  adresse.l = *Ascii
  PokeL(*bereich, adresse.l)
  PokeL(*bereich+4, adresse.l)
  PokeL(*bereich+8, adresse.l)
  PokeL(*bereich+12, adresse.l)
  PokeL(*bereich+16, 0)
  ;ShowMemoryViewer(*bereich, 20)
  CallFunction(ListViewLibraryHandle.l, "SItem", ListViewHandle.l, *bereich, 4)
  AnzahlLinien.l = CallFunction(ListViewLibraryHandle.l, "GetLines", ListViewHandle.l)
  ;Wieviele Zeilen hat das Listview:
  CallFunction(ListViewLibraryHandle.l, "SItem", ListViewHandle.l, *bereich, 4)
  SetActiveGadget(40)   ;Den Fokus auf das Listview setzen:
                        ;Alle deselektieren:
  CallFunction(ListViewLibraryHandle.l, "SelectLine", ListViewHandle.l, 0, 6)
  ;unterste Zeile selektieren:
  AnzahlLinien.l - 1
  CallFunction(ListViewLibraryHandle.l, "SelectLine", ListViewHandle.l, AnzahlLinien.l, 1)
  
  FreeMemory(*bereich)
  FreeMemory(*Ascii)
  ;Es muss eine kleinere Anzahl an Strings eingestellt werden in SItem
EndProcedure

Macro Fehlermeldungsbehandlungsblock
  If Ergebnis.s = "No decoder"
    Wiederholen.b - 1
    If Wiederholen.b = 0
      MessageRequester("Fehler Dekoder", "Kein Dekoder angeschlossen!", #PB_MessageRequester_Ok | #PB_MessageRequester_Error)
      Break 2
    EndIf
  ElseIf Ergebnis.s = "Failed"
    Wiederholen.b - 1
    If Wiederholen.b = 0
      ;MessageRequester("Fehler Dekoder", "Dekoderprogrammierung fehlgeschlagen!", #PB_MessageRequester_Ok | #PB_MessageRequester_Error)
      ;Break 2
    EndIf
  ElseIf Ergebnis.s = "Short!"
    Wiederholen.b - 1
    If Wiederholen.b = 0
      ;MessageRequester("Fehler Dekoder", "Kurzschluss!", #PB_MessageRequester_Ok | #PB_MessageRequester_Error)
      ;Break 2
    EndIf
  ElseIf StringField(Ergebnis.s, 1, " ") = "Error"
    Wiederholen.b - 1
    If Wiederholen.b = 0
      ;MessageRequester("Fehler Dekoder", "Zeitüberschreitung serielle Schnittstelle!", #PB_MessageRequester_Ok | #PB_MessageRequester_Error)
      ;Break 2
    EndIf
  ;Kommt nur beim Lesen wenn alles gut ist:
  ElseIf StringField(Ergebnis.s, 2, " ") = "="
    Ergebnis.s = StringField(Ergebnis.s, 1, " ")
    *Ascii = Ascii(Ergebnis.s)
    CallFunction(ListViewLibraryHandle.l, "SetItemText", ListViewHandle.l, *Ascii, 3, Durchlauf.l)
    Wiederholen.b = 0
  ;Kommt nur beim Schreiben wenn alles gut ist:
  ElseIf StringField(Ergebnis.s, 1, " ") = "Ok"
    Wiederholen.b = 0
  Else
    Wiederholen.b - 1
    If Wiederholen.b = 0
      ;MessageRequester("Fehler Dekoder", "Anderer Fehler: " + Ergebnis.s, #PB_MessageRequester_Ok | #PB_MessageRequester_Error)
      ;Break 2
    EndIf
  EndIf
EndMacro

Macro SelectedLine
  CallFunction(ListViewLibraryHandle.l, "GetSelectedLine", ListViewHandle.l)
EndMacro

Macro CBState
  CallFunction(ListViewLibraryHandle.l, "GetCheckboxState", ListViewHandle.l, Durchlauf.l)
EndMacro

;modus.s  = "schreibe" oder "lese"
;welche.s = "alle", "markierte" oder "selektierte"
Procedure CV_Bearbeiten(modus.s, welche.s)
  ;Funktion gibt Anzahl Zeilen n im Listview zurück
  AnzahlZeilen.l = CallFunction(ListViewLibraryHandle.l, "GetLines", ListViewHandle.l)
  ;Zeilen sind nummeriert von 0 ... (n-1)
  Durchlauf.l = 0
  StatusBarProgress(0, 2, 0, #PB_StatusBar_BorderLess, 0, AnzahlZeilen.l)
  While Durchlauf.l < AnzahlZeilen.l
    If ((Durchlauf.l = SelectedLine) And (welche.s = "markierte")) Or
       ((CBState = 1) And (welche.s = "selektierte")) Or
       (welche.s = "alle")
      ;Debug(CallFunction(ListViewLibraryHandle.l, "GetCheckboxState", ListViewHandle.l, Durchlauf.l))
      Wiederholen.b = 3
      While Wiederholen.b
        CallFunction(ListViewLibraryHandle.l, "GetLineText", ListViewHandle.l, Durchlauf.l, *GlobalText)   ;ListView-Prozedur
        Text.s = Unicode(*GlobalText, #PB_UTF8)
        cv_nummer.s = StringField(Text.s, 2, Chr(9))
        cv_wert.s   = StringField(Text.s, 4, Chr(9))
        If modus.s = "lese"
          Holen("XPTRD" + cv_nummer.s)   ;Setzt die globale Variable "Ergebnis.s"
        ElseIf modus.s = "schreibe"
          Holen("XPTWD" + cv_nummer.s + "," + cv_wert.s)   ;Setzt die globale Variable "Ergebnis.s"
        EndIf
       
        ;test.s = Str(Durchlauf) + ":" + Str(Wiederholen) + ":" + Ergebnis
        ;Debug(test)
      
        Fehlermeldungsbehandlungsblock   ;Macro

      Wend
    
    EndIf 
    Durchlauf.l + 1
    ;Delay(100)
    StatusBarProgress(0, 2, Durchlauf.l)
  Wend
EndProcedure


;Procedure HoleText(Linie.l)
;  ProcedureReturn CallFunction(ListViewLibraryHandle.l, "GetLineText", ListViewHandle.l, Linie.l, *GlobalText)
;EndProcedure


; IDE Options = PureBasic 5.62 (Windows - x86)
; CursorPosition = 55
; FirstLine = 26
; Folding = ---
; EnableXP