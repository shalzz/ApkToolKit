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
tools\apktool d -f %name%.apk %name%

:src
SET /p name=Please enter apk name/path:
set name=%name:~0,-4%
tools\apktool d -f -r %name%.apk %name%

:res
SET /p name=Please enter apk name/path:
set name=%name:~0,-4%
tools\apktool d -f -s %name%.apk %name%

:exit
exit /b 1

