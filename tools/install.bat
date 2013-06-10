@echo off
setlocal EnableDelayedExpansion
SET lf=-
SET /p name=Please enter apk name/path:
FOR /F "delims=" %%i IN ('tools\aapt dump badging "%name%"') DO if ("!out!"=="") (set out=%%i) else (set out=!out!%lf%%%i)
FOR /F "tokens=2 delims='" %%f IN ('echo %out%') DO set pckname=%%f 


SET /p data=Do You wish to keep the app data while unisntalling?(Y?N):
if %data%==y (
ECHO I: Uninstallling package %pckname%
tools\adb -k uninstall  %pckname%
)
if %data%==n (
ECHO I: Uninstallling package %pckname%
tools\adb  uninstall  %pckname%
)
if %errorlevel%==0  (
ECHO I: Installling apk
tools\adb  install %name%
)
if %errorlevel%==0  (
ECHO I: %name% Installed
)

endlocal