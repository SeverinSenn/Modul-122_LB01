# Betriebsdokumentation
[[_TOC_]]
## Einführungstext 

TODO: In 2-3 Sätzen beschreiben was die Skripte grundsaetzlich tun.
Task2: Diese Script sorgt dafür das sie die Daten ihrer Usersergruppen sicher können um bei fallen einer Zerstörug ein Backup zu haben.

## Installationsanleitung für Administratoren

### Installation

TODO: Wie ist das Skript zu installieren. (z.B. apt-get install ... oder tar xvf .... oder ...)

Task2: Das Script können sie leider noch nicht über apt-get installiren. Sie müssen aber bestimmte Dependencies haben. Diese sollten aber im normal fall mit linux geliefert werden.

Dependencies:tar,groupmems,cat 

Task1:
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

TODO: Wie sind User-Home-Templates einzurichten

....

## Bediensanleitung Benutzer
Task2: Das script wird im Cronjob wie folgt aufgerufen: sudo ./Script

