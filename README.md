# 📋 Portal de Consulta e Acompanhamento de Projetos

Sistema corporativo para cadastro, consulta, acompanhamento de prazos e disparo automático de alertas por e-mail (SMTP) para gestores e responsáveis de projetos.

---

## 🚀 Como Executar

### Opção 1: Via Arquivo Batch (Mais Rápido no Windows)
Basta dar um duplo clique no arquivo:
`run.bat`

### Opção 2: Via Terminal (PowerShell / Prompt de Comando)
No diretório `C:\Users\leome\.gemini\antigravity\scratch\portal_projetos`:
```powershell
python -m streamlit run app.py
```
O navegador abrirá automaticamente em `http://localhost:8501`.

### 🔑 Credenciais Padrão de Acesso:
- **Usuário**: `admin`
- **Senha**: `admin123`
*(Você também pode cadastrar novos usuários diretamente na tela inicial ou pelo menu lateral após o login).*

---

## 📌 Funcionalidades do Portal

1. **Campos Gerenciados**:
   - **Nome do Projeto**
   - **Data de Início**
   - **Data de Término**
   - **Data de Aviso de Chegando ao Fim**
   - **Responsável**
   - **E-mail do Responsável**
   - Observações e status de conclusão

2. **Cálculo Automático de Status**:
   - 🟢 **No Prazo**: Antes da data de aviso.
   - ⚠️ **Chegando ao Fim**: Data de aviso atingida (aciona os alertas).
   - 🚨 **Atrasado**: Ultrapassou a data de término sem conclusão.
   - ✅ **Concluído**: Finalizado pelo usuário.

3. **Central de Alertas & Notificações (SMTP)**:
   - Identificação imediata dos projetos críticos.
   - Disparo individual ou em lote para os e-mails dos responsáveis.
   - E-mail corporativo formatado em HTML com visual moderno.
   - Registro de histórico da data do último envio de aviso.

4. **Painel Geral (Dashboard)**:
   - Indicadores de KPIs com contagem de projetos por status.
   - Gráfico de distribuição por status e por responsável.

5. **Consulta, Filtros & Emissão de Relatórios**:
   - Busca em tempo real por nome, responsável, e-mail e observações.
   - Filtros de status (cronograma), prioridade, status operacional e responsável.
   - Edição e exclusão direta no portal.
   - **Emissão e Exportação de Relatórios com Filtros Ativos**:
     - 📕 **Relatório em PDF**: Layout executivo em A4 paisagem, resumo de KPIs, metadados dos filtros e paginação numerada (*Página X de Y*).
     - 📗 **Planilha em Excel (.xlsx)**: Estilização corporativa com cores de prioridade/status e ajuste automático de colunas via OpenPyXL.
     - 📥 **Exportação CSV**: Exportação rápida dos dados filtrados.

6. **Configurações SMTP**:
   - Compatível com Google/Gmail, Microsoft 365/Outlook e servidores corporativos próprios.
   - Ferramenta integrada de teste de conexão e autenticação.

7. **Suporte a 4 Idiomas (i18n)**:
   - 🇧🇷 Português (Brasil) | 🇺🇸 English | 🇪🇸 Español | 🇫🇷 Français

8. **Autenticação & Controle de Acesso**:
   - Tela de login com senhas criptografadas (SHA-256 + salt).
   - Gerenciamento e cadastro de novos usuários.

