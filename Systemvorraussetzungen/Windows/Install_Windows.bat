@echo off
rem Checks if R is installed and if so start the R Windows install scripts
rem @author: Martin Teuber

if exist scripts\install.txt goto install
echo: & echo.^
Please repeat executing this script until a message & echo.^
shows that the required software is installed.
pause
type NUL > scripts\install.txt

:install
call scripts\findR.bat
if errorlevel 1 goto norexe

rem Install requirements
"%rexe%" "scripts\installRMarkdownPackage.r"
where /q pandoc
if errorlevel 1 (
    "%rexe%" "scripts\installPandoc.r"
    exit
)

echo: & echo.^
All Required Software is installed! Documents can be build by & echo.^
executing the corresponding build script in the ducument subfolder.
pause
goto :eof

:norexe
echo: & echo.^
No R.exe found. Maybe you need to install R from & echo.^
https://cran.uni-muenster.de/bin/windows/base/
pause
