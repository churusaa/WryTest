@echo off
:ask

echo Target path to test [C:\],[D:\Temp\],[\\share\path\]
echo with trailing slash (C:\Temp\)
set /p targetPath=
echo.

echo Name of the file
set /p fileName=
echo.

echo Full path to the source folder (with trailing slash):
set /p sourcePath=
echo.

echo Number of times to run the loop(copy..delete..repeat):
set /p counter=
echo.

echo.
echo Copying %fileName%
echo From %sourcePath%
echo To %targetPath%
echo %counter% times.
echo.
echo.
echo.
echo Is this correct? [y/n]
set /p confirm=

IF /I "%confirm%"=="y" goto proceed
IF /I "%confirm%"=="n" goto ask


:proceed
cls
set /p paws=Press any key to continue or CTRL+C to cancel...

:looper
@echo on
IF %counter% LEQ 0 goto END
echo %time% >>log.txt
xcopy /F %sourcePath%%fileName% %targetPath% >>log.txt
del %targetPath%%fileName% >>log.txt
echo %counter% iterations remaining >>log.txt
set /A counter = %counter% - 1
goto looper
:END
exit >>log.txt