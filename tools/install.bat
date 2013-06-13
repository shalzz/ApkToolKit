REM    ApkToolKit is a software which eases the process of working with apk's 
REM    Copyright (C) 2013  
REM	   Shaleen Jain
REM	   shalzz@outlook.com
REM
REM    This file is part of GPL.
REM
REM    This program makes use of softwares made by other people, namely;
REM	   Brut.all
REM    iBotPeaches
REM    jesusfreke
REM	   All other trademarks and copyrights are the property of their respective owners.
REM	    
REM    GPL is a free software: you can redistribute it and/or modify
REM    it under the terms of the GNU General Public License as published by
REM    the Free Software Foundation, either version 3 of the License, or
REM    (at your option) any later version.
REM
REM    This program is distributed in the hope that it will be useful,
REM    but WITHOUT ANY WARRANTY; without even the implied warranty of
REM    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
REM    GNU General Public License for more details.
REM
REM    You should have received a copy of the GNU General Public License
REM    along with this program.  If not, see <http://www.gnu.org/licenses/>.

@echo off

REM : Get the Package Name of the apk
setlocal EnableDelayedExpansion
SET lf=-
SET /p name=Please enter apk name/path:

REM : Convert the multi line output to single line
FOR /F "delims=" %%i IN ('tools\aapt dump badging "%name%"') DO if ("!out!"=="") (set out=%%i) else (set out=!out!%lf%%%i) 

REM : Get the Package name which is the second token
FOR /F "tokens=2 delims='" %%f IN ('echo %out%') DO set pckname=%%f 

REM : Prompt for keeping data while uninstalling or not
SET /p data=Do You wish to keep the app data while unisntalling?(Y?N):

REM : Uninstall the apk
if %data%==y (
ECHO I: Uninstallling package %pckname%
tools\adb -k uninstall  %pckname%
)
if %data%==n (
ECHO I: Uninstallling package %pckname%
tools\adb  uninstall  %pckname%
)

REM : Install the apk
if %errorlevel%==0  (
ECHO I: Installling apk
tools\adb  install %name%
)

if %errorlevel%==0  (
ECHO I: %name% Installed
)

endlocal