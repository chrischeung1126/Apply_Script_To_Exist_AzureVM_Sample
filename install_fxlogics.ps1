#Set Variables
$RootFolder = "D:\FSLogix\"
$FSlogixZipFolder = $RootFolder+"FSLogix_Apps_2.9.7979.62170.zip"
$FSlogixInstallFolder = $RootFolder+"Install"
$FSlogixInstallerPath = $FSlogixInstallFolder+"\x64\Release\FSLogixAppsSetup.exe"


try {
    #Create Folder structure
    if (!(Test-Path -Path $RootFolder)){New-Item -Path $RootFolder -ItemType Directory}
}
catch {
    $errMsg = $_.Exception.message
    Write-Error ("Cannot Create the FSlogicx Folder: " + $errMsg)
    Break
}


try {
    #Download all source file async and wait for completion
    Invoke-WebRequest -Uri "https://aka.ms/fslogix/download" -OutFile $FSlogixZipFolder
}
catch {
    $errMsg = $_.Exception.message
    Write-Error ("Cannot Download the FSlogix: " + $errMsg)
    Break
}

#Configure logging
function log
{
   param([string]$message)
   "`n`n$(get-date -f o)  $message" 
}

#Unzip the FSlogicx Folder
Log "Unzip the FSlogicx Folder"
Expand-Archive -Path $FSlogixZipFolder -DestinationPath $FSlogixInstallFolder

try {
    #Install the FSlogicx
    Log "Install the FSlogicx Folder"
    Start-Process -Wait -FilePath $FSlogixInstallerPath -ArgumentList "/install /quiet /norestart" -PassThru
}
catch {
    $errMsg = $_.Exception.message
    Write-Error ("Cannot Install the FSlogix: " + $errMsg)
    Break
}

#Set Variables
$RootFolder = "D:\FSLogix\"
$FSlogixZipFolder = $RootFolder+"FSLogix_Apps_2.9.7979.62170.zip"
$FSlogixInstallFolder = $RootFolder+"Install"
$FSlogixInstallerPath = $FSlogixInstallFolder+"\x64\Release\FSLogixAppsSetup.exe"


try {
    #Create Folder structure
    if (!(Test-Path -Path $RootFolder)){New-Item -Path $RootFolder -ItemType Directory}
}
catch {
    $errMsg = $_.Exception.message
    Write-Error ("Cannot Create the FSlogicx Folder: " + $errMsg)
    Break
}


try {
    #Download all source file async and wait for completion
    Invoke-WebRequest -Uri "https://aka.ms/fslogix/download" -OutFile $FSlogixZipFolder
}
catch {
    $errMsg = $_.Exception.message
    Write-Error ("Cannot Download the FSlogix: " + $errMsg)
    Break
}

#Configure logging
function log
{
   param([string]$message)
   "`n`n$(get-date -f o)  $message" 
}

#Unzip the FSlogicx Folder
Log "Unzip the FSlogicx Folder"
Expand-Archive -Path $FSlogixZipFolder -DestinationPath $FSlogixInstallFolder

try {
    #Install the FSlogicx
    Log "Install the FSlogicx Folder"
    Start-Process -Wait -FilePath $FSlogixInstallerPath -ArgumentList "/install /quiet /norestart" -PassThru
}
catch {
    $errMsg = $_.Exception.message
    Write-Error ("Cannot Install the FSlogix: " + $errMsg)
    Break
}

