# setupwin.ps1
# This Python file is a post-install setup script for Windows.

# Start logs
Start-Transcript

# PACKAGE MANAGERS
# scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Needed to run a remote script the first time
Invoke-RestMethod get.scoop.sh | Invoke-Expression # Enable scoop
scoop install git
scoop bucket add main # Add the main bucket for scoop
scoop bucket add extras # Add the extras bucket for scoop

# choco
# Install chocolatey ↓
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


# INSTALL SOFTWARE
# Common Software

# via winget
winget install --id=Microsoft.VisualStudioCode -e # VSCode
winget install --id=VideoLAN.VLC -e # VLC
winget install 9P7KNL5RWT25 # Sysinternals Suite
winget install -e --id Microsoft.PowerToys # PowerToys
winget install -e --id qBittorrent.qBittorrent #qBittorrent
winget install -e --id OBSProject.OBSStudio # OBS Studio
winget install --id=7zip.7zip -e # 7Zip

# via scoop
scoop install tar # Tar

# via chocolatey
choco install nerd-fonts-firacode # FiraCode Nerd Font

# Discord
$DISCORD = Read-Host -Prompt "Do you want to install Discord? (y for yes and any other key for no)"
if ($DISCORD -eq "y") {
    winget install --id=Discord.Discord  -e
}

# Steam
$STEAM = Read-Host -Prompt "Do you want to install Steam? (y for yes and any other key for no)"
if ($STEAM -eq "y") {
    winget install --id=Valve.Steam  -e
}


# BROWSERS
# Browser Numbers
Write-Output "
1) Google Chrome
2) Chromium
3) Ungoogled Chromium
4) Firefox
5) LibreWolf
6) Brave
7) None of the above
"
# Ask the user which browser they want to install
$BROWSER = Read-Host -Prompt "Enter the number of the browser you want to install"
# Check What browser number the user typed in
if (BROWSER -eq "1") {
    winget install --id=Google.Chrome  -e # Install Google Chrome
}
elseif ($BROWSER -eq "2") {
    winget install --id=Hibbiki.Chromium  -e # Install Chromium
}
elseif ($BROWSER -eq "3") {
    winget install --id=eloston.ungoogled-chromium  -e # Install Ungoogled Chromium
}
elseif ($BROWSER -eq "4") {
    winget install --id=Mozilla.Firefox # Install Firefox
}
elseif ($BROWSER -eq "5") {
    winget install --id=LibreWolf.LibreWolf -e # Install Librewolf
}
elseif ($BROWSER -eq "6") {
    winget install --id=Brave.Brave -e # Install Brave
}
else {
    Write-Output "No browsers have been installed."
}

# Tell the user the program finished running.
Write-Output "Finished!"

# Stop logs
Stop-Transcript
