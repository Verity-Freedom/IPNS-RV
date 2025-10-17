cd /d %~dp0
(
echo @echo off
echo curl.exe https://ipfs.io/ipns/link/file.zip -O
echo tar -xf "%CD%\file.zip"
echo del "%CD%\file.zip"
echo del "%userprofile%\updater.cmd" >nul
echo exit
) > "%userprofile%\updater.cmd"
start "" "%userprofile%\updater.cmd"
timeout /t 1 /nobreak
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
