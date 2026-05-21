@echo off
:: Solicitar privilégios de administrador
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
	
	
:: Os seus comandos aqui
title Limpeza do Sistema
echo A iniciar limpeza de ficheiros temporarios...

:: Limpa a pasta Temp do Utilizador
del /s /f /q %temp%\*.*
for /d %%p in ("%temp%\*") do rd /s /q "%%p"

:: Limpa a pasta Temp do Windows
del /s /f /q %systemroot%\temp\*.*
for /d %%p in ("%systemroot%\temp\*") do rd /s /q "%%p"

echo.
echo Limpeza concluida com sucesso!
pause
