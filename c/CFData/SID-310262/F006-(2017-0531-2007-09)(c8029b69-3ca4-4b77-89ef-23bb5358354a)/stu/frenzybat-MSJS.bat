set fd=%1
set fd=%fd:~1,-1%

set PATH=C:\WINNT\Microsoft.Net\Framework\%fd%;C:\Windows\Microsoft.Net\Framework\%fd%
set INCLUDE=
set LIB=

Set BatNam=%0
set SrcExt=js
set ComExt=exe
set Run=main.exe
set Com=jsc.exe main.js 1
rem StuCom DON'T LEAVE BLANK AFTER LAST NUMBER rem set ComBin=C:\WINNT\Microsoft.Net\Framework\%fd%\jsc.exe set ComBin2=C:\Windows\Microsoft.Net\Framework\%fd%\jsc.exe
call frenzybat-main.bat %2 %3 %4 %5 %6 %7 %8 %9
