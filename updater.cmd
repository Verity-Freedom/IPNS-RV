cd /d "%~dp0"
(
echo curl.exe https://ipfs.io/ipns/link/file.zip -O
echo tar -xf "%CD%\file.zip"
echo del "%CD%\file.zip"
echo xcopy "%userprofile%\data" "%CD%\data" /i /e
echo rmdir "%userprofile%\data" /s /q
echo start cmd /C del "%userprofile%\updater.cmd"
echo exit
) > "%userprofile%\updater.cmd"
xcopy "%CD%\data" "%userprofile%\data" /i /e
start "" "%userprofile%\updater.cmd"
rmdir "%CD%" /s /q
