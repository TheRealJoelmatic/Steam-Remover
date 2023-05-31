@echo off

chcp 65001 > nul
reg add "HKCU\Console" /v "CodePage" /t REG_DWORD /d 65001 /f > nul
reg add "HKCU\Console" /v "FontFamily" /t REG_DWORD /d 0x00000036 /f > nul
reg add "HKCU\Console" /v "FontSize" /t REG_DWORD /d 0x00100000 /f > nul

echo ███╗░░░███╗░█████╗░████████╗██╗░█████╗░  ████████╗░█████╗░░█████╗░██╗░░░░░░██████╗
echo ████╗░████║██╔══██╗╚══██╔══╝██║██╔══██╗  ╚══██╔══╝██╔══██╗██╔══██╗██║░░░░░██╔════╝
echo ██╔████╔██║███████║░░░██║░░░██║██║░░╚═╝  ░░░██║░░░██║░░██║██║░░██║██║░░░░░╚█████╗░
echo ██║╚██╔╝██║██╔══██║░░░██║░░░██║██║░░██╗  ░░░██║░░░██║░░██║██║░░██║██║░░░░░░╚═══██╗
echo ██║░╚═╝░██║██║░░██║░░░██║░░░██║╚█████╔╝  ░░░██║░░░╚█████╔╝╚█████╔╝███████╗██████╔╝
echo ╚═╝░░░░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░  ░░░╚═╝░░░░╚════╝░░╚════╝░╚══════╝╚═════╝░

echo .
echo cooked up by Joelmatic#8817
echo .
echo Before running this please backup all your games!
echo .

choice /C YN /M "Press Y to start"
if errorlevel 2 goto skipToTheEnd

REM Uninstall Steam
echo Uninstalling Steam...
start /wait "" "C:\Program Files (x86)\Steam\uninstall.exe"

REM Delete Steam files and folders
echo Deleting Steam files...
rd /s /q "C:\Program Files (x86)\Steam"
rd /s /q "C:\ProgramData\Valve"

REM Clear Steam registry entries
echo Clearing Steam registry entries...
reg delete "HKEY_CURRENT_USER\Software\Valve" /f
reg delete "HKEY_CURRENT_USER\Software\Valve\Steam" /f
reg delete "HKEY_CURRENT_USER\Software\Valve\Steam\Settings" /f
reg delete "HKEY_CURRENT_USER\Software\Valve\Steam\Apps" /f
reg delete "HKEY_CURRENT_USER\Software\Valve\Steam Beta" /f

echo Complete! Now reinstall steam from https://store.steampowered.com/about/.

:skipToTheEnd
pause