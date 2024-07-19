# CrowdStrike Major IT Outages

This repository contains scripts to automate the process of dealing with a problematic file in the CrowdStrike directory that causes a blue screen error on Windows systems.

## If you have a Bluescreen

### Manual Step: Boot into Safe Mode with Command Prompt

1. Restart your computer.
2. Press `F8` (or the appropriate key for your system) during boot to access the Advanced Boot Options menu.
3. Select "Safe Mode with Command Prompt."
4. Go to `C:\Windows\System32\drivers\CrowdStrike`
5. Locate the file matching `C-00000291*sys`, and delete it.

### Autmoated Step: Boot into Safe Mode with Command Prompt

## Scripts

- `delete_file.ps1`: This PowerShell script deletes the problematic file causing the blue screen and restarts Windows into normal mode.

## Usage

To automate the process, follow the steps below:

### Step 1: Boot into Safe Mode with Command Prompt

1. Restart your computer.
2. Press `F8` (or the appropriate key for your system) during boot to access the Advanced Boot Options menu.
3. Select "Safe Mode with Command Prompt."

### Step 2: Download and Execute the Script

Run the following PowerShell command as an administrator in Safe Mode with Command Prompt:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Phoenixx52/crowdstrike-major-it-outages/main/delete_file.ps1" -OutFile "C:\Users\Public\delete_file.ps1"; powershell.exe -ExecutionPolicy Bypass -File "C:\Users\Public\delete_file.ps1"
```

### Automatic Process

The `delete_file.ps1` script will:

1. Wait for a few seconds to ensure the system has booted.
1. Delete the problematic file (`C-00000291*.sys`) from the `C:\Windows\System32\drivers\CrowdStrike` directory.
1. Remove Safe Mode boot settings.
1. Restart the computer into normal mode.

### Summary

- **Boot into Safe Mode with Command Prompt manually.**
- **Run the PowerShell command to download and execute the script.**
