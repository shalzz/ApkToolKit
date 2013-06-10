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

del tools\heapsize.txt
echo %size%>>tools\heapsize.txt

if %errorlevel%==0 (
echo I :Heap size succsesfully changed to %size% MB
)

:exit
exit /b 1