# Intellibox-Manager
## Intellibox-Manager, die Software zur Intellibox

Intellibox-Manager ist DIE Software zur Intellibox von Uhlenbrock.
Mit Intellibox-Manager wird die Bedienung der Intellibox über die
RS232 Schnittstelle extrem vereinfacht. Unterstützt werden die wichtigsten
Bedienelemente. Als Besonderheit ist ein einfacher aber leistungsfähiger
Dekoderprogrammier-Manager integriert.

## Was ist neu in der Version 1.11?

![V111](https://github.com/Chregu73/Intellibox-Manager/assets/17860028/0a2dd61b-4cba-4251-813e-f70536b45942)

- Neue einfachere Bedienung des CV-Editors
- Problem mit Fahrstufe 1 behoben (Fahrstufe 1 ist Nothalt)
- Neue Routine für die serielle Schnittstelle: Transparentere Meldungen

## Was ist neu in der Version 1.10?

- Die einzelnen Funktionen sind in separaten, übersichtlichen Tabs untergebracht.
- Ein UDP-Server empfängt Befehle von einem beliebigen Device und schickt sie
an die Intellibox. Sogar übers Internet.
- Im Tab "Fahren" kann intuitiv über einen Schiebesteller gefahren werden
- Beliebige (auch über COM4) serielle Schnittstelle wird unterstützt
- Beim Batch-Programmieren von Dekodern gibt es bis 3 Retries
- Erweiterte Funktionen (F9 ... F12 (von IB nicht unterstützt))

## Installation von Intellibox-Manager

Die ZIP Datei ins gewünschte Verzeichnis entpacken.
Sonst muss nichts installiert werden.

## Bedienung

Doppelklicken Sie die Datei Intellibox-Manager.exe oder geben Sie den
entsprechenden Namen in der DOS-Shell ein. Eventuelle
Parameter werden ignoriert.

Wählen Sie als erstes im Menu "Datei" den Punkt "Einstellungen"
an und stellen Sie die Parameter der seriellen Schnittstelle wie
gewünscht ein. Die Einstellungen für "Datenbits", "Parität" und
"Stoppbits" haben keinen Effekt und sind schon voreingestellt
(8N2).

Nach dem drücken von "OK" wird die Schnittstelle entsprechend
eingestellt.

Das Programm kommuniziert mit der Intellibox P50Xa-Kommandos.
Achten Sie darauf, dass die Intellibox auf das entsprechende
Format eingestellt ist (IB-Syn.). Bitte konsultieren Sie dafür das Handbuch
der Intellibox.

![V110](https://github.com/Chregu73/Intellibox-Manager/assets/17860028/4bd51386-1f09-448b-995a-d0f96abc2674)

Die Tabelle im Tab "CV-Programmierung" ist für die Dekoderverwaltung
zuständig. Zu beachten ist, dass "Markiert" soviel wie ein blau hinterlegte
Zeile bedeutet, sowie "Selektiert" dass in der ersten Spalte das Häkchen
gesetzt ist.

Der aktuell geladene Dekoder, die Selektion und die Fensterposition
wird beim nächsten Programmstart automatisch geladen. Bitte speichern
Sie Änderungen immer rechtzeitig, beim Laden eines anderen Dekoders oder
bei Programmende wird nicht gewarnt!

Ein Doppelklick mit der linken Maustaste editiert das entsprechende Feld.
Ein Rechtsklick öffnet einen Dialog zum einfachen editieren der einzelnen
Bits.
