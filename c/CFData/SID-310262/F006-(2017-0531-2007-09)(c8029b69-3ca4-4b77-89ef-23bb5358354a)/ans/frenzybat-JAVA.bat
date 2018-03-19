set fd=%1
set fd=%fd:~1,-1%

set PATH=C:\Program Files (x86)\Java\%fd%\bin;C:\Program Files\Java\%fd%\bin;C:\Java\%fd%\bin;
set CLASSPATH=.;C:\Program Files (x86)\Java\%fd%\lib;C:\Program Files\Java\%fd%\lib;C:\Java\%fd%\lib
rem set ComBin=C:\Program Files (x86)\Java\%fd%\bin\javac.exe 
rem set ComBin2=C:\Program Files\Java\%fd%\bin\javac.exe
rem set ComBin3=C:\Java\%fd%\bin\javac.exe 

set SrcExt=java
set ComExt=class
rem set TeaDelSrc=del *.java
rem set StuDelBin=del *.class
rem set ManSrc=main.java
set Com=javac main.java 2
rem StuCom DON'T LEAVE BLANK AFTER LAST NUMBER
rem set ComOut=main.class

set BatNam=%0
set ComNam=%1

set Run=java.exe main
rem set Sec=3
set BatNam=%0

call frenzybat-main.bat %2 %3 %4 %5 %6 %7 %8 %9
