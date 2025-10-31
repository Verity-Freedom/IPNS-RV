cd /d "%~dp0"
(
echo curl.exe https://ipfs.io/ipns/link/file.zip -O
echo tar -xf "%CD%\file.zip"
echo del "%CD%\file.zip"
echo xcopy "%userprofile%\user-config" "%CD%\user-config" /i /e
echo rmdir "%userprofile%\user-config" /s /q
echo start cmd /C del "%userprofile%\updater.cmd"
echo exit
) > "%userprofile%\updater.cmd"
xcopy "%CD%\user-config" "%userprofile%\user-config" /i /e
start "" "%userprofile%\updater.cmd"
rmdir "%CD%" /s /q
