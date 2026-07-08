@echo off
title Nagaland Deck - local server
cd /d "%~dp0docs"

rem If the server is already running, just open the browser
netstat -ano | findstr /r ":8791 .*LISTENING" >nul
if %errorlevel%==0 (
  echo Server already running.
  start "" "http://localhost:8791/"
  exit /b
)

echo Starting deck at http://localhost:8791/  (close this window to stop)
start "" "http://localhost:8791/"
python -m http.server 8791 --bind 127.0.0.1
