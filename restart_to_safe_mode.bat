@echo off
bcdedit /set {current} safeboot minimal
bcdedit /set {current} safebootalternateshell yes
shutdown /r /t 0
