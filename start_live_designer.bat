@echo off
title TTS Designer Live Server
echo Starting TTS Designer Live Server...
echo Open http://localhost:3001/TTS_Designer.html
echo.
powershell -ExecutionPolicy Bypass -Command "Set-Location '%~dp0'; .\serve_designer.ps1"
pause
