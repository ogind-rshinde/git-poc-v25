#!/bin/bash

# Prepares the VM for distribution.

function pause() {
  read -r -s -n 1 -p "Press any key to continue..."
  echo
}

STARTUP_SCRIPT_NAME="prepare-vm-from-scratch.sh"

# Prepare the VM to startup with the setup script.
cp "/E/vm/tools/${STARTUP_SCRIPT_NAME}" "/C/Users/$(whoami)/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/"

# Stop the world.
tskill code
tskill msedge
tskill chrome
tskill firefox
/E/vm/tools/stop_financials_software.bat

# Delete everything but a few key files.
find /E \
  ! -name "db2cli.ini" \
  ! -name "db2dsdriver.cfg" \
  ! -name ".vscode" \
  -delete

# Clear out development credentials.
git config --global user.name ""
git config --global user.email ""
rm -f "/C/Users/$(whoami)/.ssh/id_rsa"*

# Sanitize the home folder.
rm -rf "/C/Users/$(whoami)/Downloads/"*
rm -rf "/C/Users/$(whoami)/My Documents/"*
rm -f "/C/Users/$(whoami)/.bash_history"
rm -f "/C/Users/$(whoami)/.lesshst"
rm -f "/C/Users/$(whoami)/.node_repl_history"
rm -f "/C/Users/$(whoami)/.viminfo"
rm -f "/C/Users/$(whoami)/.yarnrc"

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

# Reinstall Okta plugins
start firefox.exe "https://addons.mozilla.org/en-US/firefox/addon/okta-browser-plugin/"
echo "Starting Firefox, install Okta and then quit"
pause
start chrome.exe "https://chrome.google.com/webstore/detail/okta-browser-plugin/glnpjglilkicbckjpbgcfkogebgllemb?hl=en"
echo "Starting Chrome, install Okta and then quit"
pause
start msedge.exe "https://microsoftedge.microsoft.com/addons/detail/okta-browser-plugin/ncoafaeidnkeafiehpkfoeklhajkpgij"
echo "Starting Edge, install Okta and then quit"
pause

# Update Windows.
start wuapp.exe
echo "Starting Update, check for updates twice then quit"
pause

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

echo "That's it! Add the startup script, shut down, and snapshot!"
pause
