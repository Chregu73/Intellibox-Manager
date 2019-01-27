Macro Unicode(Mem, Type = #PB_Ascii)
  PeekS(Mem, -1, Type)
EndMacro



Procedure Holen(text.s)
  If IsSerialPort(SerialPortHandle.l)
    If WriteSerialPortString(SerialPortHandle.l, text.s + Chr(13), #PB_UTF8)
      *Puffer = AllocateMemory(128)
      GeleseneBytes.l = ReadSerialPortData(SerialPortHandle.l, *Puffer, 128)
      If GeleseneBytes.l
        Ergebnis.s = Unicode(*Puffer, #PB_UTF8)
        Ergebnis.s = StringField(Ergebnis.s, 1, Chr(13))
      EndIf
      FreeMemory(*Puffer)
    Else
      Ergebnis.s = "Error " + Str(SerialPortError(SerialPortHandle.l))
    EndIf
  Else
    Ergebnis.s = "Serielle Schnittstelle nicht verfügbar"
  EndIf
EndProcedure

; IDE Options = PureBasic 5.62 (Windows - x86)
; CursorPosition = 17
; Folding = -
; EnableXP