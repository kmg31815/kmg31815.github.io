rem --------------------------------------------
set ManSrc=main.%SrcExt%
set ComOut=main.%ComExt%
set TeaFld=..\ans
set StuFld=..\stu
set CdrTea=cd %TeaFld%
set CdrStu=cd %StuFld%
%CdrTea% & ren main.src %ManSrc%
%CdrStu% & ren main.src %ManSrc%


set DelTeaSrc=del %TeaFld%\*.%SrcExt%
set DelStuBin=del %StuFld%\*.obj %ComOut%
rem set Run=%ComOut%

set StuCom=%Com%^>out.com.txt 
set StuRun=frenzybat.exe rungo %Run% 
set ChkStuRdy=if not "%ComOut%" == "" if not exist "%StuFld%\%ComOut%" goto NotStuRdy 

set TeaCom=%Com%^>out.com.txt 
set TeaRun=frenzybat.exe rungo %Run% 
set ChkTeaRdy=if not "%ComOut%" == "" if not exist "%TeaFld%\%ComOut%" goto NotTeaRdy

if not exist "%TeaFld%\%ManSrc%" set TeaCom=  & set TeaRun=frenzybat.exe rungo main.exe  &  set ChkTeaRdy=if not "%ComOut%" == "" if not exist "%TeaFld%\main.exe" goto NotTeaRdy

set CfyInp=frenzybat.exe input
set CfySco=frenzybat.exe score

if "%1"=="BatEmp" goto BatEmp
if "%1"=="BatBld" goto BatBld
if "%1"=="BatTst" goto BatTst
if "%1"=="BatScr" goto BatScr
goto End

:BatBld
  rem BatBld 
  %CdrTea%
    %TeaCom%
    %DelTeaSrc%
  %CdrStu%
    %DelStuBin%
    %StuCom%
  %ChkTeaRdy%
  %ChkStuRdy%    
  goto End

:BatEmp 
  rem BatEmp
  %CdrStu%
    %CfyInp% -1
    goto BatTst      

:BatTst
  rem BatTst
  %CdrStu%
    %DelStuBin%
    %StuCom%
    set StuRunErr=PASS     
    %StuRun%
    del out.message.txt out.score.txt out.acm.txt out.gigacycles.txt
    %StuRun%
    if ERRORLEVEL 1 set StuRunErr=ERROR
  %CdrTea%
    %TeaCom%
    %DelTeaSrc%
    set TeaRunErr=PASS
    %TeaRun%
    del out.message.txt out.score.txt out.acm.txt out.gigacycles.txt
    %TeaRun%   
    if ERRORLEVEL 1 set TeaRunErr=ERROR   
    if "%StuRunErr%" == "ERROR" goto StuRunErr 
    if "%TeaRunErr%" == "ERROR" goto TeaRunErr 
  %CdrStu%
  %TeaRdy%
  %StuRdy%
  %CfySco%
  goto End

:BatScr
  rem BatScr
  %CdrTea%
    %CfyInp% -1
    %TeaCom%
    %DelTeaSrc%
    %TeaRun%
    del out.message.txt out.score.txt out.acm.txt out.gigacycles.txt    
  %CdrStu%
    del out.score.txt
    %DelStuBin%
    %StuCom%
    %StuRun%
    del out.message.txt out.score.txt out.acm.txt out.gigacycles.txt    
  %TeaRdy%
  %StuRdy%
  for %%a in ( 0 1 2 3 4 5 6 7 8 9 ) do (
    %CdrStu%
      %CfyInp% %%a  
      if ERRORLEVEL 1 goto End  
      echo %%a >> input-paras.txt
      set StuRunErr=PASS 
      %StuRun%
      if ERRORLEVEL 1 set StuRunErr=ERROR
    %CdrTea%
      set TeaRunErr=PASS
      %TeaRun%
      if ERRORLEVEL 1 set TeaRunErr=ERROR   
      if "%StuRunErr%" == "ERROR" goto StuRunErr 
      if "%TeaRunErr%" == "ERROR" goto TeaRunErr 
    %CdrStu%
      %CfySco%
      if ERRORLEVEL 1 goto End
  )

goto End

:NoCom
  rem NoCom
  rem echo ^<div style=background:red;color:yellow;text-decoration:bold^>瘋狂訊息：找不到編譯器或直譯器，請將作業系統及編譯器直譯器安裝到預設之正確位置。^</div^>  > out.message.txt
  rem echo NoCom > out.message.txt
  rem echo "%ComBin%" ^<br^> "%ComBin2%" >> out.message.txt
  rem echo NoCom > ..\stu\out.state.txt 
  rem goto End

:NotTeaRdy
  rem NotTeaRdy echo ^<div style=background:red;color:yellow;text-decoration:bold^>標準答案編譯未完成，請檢察相關函式庫安裝是否到位。^</div^>  >..\stu\out.message.txt 
  echo NotTeaRdy > ..\stu\out.message.txt 
  echo NotTeaRdy > ..\stu\out.state.txt 
  goto End

:NotStuRdy
  rem NotStuRdy echo ^<div style=background:blue;color:yellow;text-decoration:bold^>您的源碼編譯時發現錯誤，請修改源碼，再試一次。^</div^>  >out.message.txt 
  echo NotStuRdy > ..\stu\out.message.txt
  echo NotStuRdy > ..\stu\out.state.txt 
  goto End

:TeaRunErr
  rem TeaRunErr echo ^<div style=background:red;color:yellow;text-decoration:bold^>標準答案執行時發生錯誤，請截圖通知教師，轉通知題師解決此一問題。^</div^>  >out.message.txt 
  echo TeaRunErr > ..\stu\out.message.txt
  echo TeaRunErr > ..\stu\out.state.txt  
  goto End

:StuRunErr
  rem StuRunErr echo ^<div style=background:blue;color:yellow;text-decoration:bold^>您的答案執行時發生錯誤，請修改源碼，再試一次。^</div^>  >out.message.txt 
  echo StuRunErr > ..\stu\out.message.txt
  echo StuRunErr > ..\stu\out.state.txt  
  goto End

:End
  rem End
  %CdrTea%
    %DelSrc%
  %CdrStu%
