# Define the GitHub repository URL
$repoUrl = "https://raw.githubusercontent.com/Phoenixx52/crowdstrike-major-it-outages/main/"

# Define the script file names
$batchFile = "restart_to_safe_mode.bat"
$powerShellFile = "delete_file.ps1"

# Download the batch script
Invoke-WebRequest -Uri ($repoUrl + $batchFile) -OutFile "C:\Windows\System32\$batchFile"

# Download the PowerShell script
Invoke-WebRequest -Uri ($repoUrl + $powerShellFile) -OutFile "C:\Windows\System32\$powerShellFile"

# Schedule the PowerShell script to run at startup
schtasks /create /tn "DeleteFileAtStartup" /tr "powershell.exe -ExecutionPolicy Bypass -File C:\Windows\System32\delete_file.ps1" /sc onstart /ru System

# Run the batch file to restart in Safe Mode
Start-Process "cmd.exe" -ArgumentList "/c C:\Windows\System32\$batchFile" -Verb runAs
