@echo off

set ex="extract"
if exist "extract" (
  if not exist "extract\" ( 
    echo "Error, extract is a file"
    Exit /b
    ) else (
    echo "Warning, extract\ exists"
    )
)
if not exist "extract" (mkdir %ex%) 

for /f "tokens=2 delims=:." %%x in ('chcp') do set cp=%%x
chcp 65001>nul
REM chcp 936>nul

REM FOR /F "tokens=*" %%G IN ('dir /b *.mp4') DO (ffmpeg -i "%%~nG.mp4" -vn -acodec copy "%ex%\%%~nG.m4a")
REM FOR /F "tokens=*" %%G IN ('dir /b *.mkv') DO (ffmpeg -i "%%~nG.mkv" -vn -acodec copy "%ex%\%%~nG.m4a")
REM FOR /F "tokens=*" %%G IN ('dir /b *.webm') DO (ffmpeg -i "%%~nG.webm" -vn -acodec copy "%ex%\%%~nG.m4a")
REM FOR /F "tokens=*" %%G IN ('dir /b *.flv') DO (ffmpeg -i "%%~nG.flv" -vn -acodec copy "%ex%\%%~nG.m4a")

REM for /F "tokens=*" %%A in ('dir /b .\%ex%') do (
for /F "tokens=*" %%A in ('dir /b *.mkv') do (
  setlocal enabledelayedexpansion
  set size=0
  REM echo "looking at %%A"
  for /f "tokens=3,5" %%b in ('dir /-c /a /w ".\%ex%\%%~nA.m4a" 2^>nul ^| findstr /b /c:"  " ^| findstr /c:"File"') do (
    set size=%%~b
  )
  REM echo "%%A has size !size!"
  if !size! EQU 0 (
    echo "deleting %%~nA.m4a"
    del ".\%ex%\%%~nA.m4a"
    ffmpeg -i "%%~nA%%~xA" -vn -acodec aac "%ex%\%%~nA.m4a"
  )
  endlocal
)




REM for /f "tokens=3,5" %%b in ('dir /-c /a /w ".\%ex%" 2^>nul ^| findstr /b /c:"  "') do (
REM   echo %%b
REM   REM if "%%~c"=="" set "size=%%~b"
REM   REM echo %size%
REM )

chcp %cp%>nul