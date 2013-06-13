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

@ECHO off
:start
set /a str=0
:start0
set option = null
set name = null

ECHO  --------------------------------------------------------------------------------------------------------------------------
ECHO    Please choose one of the options:
ECHO  ------------------------------------
ECHO    1   Decompile apk
ECHO    2   Recompile apk
ECHO    3   Sign apk
ECHO    4   Zipalign apk
ECHO    5   Sign and Zipalign apk
ECHO    6   Compile, Sign and Zipalign apk
ECHO    7   Compile and Zipalign  apk
ECHO    8   Install apk
ECHO    9   Clean Install apk 
ECHO    10  Push apk
ECHO    11  Select java VM heapsize
ECHO  --------------------------------------------------------------------------------------------------------------------------
SET /p option=Please enter one of the options:

if %option%==1  ( goto decompile )      else set /a er=1
if %option%==2  ( goto compile )        else set /a er=er+1
if %option%==3  ( goto sign )           else set /a er=er+1
if %option%==4  ( goto zip )            else set /a er=er+1
if %option%==5  ( goto signNzip )       else set /a er=er+1
if %option%==6  ( goto compilesignNzip ) else set /a er=er+1
if %option%==7  ( goto ComZip )         else set /a er=er+1
if %option%==8  ( goto install )        else set /a er=er+1
if %option%==9  ( goto cleaninstall )   else set /a er=er+1
if %option%==10 ( goto push )           else set /a er=er+1
if %option%==11 ( goto heap )           else set /a er=er+1

:noOption
if %er% GEQ 11 ( 
Echo Error!
Echo Please enter a correct option
@pause
if %str%==4  ( goto destr ) 
set /a str=str+1
cls  
goto start0
)

:decompile
call tools\decompile.bat
if %errorlevel%==0 (
ECHO I: Apk Decompiled
ECHO I: Folder %name% Created
)
@pause
cls  
goto start


:compile
SET /p name=Please enter Folder name/path:
call tools\compile.bat
if %errorlevel%==0 (
ECHO I: Apk Compiled
ECHO I: %name%.apk Created
)
@pause
cls  
goto start
restart


:sign
SET /p name=Please enter apk name/path:
set name=%name:~0,-4%
call tools\sign.bat
if %errorlevel%==0 (
ECHO I: Apk Signed
ECHO I: %name%_signed.apk Created
)
@pause
cls  
goto start


:zip
SET /p name=Please enter apk name/path:
set name=%name:~0,-4%
ECHO I: Zipaligning...
tools\zipalign 4 "%name%.apk" "%name%_zip.apk"
if %errorlevel%==0 (
ECHO I: Apk Zipaligned
ECHO I: %name%_zip.apk Created
)
@pause
cls  
goto start


:signNzip
SET /p name=Please enter apk name/path:
set name=%name:~0,-4%
call tools\sign.bat
if %errorlevel%==0  (
ECHO I: Zipping...
tools\zipalign 4 "%name%_signed.apk" "%name%_snz.apk"
del "%name%_signed.apk"
)
if %errorlevel%==0 (
ECHO I: Apk Signed And Zipaligned
ECHO I: %name%_snz.apk Created
)
@pause
cls  
goto start

:destr
call tools\destresser.bat
@pause
cls  
goto start
restart


:compilesignNzip
SET /p name=Please enter Folder name/path:
 call tools\compile.bat
if %errorlevel%==0 (
call tools\sign.bat
)
if %errorlevel%==0 (
ECHO I: Zipping...
tools\zipalign 4 "%name%_signed.apk" "%name%_csnz.apk"
del "%name%.apk"
del "%name%_signed.apk"
)
if %errorlevel%==0 (
ECHO I: Apk Compiled, Signed And Zipaligned
ECHO I: Apk %name%_csnz.apk Created
)
@pause
cls  
goto start

:install
SET /p name=Please enter apk name/path:
tools\adb  install "%name%"
@pause
cls  
goto start

:cleaninstall
ECHO I: Uninstalls the app then Reinstalls it.
call tools\install.bat
@pause
cls  
goto start

:ComZip
SET /p name=Please enter Folder name/path:
 call tools\compile.bat
if %errorlevel%==0 (
ECHO I:Zipping...
tools\zipalign 4 "%name%.apk" "%name%_zip.apk"
)
if %errorlevel%==0 (
ECHO I: Apk Compiled and Zipaligned 
ECHO I: Apk %name%_zip.apk Created
del "%name%.apk"
)
@pause
cls  
goto start

:push
SET /p name=Please enter apk name/path:
tools\adb remount
tools\adb push "%name%" /system/app
@pause
cls  
goto start

:heap
call tools\heap.bat
@pause
cls  
goto start



