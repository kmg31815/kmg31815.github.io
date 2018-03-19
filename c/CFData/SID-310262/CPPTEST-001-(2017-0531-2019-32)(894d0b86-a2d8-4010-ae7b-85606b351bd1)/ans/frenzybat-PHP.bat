set PATH=..\..\..\..\CodeLang\php-536
set ComBin=%PATH%\php-cgi.exe 

set SrcExt=php
set ComExt=php
set Com=echo
set Run=%ComBin% -c%PATH% main.php
rem StuCom DON'T LEAVE BLANK AFTER LAST NUMBER

set BatNam=%0
call frenzybat-main.bat %1 %2 %3 %4 %5 %6 %7 %8 %9
