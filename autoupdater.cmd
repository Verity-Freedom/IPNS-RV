@echo off
for %%I in (VERSION*) do set "UPD=%%~nxI"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/%UPD%', '%temp%\%UPD%')"
if %errorlevel% NEQ 0 (
echo @echo off>"%temp%\autoupdater.cmd"
echo call "%CD%\updater.cmd">>"%temp%\autoupdater.cmd"
echo cls>>"%temp%\autoupdater.cmd"
echo echo If you see this message, then the automatic update is most likely successful. You can wait or press any button to start the program.>>"%temp%\autoupdater.cmd"
echo timeout /t 30>>"%temp%\autoupdater.cmd"
echo call "%CD%\program.exe">>"%temp%\autoupdater.cmd"
echo exit>>"%temp%\autoupdater.cmd"
start "" "%temp%\autoupdater.cmd"
exit
) else (
del "%temp%\%UPD%"
del "%temp%\autoupdater.cmd" >nul 2>&1
)
