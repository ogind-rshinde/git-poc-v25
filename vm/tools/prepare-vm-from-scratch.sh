#!/bin/bash

BRANCH="main"
REPO="financials"
SCRIPT_NAME=$(basename "$0")

# Prepares the VM for use after downloaded.

function separator() {
  echo
  echo -------------------------
  echo
}

function pause() {
  read -r -s -n 1 -p "Press any key to continue..."
  echo
}

##
# NOTE: Keep all of these under 80 characters per line.
##
echo "This is an interactive login, you'll come back here a few times."
echo
echo "If you mess up at any point, cancel it and restart to re-run it,"
echo "or restore your VM to a snapshot."
echo
echo "But it would be best to type carefully and do it right the first time ;-)"
echo "Good luck!"
pause

read -r -p 'Enter your first and last name, e.g. Tom Stoppard: ' name
read -r -p 'Enter your GitHub username: ' github_user
read -r -p 'Enter your OpenGov email address: ' email
separator
read -r -p "Your name is '${name}', your GitHub username is '$github_user', and your work email is '${email}', is all of that correct? (Only 'y' will be accepted) " reply
if [ "$reply" != "y" ]; then exit 1; fi

git config --global user.name "${name}"
git config --global user.email "${github_user}@users.noreply.github.com"

separator
echo "You'll be asked to enter a password."
echo "Use one you will NOT forget (your GitHub password is good)."
echo "It cannot be recovered, and you'll have to do this whole thing over again."
pause
ssh-keygen -t rsa -b 4096 -C "${email}" -f "/C/Users/$(whoami)/.ssh/id_rsa"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

separator
echo "Now you'll log in to GitHub and Okta - I'll open the login for you."
echo
echo "I recommend you do NOT let the browser save these passwords."
echo "They're far too important. But you do you."
echo
echo "Come back here when you're logged in."
pause
start msedge.exe "https://github.com/login?return_to=%2FOpenGov"
sleep 15
separator
echo "Ready to continue? You should be logged in to GitHub and Okta now."
pause

separator
echo "You will now add your public key to your account."
echo
echo "Be sure to 'Enable SSO' for OpenGov after you add it, and give the key"
echo "a meaningful name or you'll regret it a year from now. Perhaps OGF-Dev-VM?"
echo
echo "I will open THREE tabs, two with instructions (if you need them),"
echo "and the other will be the SSH key page."
echo
echo "The public key will be in your copy buffer and ready to paste."
echo
echo "It also in C:\Users\db2admin\.ssh\id_rsa.pub if you lose it,"
echo "and I'll print it here after you hit enter."
pause
separator
cat ~/.ssh/id_rsa.pub
clip <~/.ssh/id_rsa.pub
start msedge.exe "https://help.github.com/en/github/authenticating-to-github/authorizing-an-ssh-key-for-use-with-saml-single-sign-on"
start msedge.exe "https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account"
start msedge.exe "https://github.com/settings/ssh/new"
sleep 15

separator
echo "Ready to continue? You should have added and authorized your public key."
pause

separator
echo "I'm now going to clone the ${REPO} repository (about 4GB)."
echo "This will take a while..."
echo
echo "DO NOT RE-RUN THE SCRIPT AFTER THIS POINT, OKAY? Just restore your VM."
pause
# NOTE: This insanity is because I need to leave a few files in the E tree
# and git clone refuses to clone into a non-empty directory.
cd /E
git init
git remote add origin "git@github.com:OpenGov/${REPO}.git"
git fetch --all
git checkout "${BRANCH}"
git pull

separator
echo "I'm now going to run setup-vm.bat. We'll continue when it's done."
pause
/E/vm/tools/setup-vm.bat
sleep 2

separator
echo "Time to restart. Once you're back, you're ready to roll."
echo
echo "You can open a browser and visit the bookmark to access the application."
echo
echo "You should take a snapshot after you restart, and/or after doing other"
echo "customizations to avoid running this program again from an empty snapshot."
echo
echo "And go back to the web instructions after the restart to continue."
pause

separator
echo "You sure you got all that? You ready?"
pause

separator
echo "This program will now self destruct and then restart ."
echo "Thank you for taking Johnnycab. Hope you enjoyed the ride."
rm "/C/Users/$(whoami)/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/${SCRIPT_NAME}"
shutdown -r -t 10
pause 10
exit 0
