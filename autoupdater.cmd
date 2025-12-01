for %%I in (VERSION*) do set "UPD=%%~nxI"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/%UPD%', '%temp%\%UPD%')"
if %errorlevel% NEQ 0 (
echo call "%CD%\updater.cmd">"%temp%\autoupdater.cmd"
echo timeout /t 15>>"%temp%\autoupdater.cmd"
echo call "%CD%\program.exe">>"%temp%\autoupdater.cmd"
echo cmd /c del "%temp%\autoupdater.cmd">>"%temp%\autoupdater.cmd"
call "%temp%\autoupdater.cmd"
) else (
del "%temp%\%UPD%"
)