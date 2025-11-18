cd /d %~dp0
(
echo powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/link/file.zip', '%CD%\file.zip')"
echo start "" "%userprofile%\extractor.vbs"
echo exit
) > "%userprofile%\updater.cmd"
(
(
cmd /u /c echo set objShell = CreateObject("Shell.Application"^)
cmd /u /c echo objShell.NameSpace("%CD%"^).CopyHere(objShell.NameSpace("%CD%\file.zip"^).items^)
cmd /u /c echo CreateObject("WScript.Shell"^).Run "%userprofile%\cleaner.cmd"
) > "%userprofile%\extractor.vbs"
(
echo del "%CD%\file.zip"
echo xcopy "%userprofile%\data" "%CD%\data" /i /e
echo rmdir "%userprofile%\data" /s /q
echo cmd /c del "%userprofile%\updater.cmd"
echo cmd /c del "%userprofile%\extractor.vbs"
echo cmd /c del "%userprofile%\cleaner.cmd"
) > "%userprofile%\cleaner.cmd"
xcopy "%CD%\data" "%userprofile%\data" /i /e
start "" "%userprofile%\updater.cmd"
rmdir "%CD%" /s /q
