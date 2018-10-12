for /f "tokens=2 delims=:." %%x in ('chcp') do set cp=%%x
chcp 936>nul
FOR /F "tokens=*" %%G IN ('dir /b *.mp4') DO (ffmpeg -i "%%~nG.mp4" -vn -acodec copy "%%~nG.m4a")
FOR /F "tokens=*" %%G IN ('dir /b *.mkv') DO (ffmpeg -i "%%~nG.mkv" -vn -acodec copy "%%~nG.m4a")
FOR /F "tokens=*" %%G IN ('dir /b *.webm') DO (ffmpeg -i "%%~nG.webm" -vn -acodec copy "%%~nG.m4a")
FOR /F "tokens=*" %%G IN ('dir /b *.flv') DO (ffmpeg -i "%%~nG.flv" -vn -acodec copy "%%~nG.m4a")
chcp %cp%>nul