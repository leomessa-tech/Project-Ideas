# ☁️ Guia de Uso com OneDrive & HD Externo

Este guia orienta como salvar o projeto no seu **HD Externo / Pendrive**, transferi-lo para o **OneDrive** e gerenciá-lo de qualquer computador conectado à sua nuvem.

---

## 📌 Como Funciona

Ao colocar a pasta do projeto dentro do seu **OneDrive**:
1. O banco de dados (`projetos.db`) e todos os arquivos ficam salvos na sua nuvem Microsoft.
2. Em qualquer computador onde você abrir o OneDrive, os dados e projetos cadastrados estarão 100% atualizados.
3. Para abrir o portal, basta dar **duplo clique no arquivo `run.bat`**.

---

## 💾 PASSO 1: Salvar o Projeto no seu HD Externo ou Pendrive

A pasta atual com todo o projeto pronto fica em:
📂 `C:\Users\leome\.gemini\antigravity\scratch\portal_projetos`

Você pode salvar no seu HD de duas maneiras simples:

### Opção A (Automática):
1. Conecte o seu HD Externo ou Pendrive ao computador.
2. Dê duplo clique no arquivo [`copiar_para_hd.bat`](copiar_para_hd.bat).
3. Digite a opção `1` e informe a letra da sua unidade (ex: `D:\portal_projetos` ou `E:\portal_projetos`).
4. Pronto! O projeto será copiado integralmente para o seu HD.

### Opção B (Usando o arquivo ZIP pronto):
- O arquivo compactado **`portal_projetos_nuvem.zip`** já está gerado dentro da pasta.
- Basta copiá-lo diretamente para o seu HD Externo ou Pendrive.

---

## ☁️ PASSO 2: Importar o Projeto no OneDrive

1. Conecte o HD no computador onde você deseja gerenciar pelo OneDrive (ou use este mesmo computador).
2. Abra o **Windows Explorer** e vá até a sua pasta do **OneDrive** (geralmente em `C:\Users\<SeuNome>\OneDrive`).
3. Cole a pasta `portal_projetos` dentro do OneDrive:
   Exemplo de caminho final:
   `C:\Users\<SeuNome>\OneDrive\portal_projetos`
4. O ícone de nuvem azul/branca do OneDrive na barra de tarefas começará a sincronizar automaticamente todos os arquivos e o banco de dados `projetos.db`.

---

## 💻 PASSO 3: Acessar e Gerenciar de Qualquer Computador

Em qualquer computador onde o seu OneDrive estiver configurado:

1. Acesse a pasta `OneDrive\portal_projetos`.
2. Dê **duplo clique no arquivo `run.bat`**:
   - **Na primeira vez que você abrir em um novo computador**, o `run.bat` detectará automaticamente o Python e instalará as bibliotecas necessárias (`streamlit`, `pandas`, `openpyxl`, `reportlab`) de forma 100% automática.
   - O portal abrirá imediatamente no seu navegador padrão (`http://localhost:8501`).
3. Faça login com suas credenciais:
   - **Usuário**: `admin`
   - **Senha**: `admin123`
4. Todas as inclusões, edições, relatórios em PDF/Excel e avisos disparados serão salvos em `projetos.db` e sincronizados pelo OneDrive para os outros computadores!

---

## 💡 Dicas e Recomendações Importantes

1. **Requisito no Computador**:
   O único requisito para qualquer computador onde você for rodar o portal é ter o **Python 3.10 ou superior** instalado (disponível gratuitamente em [python.org](https://www.python.org) ou na Microsoft Store). Lembre-se de marcar a caixinha *"Add Python to PATH"* ao instalar.
   
2. **Sincronização sem Conflitos**:
   Quando terminar de usar o portal em um computador, encerre a janela preta do terminal antes de abrir no outro computador. Assim o OneDrive conclui o envio do arquivo `projetos.db` sem criar arquivos duplicados de conflito.

3. **Proteção contra Travamento de Sincronização**:
   O sistema já foi pré-configurado com tolerância de até 20 segundos (`busy_timeout=20000`) para que o banco SQLite nunca trave caso o OneDrive esteja realizando sincronização no mesmo instante.
