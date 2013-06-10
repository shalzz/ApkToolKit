@echo off

ECHO I: Signing...
set /p heap=<tools\heapsize.txt
echo %heap%
java -Xmx%heap%m -jar tools\signapk.jar -w tools\testkey.x509.pem tools\testkey.pk8 "%name%.apk"  "%name%_signed.apk"
