# Betriebsdokumentation
[[_TOC_]]
## Einführungstext 

Task1: Diese Script sorgt dafür das sie Users schnell und effizient erstellen können.

Task2: Diese Script sorgt dafür das sie die Daten ihrer Usersergruppen sicher können um bei fallen einer Zerstörug ein Backup zu haben.

## Installationsanleitung für Administratoren

### Installation
Task2: Das Script können sie leider noch nicht über apt-get installiren. Sie müssen aber bestimmte Dependencies haben. Diese sollten aber im normal fall mit linux geliefert werden.

Dependencies:tar,groupmems,cat 

Task1: Dieses Script können sie nur installiren indem sie diese Git Repo herunterladen. Wichtig ist auch noch, dass sie Task 2 Installirt haben. Das hat den Grund das man die Gruppendatei braucht.
### Konfiguration
Task2:
Um das Script erfolgreich zu strarten mussen sie eine Konfig datei erstellen mit folgenden Inhalten

BackupLimit=

BackupPath=

Gruppendatei= !Datei muss erstelst werden!

TarPrefix=

Ein Beispiel dieser Datei ist auch in diesem Projekt enthalten.
Danach müssen sie auf Zeile 10 im Script den Pfad der Datei anpassen.
Nun zu schluss müssen sie das Script nur noch mit Sudo rechten ausführen. 
!Script muss rechte haben zum ausführen!
Tipp: ein Cronjob kann ihnen das Leben retten: https://wiki.ubuntuusers.de/Cron/

Task1: Für diese Script ist keine Konfigurationen vorzunehmen
## Bediensanleitung Benutzer
Task2: Das script wird im Cronjob wie folgt aufgerufen: sudo ./Script

Task1: Das Script wird einfach mit ./ScriptName "Csv Datei der Users"
