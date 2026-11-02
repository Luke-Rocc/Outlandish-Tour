# Outlandish app

Outlandish Live pakket ind som iPhone-app med Capacitor. Siden i `public/` er en kopi af `public/` fra projektet Outlandish.

Codemagic bygger appen ud fra `codemagic.yaml` og sender den til TestFlight. Mappen `ios/` ligger ikke i git; `scripts/ios-setup.sh` laver den ved hvert build.

Ny version: kopiér ændringer til `public/`, push, og start et build i Codemagic.
