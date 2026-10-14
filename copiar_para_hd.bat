@echo off
chcp 65001 >nul
title Copiar Portal de Projetos para HD / Pendrive / OneDrive
cd /d "%~dp0"

echo ==============================================================================
echo Assistente de Copia para HD Externo, Pendrive ou OneDrive
echo ==============================================================================
echo.
echo Esta pasta contem todos os arquivos do projeto e o banco de dados (projetos.db).
echo.
echo Opcoes:
echo  [1] Copiar para uma unidade ou pasta (Exemplo: D:\portal_projetos ou E:\)
echo  [2] Abrir esta pasta no Windows Explorer
echo  [3] Copiar diretamente para a pasta do OneDrive deste computador
echo.
set /p OPCAO="Escolha uma opcao [1, 2 ou 3]: "

if "%OPCAO%"=="1" goto OPCAO_1
if "%OPCAO%"=="2" goto OPCAO_2
if "%OPCAO%"=="3" goto OPCAO_3

echo Opcao invalida.
pause
exit /b 1

:OPCAO_1
echo.
set /p DESTINO="Digite a letra da unidade ou caminho de destino (Ex: D:\portal_projetos): "
if not exist "%DESTINO%" mkdir "%DESTINO%"
echo Copiando arquivos para %DESTINO%...
robocopy "%~dp0." "%DESTINO%" /E /XD __pycache__ .git venv .venv /XF *.pyc *.log /MT:8
echo.
echo ==============================================================================
echo [SUCESSO] Projeto copiado com sucesso para: %DESTINO%
echo Para abrir no seu HD ou Pendrive, basta dar 2 cliques no arquivo run.bat!
echo ==============================================================================
pause
exit /b 0

:OPCAO_2
explorer "%~dp0"
exit /b 0

:OPCAO_3
set "ONEDRIVE_DIR=%USERPROFILE%\OneDrive\portal_projetos"
if not exist "%USERPROFILE%\OneDrive" set "ONEDRIVE_DIR=%USERPROFILE%\OneDrive - Personal\portal_projetos"
echo Copiando para: %ONEDRIVE_DIR%...
if not exist "%ONEDRIVE_DIR%" mkdir "%ONEDRIVE_DIR%"
robocopy "%~dp0." "%ONEDRIVE_DIR%" /E /XD __pycache__ .git venv .venv /XF *.pyc *.log /MT:8
echo.
echo ==============================================================================
echo [SUCESSO] Projeto copiado com sucesso para o OneDrive!
echo Localizacao: %ONEDRIVE_DIR%
echo O OneDrive sincronizara os arquivos automaticamente com a nuvem.
echo ==============================================================================
explorer "%ONEDRIVE_DIR%"
pause
exit /b 0
