@echo off
chcp 65001 >nul
title Portal de Gestao de Projetos
cd /d "%~dp0"

echo ==============================================================================
echo Portal de Gestao de Projetos - Inicializador
echo ==============================================================================
echo Diretorio atual: %CD%
echo.

:: 1. Detectar comando Python
set "PY_CMD="
where python >nul 2>&1
if %errorlevel% equ 0 set "PY_CMD=python"
if not defined PY_CMD (
    where py >nul 2>&1
    if %errorlevel% equ 0 set "PY_CMD=py"
)

if not defined PY_CMD (
    echo [ERRO] Python nao foi encontrado neste computador!
    echo.
    echo Para rodar o portal, instale o Python 3.10 ou superior:
    echo 1. Baixe em https://www.python.org/downloads/
    echo 2. ATENCAO: Marque a opcao "Add Python to PATH" durante a instalacao.
    echo.
    pause
    exit /b 1
)

echo [OK] Python detectado: %PY_CMD%
echo.

:: 2. Verificar dependencias
%PY_CMD% -c "import streamlit, pandas, openpyxl, reportlab" >nul 2>&1
if %errorlevel% neq 0 (
    echo [CONFIGURACAO] Instalando pacotes necessarios... Aguarde um momento.
    %PY_CMD% -m pip install -r requirements.txt
    if %errorlevel% neq 0 (
        echo [ERRO] Falha ao instalar dependencias com pip.
        pause
        exit /b 1
    )
)

:: 3. Iniciar a aplicacao Streamlit
echo ==============================================================================
echo Abrindo Portal de Projetos no navegador...
echo ==============================================================================
%PY_CMD% -m streamlit run app.py

if %errorlevel% neq 0 (
    echo.
    echo [AVISO] Ocorreu uma falha ao executar o Streamlit.
    pause
)
