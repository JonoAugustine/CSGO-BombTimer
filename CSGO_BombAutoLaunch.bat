@ECHO OFF
SET csrunning=false
SET tmrunning=false
SET CSGO=csgo.exe
SET Timer=javaw.exe

:A
TIMEOUT /T 180

TASKLIST | FINDSTR /I %CSGO%
IF ERRORLEVEL 1 ( 
	SET csrunning=false
    GOTO :T
) ELSE ( 
	SET csrunning=true
    GOTO :T
)

:T
TASKLIST | FINDSTR /I %Timer%
IF ERRORLEVEL 1 (
	IF %csrunning% ( GOTO :Start ) 
) ELSE ( TASKKILL /IM %Timer% /F /T )

GOTO :A 

:Start
CALL "%~dp0\csgo.timer.jar"
GOTO :A

echo FAILED
