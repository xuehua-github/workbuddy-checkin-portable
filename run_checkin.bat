@echo off
rem ============================================
rem  WorkBuddy Daily Check-In - One-click run
rem  Double-click this file to check in
rem ============================================
cd /d "%~dp0"
echo Starting WorkBuddy check-in...
echo.
WorkBuddyCheckIn.exe
echo.
echo Done. Press any key to close this window.
pause > nul
