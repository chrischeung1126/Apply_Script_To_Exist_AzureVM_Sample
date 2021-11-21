#Set Variables
$RootFolder = "D:\FSLogix\"
$FSlogixZipFolder = $RootFolder+"FSLogix_Apps_2.9.7979.62170.zip"
$FSlogixInstallFolder = $RootFolder+"Install"
$FSlogixInstallerPath = $FSlogixInstallFolder+"\x64\Release\FSLogixAppsSetup.exe"

#Create Folder structure
if (!(Test-Path -Path $RootFolder)){New-Item -Path $RootFolder -ItemType Directory}

#Configure logging
function log
{
   param([string]$message)
   "`n`n$(get-date -f o)  $message" 
}

#Download all source file async and wait for completion
Invoke-WebRequest -Uri "https://aka.ms/fslogix/download" -OutFile $FSlogixZipFolder


#Unzip the FSlogicx Folder
Log "Unzip the FSlogicx Folder"
Expand-Archive -Path $FSlogixZipFolder -DestinationPath $FSlogixInstallFolder

#Install the FSlogicx
Log "Install the FSlogicx Folder"
Start-Process -Wait -FilePath $FSlogixInstallerPath -ArgumentList "/install /quiet /norestart" -PassThru

#Remove Root Folder
#Log "Remove the FSlogicx Folder"
#Remove-Item -Path $RootFolder -Force
