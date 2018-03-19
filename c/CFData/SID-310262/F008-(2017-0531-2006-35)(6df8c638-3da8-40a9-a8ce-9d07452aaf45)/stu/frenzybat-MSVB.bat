set fd=%1
set fd=%fd:~1,-1%

set PATH=C:\WINNT\Microsoft.Net\Framework\%fd%;C:\Windows\Microsoft.Net\Framework\%fd%
set INCLUDE=
set LIB=

Set BatNam=%0
set SrcExt=vb
set ComExt=exe
set Run=main.exe
set Com=vbc.exe main.vb 1
rem StuCom DON'T LEAVE BLANK AFTER LAST NUMBER rem set TeaDelSrc=del *.vb set StuDelBin=del *.obj %ComOut% rem set ComBin=C:\WINNT\Microsoft.Net\Framework\%fd%\csc.exe set ComBin2=C:\Windows\Microsoft.Net\Framework\%fd%\csc.exe

call frenzybat-main.bat %2 %3 %4 %5 %6 %7 %8 %9
