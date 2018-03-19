set fd=%1
set fd=%fd:~1,-1%

set PF64=C:\Program Files
set PF86=C:\Program Files (x86)

if "%fd%" == "Microsoft Visual Studio 9.0"  set sdk=v6.0A
if "%fd%" == "Microsoft Visual Studio 10.0" set sdk=v7.0A
if "%fd%" == "Microsoft Visual Studio 11.0" set sdk=v8.0A
if "%fd%" == "Microsoft Visual Studio 12.0" set sdk=v9.0A
if "%fd%" == "Microsoft Visual Studio 14.0" set sdk=vXXXA

set PATH=
set PATH=%PATH%;%PF64%\%fd%\VC\BIN;%PF64%\%fd%\Common7\IDE;
set PATH=%PATH%;%PF86%\%fd%\VC\BIN;%PF86%\%fd%\Common7\IDE;

set INCLUDE=
set INCLUDE=%INCLUDE%;%PF64%\%fd%\VC\INCLUDE;%PF64%\Microsoft SDKs\Windows\%sdk%\Include;
set INCLUDE=%INCLUDE%;%PF86%\%fd%\VC\INCLUDE;%PF86%\Microsoft SDKs\Windows\%sdk%\Include;
if "%fd%" == "Microsoft Visual Studio 14.0" set INCLUDE=%PF64%\Windows Kits\10\include\10.0.10150.0\ucrt;%PF86%\Windows Kits\10\include\10.0.10150.0\ucrt;%PF64%\Windows Kits\10\include\10.0.10240.0\ucrt;%PF86%\Windows Kits\10\include\10.0.10240.0\ucrt;%INCLUDE%; 

set LIB=
set LIB=%LIB%;%PF64%\%fd%\VC\LIB;%PF64%\Microsoft SDKs\Windows\%sdk%\Lib;
set LIB=%LIB%;%PF86%\%fd%\VC\lib;%PF86%\Microsoft SDKs\Windows\%sdk%\Lib;
      
if "%fd%" == "Microsoft Visual Studio 11.0" set       LIB=%PF64%\%fd%\VC\LIB;%PF64%\Windows Kits\8.0\lib\win8\um\x86; 
if "%fd%" == "Microsoft Visual Studio 11.0" set LIB=%LIB%;%PF86%\%fd%\VC\LIB;%PF86%\Windows Kits\8.0\lib\win8\um\x86;
if "%fd%" == "Microsoft Visual Studio 12.0" set       LIB=%PF64%\%fd%\VC\LIB;%PF64%\Windows Kits\8.1\lib\winv6.3\um\x86; 
if "%fd%" == "Microsoft Visual Studio 12.0" set LIB=%LIB%;%PF86%\%fd%\VC\LIB;%PF86%\Windows Kits\8.1\lib\winv6.3\um\x86; 
if "%fd%" == "Microsoft Visual Studio 14.0" set       LIB=%PF64%\%fd%\VC\LIB;%PF64%\Windows Kits\8.1\lib\winv6.3\um\x86;%PF64%\Windows Kits\10\lib\10.0.10150.0\ucrt\x86;%PF64%\Windows Kits\10\lib\10.0.10240.0\ucrt\x86;
if "%fd%" == "Microsoft Visual Studio 14.0" set LIB=%LIB%;%PF86%\%fd%\VC\LIB;%PF86%\Windows Kits\8.1\lib\winv6.3\um\x86;%PF86%\Windows Kits\10\lib\10.0.10150.0\ucrt\x86;%PF86%\Windows Kits\10\lib\10.0.10240.0\ucrt\x86; 

if "%fd%" == "Microsoft Visual Studio 14.0" set LIBPATH=%PF86%\Microsoft Visual Studio 14.0\VC\LIB;%PF64%\Microsoft Visual Studio 14.0\VC\LIB;

if "%fd%" == "Microsoft Visual Studio 14.0" set SystemRoot=C:\Windows
if "%fd%" == "Microsoft Visual Studio 14.0" set USERPROFILE=.

rem set ComBin=C:\Program Files\%fd%\VC\BIN\cl.exe  rem set ComBin2=C:\Program Files (x86)\%fd%\VC\bin\cl.exe

set BatNam=%0
set __compat_layer=
set SrcExt=cpp
set ComExt=exe
set Run=main.exe
set Com=cl.exe /EHsc /MACHINE:X86 /MT main.cpp 1
rem StuCom DON'T LEAVE BLANK AFTER LAST NUMBER
call frenzybat-main.bat %2 %3 %4 %5 %6 %7 %8 %9