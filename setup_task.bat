@echo off
rem ============================================================
rem  Register a daily scheduled task (runs every day at 09:00)
rem  Run this ONCE on each computer you want auto check-in.
rem  Requires administrator rights.
rem ============================================================
cd /d "%~dp0"

set "TASK_NAME=WorkBuddyDailyCheckIn"
set "EXE_PATH=%~dp0WorkBuddyCheckIn.exe"

echo Registering scheduled task "%TASK_NAME%"...
schtasks /Create /F /TN "%TASK_NAME%" /TR "\"%EXE_PATH%\"" /SC DAILY /ST 09:00

if %errorlevel%==0 (
    echo.
    echo [OK] Scheduled task created successfully.
    echo It will run daily at 09:00.
) else (
    echo.
    echo [FAILED] Failed to create task. Try running as Administrator.
)

echo.
echo Press any key to close.
pause > nul
