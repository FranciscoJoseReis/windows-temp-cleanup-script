@echo off
title Limpeza de Ficheiros Temporarios
color 0A

:: ==============================
:: VERIFICAR ADMIN
:: ==============================
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Solicitando privilegios de administrador...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "cmd.exe", "/c %~s0", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:: ==============================
:: LOG
:: ==============================
set LOGFILE=%~dp0cleanup_log.txt

echo ============================== >> "%LOGFILE%"
echo Limpeza iniciada em %date% %time% >> "%LOGFILE%"
echo ============================== >> "%LOGFILE%"

echo.
echo A iniciar limpeza...
echo.

:: ==============================
:: TEMP UTILIZADOR
:: ==============================
echo [1/2] Limpeza Temp do Utilizador...
echo [1/2] >> "%LOGFILE%"

del /s /f /q "%temp%\*.*" >> "%LOGFILE%" 2>&1
for /d %%p in ("%temp%\*") do rd /s /q "%%p" >> "%LOGFILE%" 2>&1

:: ==============================
:: TEMP WINDOWS
:: ==============================
echo.
echo [2/2] Limpeza Temp do Windows...
echo [2/2] >> "%LOGFILE%"

del /s /f /q "%systemroot%\temp\*.*" >> "%LOGFILE%" 2>&1
for /d %%p in ("%systemroot%\temp\*") do rd /s /q "%%p" >> "%LOGFILE%" 2>&1

:: ==============================
echo.
echo Limpeza concluida com sucesso!
echo ============================== >> "%LOGFILE%"
echo Limpeza concluida em %date% %time% >> "%LOGFILE%"

pause
start %LOGFILE%
exit