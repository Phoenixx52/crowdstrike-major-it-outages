# CrowdStrike Major IT Outages

This repository contains scripts to automate the process of dealing with a problematic file in the CrowdStrike directory that causes a blue screen error on Windows systems.

## Scripts

- `restart_to_safe_mode.bat`: This batch script restarts Windows into Safe Mode with Command Prompt.
- `delete_file.ps1`: This PowerShell script deletes the problematic file causing the blue screen and restarts Windows into normal mode.
- `setup_from_github.ps1`: This PowerShell script downloads the above scripts from this GitHub repository, schedules the `delete_file.ps1` script to run at startup, and restarts Windows into Safe Mode.

## Usage

To automate the process, follow the steps below:

### Step 1: Download and Execute the Setup Script

Run the following PowerShell command as an administrator:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Phoenixx52/crowdstrike-major-it-outages/main/setup_from_github.ps1" -OutFile "setup_from_github.ps1"; .\setup_from_github.ps1
```

### Step 2: Automatic Process

1. The `setup_from_github.ps1` script will:
- Download the restart_to_safe_mode.bat and delete_file.ps1 scripts from this GitHub repository.
- Save them to the C:\Windows\System32\ directory.
- Schedule the delete_file.ps1 script to run at system startup.
- Execute the restart_to_safe_mode.bat script to restart the computer into Safe Mode.

1. In Safe Mode, the delete_file.ps1 script will:

- Wait for a few seconds to ensure the system has booted.
- Delete the problematic file (`C-00000291*.sys`) from the `C:\Windows\System32\drivers\CrowdStrike` directory.
- Remove Safe Mode boot settings.
- Restart the computer into normal mode.

### Contributing
If you have any improvements or suggestions, feel free to create a pull request or open an issue.

### License
This project is licensed under the MIT License.

```bash
### CLI Command

To trigger the entire setup process from the command line, you can use the following PowerShell command:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Phoenixx52/crowdstrike-major-it-outages/main/setup_from_github.ps1" -OutFile "setup_from_github.ps1"; .\setup_from_github.ps1

```

This command does the following:
1. Temporarily bypasses the execution policy to allow the script to run.
1. Downloads the setup_from_github.ps1 script from your GitHub repository.
1. Executes the setup_from_github.ps1 script to initiate the automation process.

Ensure you run this command with administrative privileges to allow the script to make the necessary system changes.
