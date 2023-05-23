@echo off

set "FFmpeg=c:¥ffmpeg.exe"

for %%I in ("%~dp0") do set "SCRIPT_DIR=%%~fI"
set "OUTPUT_DIR=%SCRIPT_DIR%\Encoded"
set "INPUT_FILE=%~1"
for %%F in ("%INPUT_FILE%") do set "FILENAME=%%~nF"
set "OUTPUT_FILE=%OUTPUT_DIR%\%FILENAME%"
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

"%FFmpeg%" -i "%INPUT_FILE%" -c:v libx265 -preset slower ^
-vf "zscale=t=linear:npl=100,tonemap=tonemap=hable:desat=0,zscale=t=arib-std-b67:m=bt2020nc:p=bt2020:npl=800,format=p010le" ^
-tag:v hvc1 -crf 20 -c:a aac -b:a 320k -ar 48k "%OUTPUT_FILE%.mp4"

pause
