@echo off 

set now=%date:~10,4%%date:~7,2%%date:~4,2%_%time:~0,2%%time:~3,2%
set today=%date:~10,4%%date:~7,2%%date:~4,2%
echo %date%
echo %now%
mkdir c:\_backup\%today%

set application_name=

"C:\Program Files\7-Zip\7z.exe" a c:\_backup\%today%\%application_name%_%now%.zip C:\inetpub\wwwroot\%application_name%\*

if errorlevel 4 goto lowmemory 
if errorlevel 2 goto abort 
if errorlevel 0 goto exit 

:lowmemory 
echo Insufficient memory to copy files or 
echo invalid drive or command-line syntax. 
goto exit 

:abort 
echo You pressed CTRL+C to end the copy operation. 
goto exit 

:exit 