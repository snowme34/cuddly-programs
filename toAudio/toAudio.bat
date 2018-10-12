@echo off
rem use ffmpeg to extract audio from videos
rem brute force for mp4, mkv, webm, flv
rem audio in m4a format
rem output will be in .\extract\ subdirectory

set ex="extract"

if exist "extract" (
  if not exist "extract\" ( 
    echo Error, extract is a file
    Exit /b
    ) else (
    echo Warning, extract\ exists
    )
)

if not exist "extract" (mkdir %ex%) 

for /f "tokens=2 delims=:." %%x in ('chcp') do set cp=%%x
chcp 65001>nul

FOR /F "tokens=*" %%G IN ('dir /b *.mp4') DO (ffmpeg -i "%%~nG.mp4" -vn -acodec copy "%ex%\%%~nG.m4a")
FOR /F "tokens=*" %%G IN ('dir /b *.mkv') DO (ffmpeg -i "%%~nG.mkv" -vn -acodec copy "%ex%\%%~nG.m4a")
FOR /F "tokens=*" %%G IN ('dir /b *.webm') DO (ffmpeg -i "%%~nG.webm" -vn -acodec copy "%ex%\%%~nG.m4a")
FOR /F "tokens=*" %%G IN ('dir /b *.flv') DO (ffmpeg -i "%%~nG.flv" -vn -acodec copy "%ex%\%%~nG.m4a")

for /F "tokens=*" %%A in ('dir /b *.mp4') do (
  setlocal enabledelayedexpansion
  set size=0
  for /f "tokens=3,5" %%b in ('dir /-c /a /w ".\%ex%\%%~nA.m4a" 2^>nul ^| findstr /b /c:"  " ^| findstr /c:"File"') do (set size=%%~b)
  if !size! EQU 0 (
    del ".\%ex%\%%~nA.m4a"
    ffmpeg -i "%%~nA%%~xA" -vn -acodec aac "%ex%\%%~nA.m4a"
  )
  endlocal
)

for /F "tokens=*" %%A in ('dir /b *.mkv') do (
  setlocal enabledelayedexpansion
  set size=0
  for /f "tokens=3,5" %%b in ('dir /-c /a /w ".\%ex%\%%~nA.m4a" 2^>nul ^| findstr /b /c:"  " ^| findstr /c:"File"') do (set size=%%~b)
  if !size! EQU 0 (
    del ".\%ex%\%%~nA.m4a"
    ffmpeg -i "%%~nA%%~xA" -vn -acodec aac "%ex%\%%~nA.m4a"
  )
  endlocal
)

for /F "tokens=*" %%A in ('dir /b *.webm') do (
  setlocal enabledelayedexpansion
  set size=0
  for /f "tokens=3,5" %%b in ('dir /-c /a /w ".\%ex%\%%~nA.m4a" 2^>nul ^| findstr /b /c:"  " ^| findstr /c:"File"') do (set size=%%~b)
  if !size! EQU 0 (
    del ".\%ex%\%%~nA.m4a"
    ffmpeg -i "%%~nA%%~xA" -vn -acodec aac "%ex%\%%~nA.m4a"
  )
  endlocal
)

for /F "tokens=*" %%A in ('dir /b *.flv') do (
  setlocal enabledelayedexpansion
  set size=0
  for /f "tokens=3,5" %%b in ('dir /-c /a /w ".\%ex%\%%~nA.m4a" 2^>nul ^| findstr /b /c:"  " ^| findstr /c:"File"') do (set size=%%~b)
  if !size! EQU 0 (
    del ".\%ex%\%%~nA.m4a"
    ffmpeg -i "%%~nA%%~xA" -vn -acodec aac "%ex%\%%~nA.m4a"
  )
  endlocal
)

chcp %cp%>nul