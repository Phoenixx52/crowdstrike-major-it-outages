# CrowdStrike Major IT Outages

This repository contains scripts to automate the process of dealing with a problematic file in the CrowdStrike directory that causes a blue screen error on Windows systems.

## If you have a Bluescreen

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

## If you don't have a Bluescreen

## Scripts

- `restart_to_safe_mode.bat`: This batch script restarts Windows into Safe Mode with Command Prompt.
- `delete_file.ps1`: This PowerShell script deletes the problematic file causing the blue screen and restarts Windows into normal mode.
- `remove-crowdstrike-issue-file.ps1`: This PowerShell script downloads the above scripts from this GitHub repository, schedules the `delete_file.ps1` script to run at startup, and restarts Windows into Safe Mode.

## Usage

To automate the process, follow the steps below:

### Step 1: Download and Execute the Setup Script

Run the following PowerShell command as an administrator:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Phoenixx52/crowdstrike-major-it-outages/main/remove-crowdstrike-issue-file.ps1" -OutFile "remove-crowdstrike-issue-file.ps1"; .\remove-crowdstrike-issue-file.ps1
```

### Step 2: Automatic Process

1. The `remove-crowdstrike-issue-file.ps1` script will:
- Download the `restart_to_safe_mode.bat` and `delete_file.ps1` scripts from this GitHub repository.
- Save them to the `C:\Windows\System32\` directory.
- Schedule the `delete_file.ps1` script to run at system startup.
- Execute the `restart_to_safe_mode.bat` script to restart the computer into Safe Mode.

1. In Safe Mode, the delete_file.ps1 script will:

- Wait for a few seconds to ensure the system has booted.
- Delete the problematic file (`C-00000291*.sys`) from the `C:\Windows\System32\drivers\CrowdStrike` directory.
- Remove Safe Mode boot settings.
- Restart the computer into normal mode.

### CLI Command

To trigger the entire setup process from the command line, you can use the following PowerShell command:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Phoenixx52/crowdstrike-major-it-outages/main/remove-crowdstrike-issue-file.ps1" -OutFile "remove-crowdstrike-issue-file.ps1"; .\remove-crowdstrike-issue-file.ps1
```

This command does the following:
1. Temporarily bypasses the execution policy to allow the script to run.
1. Downloads the `remove-crowdstrike-issue-file.ps1` script from your GitHub repository.
1. Executes the `remove-crowdstrike-issue-file.ps1` script to initiate the automation process.

Ensure you run this command with administrative privileges to allow the script to make the necessary system changes.
