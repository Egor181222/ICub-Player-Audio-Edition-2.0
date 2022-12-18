@Echo off
:x
Title ICub Player Audio Edition 2.0
if exist Temp.vbs del /a -s -h Temp.vbs
if not exist Audio md Audio
cls
color 07
echo.
echo Available audio files:
cd Audio
dir /b /p
cd..
echo.
set "name="
set /p "name=Enter audio name: "
if not exist Audio\%name% goto :no
echo run audio in stopwatch mode(no pause option)?
choice /n /m "Y(Yes) or N(No)"
if "%errorlevel%" == "2" (goto :no_sec ) else (goto :sec )
:no_sec
(
echo.Set WMP = WScript.CreateObject^("MediaPlayer.MediaPlayer","WMP_"^)
echo.WMP.Open ^("Audio\%name%"^)
echo.WMP.Play
echo.msgbox "Press OK to stop the music"
echo.Set objShell = CreateObject^("WScript.Shell"^)
echo.objShell.Run "sys.bat"
) >Temp.vbs
:play
attrib +h +s Temp.vbs
start Temp.vbs
exit
:sec
set /p "sec=Enter how many seconds the song will play(no pause option): "
(
echo.Dim b
echo.Set WMP = WScript.CreateObject^("MediaPlayer.MediaPlayer","WMP_"^)
echo.WMP.Open ^("Audio\%name%"^)
echo.WMP.Play
echo.b=%sec%*1000
echo.wscript.sleep b
echo.Set objShell = CreateObject^("WScript.Shell"^)
echo.objShell.Run "sys.bat"
) >Temp.vbs
goto :play
exit
:no
cls
echo File not found.
pause
goto :x