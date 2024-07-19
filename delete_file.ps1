Start-Sleep -Seconds 10
$filePath = "C:\Windows\System32\drivers\CrowdStrike\C-00000291*.sys"
Get-ChildItem -Path $filePath | Remove-Item -Force
bcdedit /deletevalue {current} safeboot
bcdedit /deletevalue {current} safebootalternateshell
Restart-Computer
