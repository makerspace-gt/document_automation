@echo off
rem Builds PDFs for Model_Release.rmd
rem @author: Martin Teuber

call ..\..\..\Systemvorraussetzungen\Windows\scripts\findR.bat
if errorlevel 1 goto norexe

rem Install requirements
"%rexe%" "build.r"
goto :eof

:norexe
echo: & echo.^
No R.exe found. Maybe you need to install the Windows systems & echo.^
Requirements under document-automation/Systemvorraussetzungen/Windows
pause
