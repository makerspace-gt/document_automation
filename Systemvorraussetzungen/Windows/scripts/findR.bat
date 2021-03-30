@echo Off
rem Checks if R is installed
rem @author: Martin Teuber
rem @return rexe: Absolute path to Rscript.exe 

SetLocal EnableExtensions DisableDelayedExpansion

rem Search the R path in the Windows Registry uninstall information
for /F "EOL=H Tokens=3*" %%G In (
    '"reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall /S /F "R for Windows" /K /V "InstallLocation" 2> NUL | find "InstallLocation""'
) Do Set "rexe=%%G %%Hbin\x64\Rscript.exe"

if not defined rexe goto nope
rem Ends namespace and writes environment variable in namespace of calling
rem BAT file to have a string return value for this script
endlocal & set rexe=%rexe%
exit /b 0

:nope
exit /b 1

rem This is a modified and combined Version of the Batch-Script by Karsten W.
rem https://stackoverflow.com/users/216064/ which can be found at
rem https://stackoverflow.com/a/62428433/15509690 and the Batch-Script of Mofi
rem https://stackoverflow.com/users/3074564 which can be found at
rem https://stackoverflow.com/a/50306209. Both have been used under the
rem CC BY-SA 4.0 license https://creativecommons.org/licenses/by-sa/4.0/
