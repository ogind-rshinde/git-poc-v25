#!/bin/bash

# Prepares the Install Server VM for imaging by removing OG stuff from it.

function pause() {
  read -r -s -n 1 -p "Press any key to continue..."
  echo
}

echo "====================================================="
echo "ONLY PROCEED IF YOU HAVE A FULL SNAPSHOT OF THE VM ALREADY MADE"
echo "AND YOU ARE RUNNING THIS SCRIPT IN A THROWAWAY SNAPSHOT FOR AMI CREATION;"
echo "OTHERWISE PRESS CTRL-C TO CANCEL OR CLOSE THIS WINDOW"
echo "====================================================="
pause

echo "====================================================="
echo "SERIOUSLY, THIS WILL DELETE A LOT OF FILES NEEDED FOR FUTURE INSTALLS,"
echo "ONLY PROCEED IF YOU'RE NOT RUNNING THIS DIRECTLY ON THE INSTALL SERVER"
echo "====================================================="
pause

echo "====================================================="
echo "LAST CHANCE TO CANCEL IN CASE YOU MADE A MISTAKE;"
echo "DELETION WILL BEGIN IF YOU CONTINUE"
echo "====================================================="
pause

# Stop the world.
tskill code
tskill msedge
tskill chrome
tskill firefox
/E/vm/tools/stop_financials_software.bat

# Sanitize the E drive.
find "/E" \
  -name ".gitignore" \
  -delete
rm -rf "/E/vm/"
rm -rf "/E/git*"

# Clear out development credentials.
git config --global user.name ""
git config --global user.email ""
rm -f "/C/Users/$(whoami)/.ssh/id_rsa"*

# Sanitize the home folder.
rm -rf "/C/Users/$(whoami)/.bash*"
rm -rf "/C/Users/$(whoami)/.git*"
rm -rf "/C/Users/$(whoami)/.vscode"
rm -rf "/C/Users/$(whoami)/Downloads/"*
rm -rf "/C/Users/$(whoami)/My Documents/"*
rm -f "/C/Users/$(whoami)/.lesshst"
rm -f "/C/Users/$(whoami)/.node_repl_history"
rm -f "/C/Users/$(whoami)/.viminfo"
rm -f "/C/Users/$(whoami)/.yarnrc"
rm -f "/C/Users/$(whoami)/Desktop/Start Financials Software.lnk"
rm -f "/C/Users/$(whoami)/Desktop/Stop Financials Software.lnk"
rm -f "/C/Users/$(whoami)/Desktop/Visual Studio Code.lnk"

# Clear Firefox.
find "/C/Users/$(whoami)/AppData/Local/Mozilla/Firefox" \
  -delete
find "/C/Users/$(whoami)/AppData/Roaming/Mozilla" \
  -delete

# Clear Chrome.
find "/C/Users/$(whoami)/AppData/Local/Google/Chrome" \
  ! -name "Bookmarks" \
  -delete

# Clear Edge.
find "/C/Users/$(whoami)/AppData/Local/Microsoft/Edge" \
  ! -name "Bookmarks" \
  -delete

# Clear Internet Explorer.
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255

# Disk cleanup.
start cleanmgr.exe /d C
echo "Starting Disk Cleaner for C"
pause

# Clean recent items.
find "/C/Users/$(whoami)/AppData/Roaming/Microsoft/Windows/Recent" -name "*.lnk" -delete
find "/C/Users/$(whoami)/AppData/Roaming/Microsoft/Windows/Recent/AutomaticDestinations" -delete

# Defrag.
defrag -C -H -U -X

# Check disks.
chkdsk D: /R
chkdsk E: /R
chkdsk P: /R
# C is last because we can't live-repair. Review it manually.
chkdsk C:
pause
echo "Be sure to review the above for C: and decide if it needs a repair"
pause

echo "That's it! Shut down and bake the image!"
pause
