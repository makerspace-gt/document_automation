@echo off
rem Builds PDF for Transfer_Rights_of_Use_Wissenshaeppchen_3D-Druck.rmd
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
