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
set /p heap=<tools\heapsize.txt
ECHO  ------------------------------------
ECHO    Current Heap size = %heap% MB
ECHO  ------------------------------------
ECHO    Select New Heap size:
ECHO  ------------------------------------
ECHO    1  512 MB
ECHO    2  1024 MB
ECHO    3  2048 MB
ECHO    4  Cancel
ECHO  ------------------------------------

SET /p opt=Please enter one of the options:

if %opt%==1 (set size=512) else (set /a e=1)
if %opt%==2 (set size=1024) else (set /a e=e+1)
if %opt%==3 (set size=2048) else (set /a e=e+1)
if %opt%==4 (goto exit) else (set /a e=e+1)


if %e%==4 (
ECHO Error!
Echo Please enter a correct option
@pause
cls  
goto start1
)

REM : Store the value in a txt file
del tools\heapsize.txt
echo %size%>>tools\heapsize.txt

if %errorlevel%==0 (
echo I :Heap size succsesfully changed to %size% MB
)

:exit
exit /b 1