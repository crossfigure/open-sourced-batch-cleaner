@echo off
title System Cleaner
echo ================================
echo    Welcome to System Cleaner
echo ================================
echo.
echo [1] Clean Temp Files
echo [2] Clean Prefetch Files
echo [3] Empty Recycle Bin
echo [4] Clean Recent Files
echo [5] Clean Windows Update Cache
echo [6] Clean All (Everything Above)
echo [7] Exit
echo.
set /p choice=Choose an option (1-7): 

if "%choice%"=="1" goto clean_temp
if "%choice%"=="2" goto clean_prefetch
if "%choice%"=="3" goto clean_recycle_bin
if "%choice%"=="4" goto clean_recent
if "%choice%"=="5" goto clean_update_cache
if "%choice%"=="6" goto clean_all
if "%choice%"=="7" goto exit
goto end

:clean_temp
echo Cleaning Temp Files...
del /s /q "%temp%\*.*"
rd /s /q "%temp%"
mkdir "%temp%"
echo Temp Files Cleaned!
goto end

:clean_prefetch
echo Cleaning Prefetch Files...
del /s /q C:\Windows\Prefetch\*.* 
echo Prefetch Files Cleaned!
goto end

:clean_recycle_bin
echo Emptying Recycle Bin...
rd /s /q C:\$Recycle.Bin
echo Recycle Bin Emptied!
goto end

:clean_recent
echo Cleaning Recent Files...
del /f /s /q "%USERPROFILE%\Recent\*"
echo Recent Files Cleaned!
goto end

:clean_update_cache
echo Cleaning Windows Update Cache...
net stop wuauserv
rd /s /q "C:\Windows\SoftwareDistribution"
net start wuauserv
echo Windows Update Cache Cleaned!
goto end

:clean_all
echo Cleaning Temp, Prefetch, Recycle Bin, Recent Files, and Windows Update Cache...
del /s /q "%temp%\*.*"
rd /s /q "%temp%"
mkdir "%temp%"
del /s /q C:\Windows\Prefetch\*.* 
rd /s /q C:\$Recycle.Bin
del /f /s /q "%USERPROFILE%\Recent\*"
net stop wuauserv
rd /s /q "C:\Windows\SoftwareDistribution"
net start wuauserv
echo All Cleaned!
goto end

:end
echo Cleaning complete!
pause
exit

:exit
echo Goodbye!
pause
exit
