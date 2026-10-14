# 🐙 Guia de Publicação no GitHub & Nuvem Streamlit

Este guia ensina como publicar o **Portal de Gestão de Projetos** no seu **GitHub** em poucos cliques e, opcionalmente, hospedá-lo gratuitamente na nuvem.

---

## 📋 Pré-requisito: Criar o Repositório no GitHub

1. Acesse sua conta no GitHub: **[https://github.com/new](https://github.com/new)**
2. No campo **Repository name**, digite um nome (exemplo: `portal-projetos`).
3. Escolha se o repositório será **Public** (Público) ou **Private** (Privado).
4. ⚠️ **IMPORTANTE**: **NÃO marque** as opções *"Add a README file"*, *"Add .gitignore"* nem *"Choose a license"* (o seu projeto já tem todos esses arquivos configurados).
5. Clique no botão verde **"Create repository"**.
6. Na página seguinte, copie a **URL HTTPS** que termina com `.git`.
   *Exemplo:* `https://github.com/seu-usuario/portal-projetos.git`

---

## 🚀 Método 1: Usando o Assistente Automático (Mais Fácil)

O repositório Git local já foi inicializado e todos os arquivos já foram commitados para você!

1. Acesse a pasta do projeto:  
   📂 `C:\Users\leome\.gemini\antigravity\scratch\portal_projetos`
2. Dê um **duplo clique no arquivo [`subir_github.bat`](subir_github.bat)**.
3. Cole a URL do repositório copiada no GitHub e aperte `Enter`.
4. Uma janela do seu navegador poderá abrir solicitando que você autorize o Git Credential Manager a acessar o seu GitHub (basta clicar em **"Authorize"**).
5. Pronto! Todos os arquivos e histórico serão enviados para o seu repositório no GitHub.

---

## 💻 Método 2: Via Terminal (PowerShell ou CMD)

Se preferir fazer pelo terminal, abra o PowerShell na pasta do projeto e execute apenas:

```powershell
cd C:\Users\leome\.gemini\antigravity\scratch\portal_projetos

# 1. Conecte ao seu repositório (substitua pela sua URL)
git remote add origin https://github.com/SEU_USUARIO/portal-projetos.git

# 2. Envie os arquivos para a branch principal
git push -u origin main
```

---

## ☁️ Bônus: Hospedar Gratuitamente na Nuvem do Streamlit

Com o projeto no GitHub, você pode hospedar o portal **100% de graça** na nuvem da Snowflake/Streamlit para acessar de qualquer computador ou celular:

1. Acesse **[share.streamlit.io](https://share.streamlit.io)** e faça login com sua conta do GitHub.
2. Clique no botão **"New app"**.
3. Selecione o repositório `seu-usuario/portal-projetos`.
4. Em **Main file path**, confirme que está como `app.py`.
5. Clique em **"Deploy"**.
6. Em menos de 2 minutos, seu portal estará no ar com um link público (ex: `https://seu-portal.streamlit.app`) acessível de qualquer computador do mundo!
