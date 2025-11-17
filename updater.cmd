cd /d "%~dp0"
(
echo powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/link/file.zip', '%CD%\file.zip')"
echo start "" "%userprofile%\extractor.vbs"
echo exit
) > "%userprofile%\updater.cmd"
(
echo ZipFile="%CD%\file.zip"
echo ExtractTo="%CD%"
echo set objShell = CreateObject("Shell.Application"^)
echo set FilesInZip=objShell.NameSpace(ZipFile^).items
echo objShell.NameSpace(ExtractTo^).CopyHere(FilesInZip^)
echo CreateObject("WScript.Shell"^).Run "%userprofile%\cleaner.cmd"
) > "%userprofile%\extractor.vbs"
(
echo del "%CD%\file.zip"
echo xcopy "%userprofile%\data" "%CD%\data" /i /e
echo rmdir "%userprofile%\data" /s /q
echo start cmd /C del "%userprofile%\updater.cmd"
echo start cmd /C del "%userprofile%\extractor.vbs"
echo start cmd /C del "%userprofile%\cleaner.cmd"
) > "%userprofile%\cleaner.cmd"
xcopy "%CD%\data" "%userprofile%\data" /i /e
start "" "%userprofile%\updater.cmd"
rmdir "%CD%" /s /q
