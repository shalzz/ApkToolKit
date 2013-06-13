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

:start1
@echo off
ECHO    Decompilation Options:
ECHO  ------------------------------------
ECHO    1  Sources and Resources
ECHO    2  Only Source
ECHO    3  Only Resource
ECHO    4  Cancel
ECHO  ------------------------------------
SET /p opt=Please enter one of the options:

if %opt%==1 (goto srcNres) else (set /a e=1)
if %opt%==2 (goto src) else (set /a e=e+1)
if %opt%==3 (goto res) else (set /a e=e+1)
if %opt%==4 (goto exit) else (set /a e=e+1)


if %e%==4 (
ECHO Error!
Echo Please enter a correct option
@pause
cls  
goto start1
)


:srcNres
SET /p name=Please enter apk name/path:
set name=%name:~0,-4%
tools\apktool d -f "%name%.apk" "%name%"

:src
SET /p name=Please enter apk name/path:
set name=%name:~0,-4%
tools\apktool d -f -r "%name%.apk" "%name%"

:res
SET /p name=Please enter apk name/path:
set name=%name:~0,-4%
tools\apktool d -f -s "%name%.apk" "%name%"

:exit
exit /b 1

