@echo off
chcp 65001 >nul
title Assistente de Publicacao no GitHub
cd /d "%~dp0"

echo ==============================================================================
echo 🐙 Assistente de Publicacao do Projeto no GitHub
echo ==============================================================================
echo.

:: 1. Verificar se o Git esta instalado
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] O Git nao foi encontrado no seu computador!
    echo Por favor, instale o Git para Windows em: https://git-scm.com/download/win
    echo.
    pause
    exit /b 1
)

echo [OK] Git detectado com sucesso.
echo.

:: 2. Inicializar repositorio local caso nao exista
if not exist ".git" (
    echo [1/4] Inicializando repositorio Git local...
    git init
    git branch -M main
)

:: 3. Garantir configuracao de usuario para permitir commit
git config user.name >nul 2>&1
if %errorlevel% neq 0 (
    echo Configurando autor padrao para os commits locais...
    git config user.name "Gestor de Projetos"
    git config user.email "gestor@projetos.local"
)

:: 4. Adicionar arquivos e criar commit
echo [2/4] Adicionando arquivos e preparando versao...
git add .
git commit -m "feat: Portal de Gestao de Projetos (Streamlit, SQLite, i18n, PDF, Excel)" >nul 2>&1
echo [OK] Versao local pronta.
echo.

:: 5. Solicitar a URL do repositorio remoto
echo ==============================================================================
echo [3/4] Conectar ao seu repositorio no GitHub
echo ==============================================================================
echo.
echo Se voce ainda nao criou o repositorio no GitHub:
echo  1. Acesse: https://github.com/new
echo  2. De um nome (Exemplo: portal-projetos)
echo  3. Deixe Publico ou Privado (sua escolha)
echo  4. NAO marque "Add a README" nem .gitignore (ja temos aqui)
echo  5. Clique no botao verde "Create repository"
echo  6. Copie o link HTTPS que termina com .git
echo.
echo ==============================================================================
set /p REPO_URL="Cole aqui a URL HTTPS do seu repositorio GitHub: "

if "%REPO_URL%"=="" (
    echo.
    echo [AVISO] Nenhuma URL informada. Operacao cancelada.
    pause
    exit /b 1
)

:: 6. Configurar o remote origin
git remote remove origin 2>nul
git remote add origin %REPO_URL%

echo.
echo [4/4] Enviando arquivos para o GitHub (git push -u origin main)...
echo OBS: Se uma janela do navegador abrir pedindo login no GitHub, basta autorizar.
echo.

git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ==============================================================================
    echo 🎉 [SUCESSO] Projeto publicado com sucesso no GitHub!
    echo Acesse seu repositorio em: %REPO_URL%
    echo ==============================================================================
    echo.
    echo 💡 DICA: Agora voce pode publicar gratuitamente na nuvem do Streamlit:
    echo 1. Acesse https://share.streamlit.io
    echo 2. Conecte sua conta GitHub
    echo 3. Selecione o repositorio e clique em "Deploy"
    echo ==============================================================================
) else (
    echo.
    echo ==============================================================================
    echo [ATENCAO] O comando git push encontrou um problema.
    echo.
    echo Causas mais comuns:
    echo  1. Voce marcou para criar README ao criar o repositorio no GitHub.
    echo     Solucao: Tente executar: git push -u origin main --force
    echo  2. Falha de autenticacao com sua conta do GitHub.
    echo     Solucao: Gere um Personal Access Token no GitHub ou faca login pelo navegador.
    echo  3. URL digitada incorretamente.
    echo ==============================================================================
)

pause
