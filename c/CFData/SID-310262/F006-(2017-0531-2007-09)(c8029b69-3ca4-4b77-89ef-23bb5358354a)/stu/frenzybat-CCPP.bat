set SrcExt=cpp
set ComExt=exe
set BatNam=%0
set ComNam=%1
set ComNam=%ComNam:~1,-1%
echo COM=%ComNam%
if "%ComNam%" == "Dev-Cpp" goto COM_DEVCPP
if "%ComNam%" == "MinGW" goto COM_MINGW
if "%ComNam%" == "CodeBlocks" goto COM_CODEBLOCKS
if "%ComNam%" == "WatCom" goto COM_WATCOM
exit

:COM_WATCOM
set comfd=C:\WatCom
set WATCOM=%comfd%
set PATH=%comfd%\BINNT;
set INCLUDE=%comfd%\h;
set LIB=%comfd%\lib386;
set Run=main.exe
set Com=cl.exe -G5 -MT main.cpp 1
rem StuCom DON'T LEAVE BLANK AFTER LAST NUMBER rem set ComBin=%comfd%\BINNT\cl.exe rem set ComBin2=
goto COM_COMMON

:COM_DEVCPP
set comfd=C:\Dev-Cpp
SET PATH=%comfd%\bin;
SET INCLUDE=%comfd%\include;
SET LIB=%comfd%\lib;
set Run=main.exe
set Com=g++.exe -Wl,-Bstatic -m32 -omain.%ComExt% main.%SrcExt% 2
rem StuCom DON'T LEAVE BLANK AFTER LAST NUMBER rem set ComBin=C:\Dev-Cpp\bin\g++.exe
goto COM_COMMON

:COM_CODEBLOCKS
set comfd=C:\Program Files (x86)\CodeBlocks\MinGW
set comf2=C:\Program Files\CodeBlocks\MinGW
SET PATH=%comfd%\bin;%comf2%\bin;
SET INCLUDE=%comfd%\include;%comf2%\include;
SET LIB=%comfd%\lib;%comf2%\lib;
set Run=main.exe
set Com=g++.exe -lm -Wl,-Bstatic -m32 -omain.%ComExt% main.%SrcExt% 2
rem StuCom DON'T LEAVE BLANK AFTER LAST NUMBER rem set ComBin=%comfd%\bin\g++.exe rem set ComBin2=%comf2%\bin\g++.exe
goto COM_COMMON

:COM_MINGW
set comfd=C:\MinGW
SET PATH=%comfd%\bin;
SET INCLUDE=%comfd%\include;
SET LIB=%comfd%\lib;
set Run=main.exe
set Com=g++.exe -lm -Wl,-Bstatic -m32 -omain.exe main.cpp 2
rem StuCom DON'T LEAVE BLANK AFTER LAST NUMBER rem set ComBin=%comfd%\bin\g++.exe  rem set ComBin2=
goto COM_COMMON

:COM_COMMON
call frenzybat-main.bat %2 %3 %4 %5 %6 %7 %8 %9
