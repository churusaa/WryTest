@echo off
:ask

echo Target path to test [C:\],[D:\Temp\],[\\share\path\]
echo **With trailing slash (C:\Temp\)**
set /p targetPath=
echo.

echo Name of the file (preferably a large one)
set /p fileName=
echo.

echo Full path to the source folder (with trailing slash):
echo (also the log location)
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
echo.
echo.
set /p paws=Press any key to continue or CTRL+C to cancel...
echo It begins...

:looper
@echo on
IF %counter% LEQ 0 goto END
echo %time% >>"%sourcePath%"log.txt
xcopy /F /Y "%sourcePath%%fileName%" "%targetPath%" >>"%sourcePath%"log.txt
del "%targetPath%%fileName%" >>"%sourcePath%"log.txt
set /A counter = %counter% - 1
echo %counter% iterations remaining >>"%sourcePath%"log.txt
echo.
goto looper
:END
exit >>"%sourcePath%"log.txt
