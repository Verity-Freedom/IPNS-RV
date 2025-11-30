cd /d "%~dp0"
if "%CD:~-1%" == "\" (set "WAY=%CD:~0,-1%") else set "WAY=%CD%"
(
echo powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/link/file.zip', '%WAY%\file.zip')"
echo cscript "%temp%\extractor.vbs"
echo exit
)>"%temp%\updater.cmd"
(
cmd /u /c echo CreateObject("Shell.Application"^).NameSpace("%CD%"^).CopyHere(CreateObject("Shell.Application"^).NameSpace("%WAY%\file.zip"^).items^)
cmd /u /c echo CreateObject("WScript.Shell"^).Run "%temp%\cleaner.cmd"
)>"%temp%\extractor.vbs"
(
echo del "%WAY%\file.zip"
echo xcopy "%temp%\data" "%CD%\data" /i /e
echo rmdir "%temp%\data" /s /q
echo cmd /c del "%temp%\updater.cmd"
echo cmd /c del "%temp%\extractor.vbs"
echo cmd /c del "%temp%\cleaner.cmd"
)>"%temp%\cleaner.cmd"
xcopy "%CD%\data" "%temp%\data" /i /e
start "" "%temp%\updater.cmd"
rmdir "%CD%" /s /q
