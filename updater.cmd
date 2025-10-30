cd /d %~dp0
(
echo @echo off
echo curl.exe https://ipfs.io/ipns/link/file.zip -O
echo tar -xf "%CD%\file.zip"
echo del "%CD%\file.zip"
echo start cmd /C del "%userprofile%\updater.cmd"
echo exit
) > "%userprofile%\updater.cmd"
start "" "%userprofile%\updater.cmd"
ping 192.0.2.0 -n 1 -w 500
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
