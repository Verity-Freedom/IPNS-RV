cd /d "%~dp0"
if "%CD:~-1%" == "\" (set "DIR=%CD:~0,-1%") else set "DIR=%CD%"
(
echo powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/link/file.zip', '%DIR%\file.zip')"
echo call "%userprofile%\extractor.vbs"
echo exit
)>"%userprofile%\updater.cmd"
(
cmd /u /c echo CreateObject("Shell.Application"^).NameSpace("%CD%"^).CopyHere(CreateObject("Shell.Application"^).NameSpace("%DIR%\file.zip"^).items^)
cmd /u /c echo CreateObject("WScript.Shell"^).Run "%userprofile%\cleaner.cmd"
)>"%userprofile%\extractor.vbs"
(
echo del "%DIR%\file.zip"
echo xcopy "%userprofile%\data" "%CD%\data" /i /e
echo rmdir "%userprofile%\data" /s /q
echo cmd /c del "%userprofile%\updater.cmd"
echo cmd /c del "%userprofile%\extractor.vbs"
echo cmd /c del "%userprofile%\cleaner.cmd"
)>"%userprofile%\cleaner.cmd"
xcopy "%CD%\data" "%userprofile%\data" /i /e
start "" "%userprofile%\updater.cmd"
rmdir "%CD%" /s /q
