@echo off

REM Check if the script is being run as administrator
net session >nul 2>&1
if %errorLevel% == 0 (
  goto :admin
) else (
  echo This script requires administrator privileges.
  echo Please right-click on the script and select "Run as administrator".
  pause
  exit /b
)

:admin
REM Disable Wi-Fi connection
netsh interface set interface "Wi-Fi" admin=disable

REM Wait for 5 seconds
ping 127.0.0.1 -n 6 > nul

REM Enable Wi-Fi connection
netsh interface set interface "Wi-Fi" admin=enable

echo Wi-Fi connection has been disabled and enabled again.

REM Wait for 1 second
timeout /t 1 > nul
