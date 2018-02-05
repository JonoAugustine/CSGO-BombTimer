@ECHO ON
SET csrunning=0
SET tmrunning=0
SET CSGO=csgo.exe
SET Timer=javaw.exe

:A
TIMEOUT /T 180

REM is CSGO running? (1 = false)
TASKLIST | FINDSTR /I %CSGO%
IF ERRORLEVEL 1 ( 
    SET csrunning=0
) ELSE ( 
    SET csrunning=1
)

REM is Timer running? (1 = false)
TASKLIST | FINDSTR /I %Timer%
IF ERRORLEVEL 1 (
    SET tmrunning=0
) ELSE ( 
    SET tmrunning=1
)

REM IF cs is running and timer is not, 
REM start the timer
IF %csrunning%==1 (
   IF %tmrunning%==1 ( 
        echo ''
   ) ELSE ( 
        GOTO :Start 
   )

    REM If cs is not running and the timer is,
    REM Stop the timer
) ELSE (
    IF %tmrunning%==1 TASKKILL /IM %Timer% /F /T
)

GOTO :A 

:Start
start "%~dp0\LaunchLauncher.vbs"
GOTO :A

echo FAILED

REM CSGO is running
REM     Timer is running
REM         
REM     Do nothing
REM
REM
REM CSGO is running
REM     Timer is not running
REM     
REM     Start timer
REM
REM CSGO is not running
REM     Timer is running
REM
REM     Stop timer
REM
REM CSGO is not running
REM     Running is not running
REM
REM     Do nothing

