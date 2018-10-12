@echo off
for /f "tokens=2 delims=:." %%x in ('chcp') do set cp=%%x
chcp 65001>nul
REM chcp 936>nul
FOR /F "tokens=*" %%G IN ('dir /b *.mp4') DO (ffmpeg -i "%%~nG.mp4" -vn -acodec aac "%%~nG.m4a")
FOR /F "tokens=*" %%G IN ('dir /b *.mkv') DO (ffmpeg -i "%%~nG.mkv" -vn -acodec aac "%%~nG.m4a")
REM FOR /F "tokens=*" %%G IN ('dir /b *.mkv') DO (ffmpeg -i "%%G" -vn -acodec aac "%%~nG.m4a")
FOR /F "tokens=*" %%G IN ('dir /b *.webm') DO (ffmpeg -i "%%~nG.webm" -vn -acodec aac "%%~nG.m4a")
FOR /F "tokens=*" %%G IN ('dir /b *.flv') DO (ffmpeg -i "%%~nG.flv" -vn -acodec aac "%%~nG.m4a")FOR /F "tokens=*" %%G IN ('dir /b *.webm') DO (ffmpeg -i "%%~nG.webm" -vn -acodec aac "%%~nG.m4a")
chcp %cp%>nul