# ☁️ Guia de Publicação e Acesso na Nuvem

Este guia explica passo a passo como colocar o **Portal de Gestão de Projetos** para rodar na sua nuvem e acessá-lo pelo navegador de qualquer computador ou celular.

---

## 📦 1. Arquivo de Transferência Rápida (.ZIP)

Todos os arquivos do projeto já estão empacotados em um arquivo ZIP limpo e pronto para upload:
📁 **`portal_projetos_nuvem.zip`**  
Localização local: `C:\Users\leome\.gemini\antigravity\scratch\portal_projetos\portal_projetos_nuvem.zip`

Você pode transferir este arquivo para o seu servidor na nuvem usando:
- **WinSCP / FileZilla** (Transferência via SFTP/SSH)
- **SCP via Terminal**:
  ```bash
  scp portal_projetos_nuvem.zip usuario@ip_do_seu_servidor:/home/usuario/
  ```
- **Painel Web da sua nuvem** (Upload de arquivos em gerenciador de arquivos/cPanel/SSH Web Console).

No servidor na nuvem, descompacte o arquivo com:
```bash
unzip portal_projetos_nuvem.zip -d portal_projetos
cd portal_projetos
```

---

## 🚀 2. Como Subir e Rodar na Nuvem

Escolha uma das 3 opções abaixo de acordo com a sua preferência:

---

### 🐳 OPÇÃO A: Usando Docker (Recomendada - Mais Fácil e Rápida)

Se o seu servidor já possui o Docker instalado, basta um único comando para colocar o portal no ar:

```bash
docker compose up -d --build
```

**Vantagens:**
- O Docker cuida de todas as dependências automaticamente.
- O arquivo `projetos.db` é mapeado em um volume, ou seja, **seus dados não são perdidos** mesmo se o container for reiniciado.
- O portal inicia automaticamente junto com o sistema operacional caso o servidor seja reiniciado (`restart: always`).

Para verificar se está rodando:
```bash
docker compose ps
docker compose logs -f
```

Para parar o container quando desejar:
```bash
docker compose down
```

---

### 🐧 OPÇÃO B: Rodando Direto com Python no Servidor Linux

Se você utiliza uma Máquina Virtual (Ubuntu, Debian, Amazon Linux, Oracle Linux, etc.):

1. Execute o script de inicialização automática preparado para você:
```bash
chmod +x start_cloud.sh
./start_cloud.sh --daemon
```

O script irá:
- Criar o ambiente virtual isolado (`venv`).
- Instalar as dependências do `requirements.txt`.
- Configurar o servidor para escutar na porta `8501` e aceitar conexões externas (`0.0.0.0`).
- Rodar em segundo plano (`--daemon`) e salvar os logs em `portal.log`.

---

### ⚙️ OPÇÃO C: Como Serviço Permanente do Linux (systemd)

Para que o portal inicie automaticamente sempre que o servidor ligar ou reiniciar:

1. Copie o projeto para `/opt/portal_projetos`:
```bash
sudo mv ~/portal_projetos /opt/portal_projetos
cd /opt/portal_projetos
python3 -m venv venv
./venv/bin/pip install -r requirements.txt
```

2. Copie o arquivo de serviço e ative no sistema:
```bash
sudo cp portal.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable portal
sudo systemctl start portal
```

3. Para verificar o status do serviço:
```bash
sudo systemctl status portal
```

---

## 🛡️ 3. PONTO CRÍTICO: Liberar a Porta 8501 no Firewall da Nuvem

Por padrão, provedores de nuvem bloqueiam portas que não sejam SSH (22) e Web (80/443).  
Para conseguir acessar o portal do seu computador, você precisa liberar a porta **`8501 TCP`** no painel da sua nuvem:

| Provedor de Nuvem | Onde Configurar no Painel Web |
| :--- | :--- |
| **AWS (Amazon Web Services)** | EC2 > Instância > Aba **Security** > Clique no **Security Group** > **Edit Inbound Rules** > Adicionar regra: Tipo `Custom TCP`, Porta `8501`, Origem `0.0.0.0/0`. |
| **Google Cloud (GCP)** | VPC Network > **Firewall** > **Create Firewall Rule** > Targets: *All instances*, Source IPv4: `0.0.0.0/0`, TCP Port: `8501`. |
| **Microsoft Azure** | Virtual Machine > **Networking** > **Add inbound port rule** > Destination port: `8501`, Protocol: `TCP`, Action: `Allow`. |
| **Oracle Cloud (OCI)** | Compute > Instances > Clique na VCN / Subnet > **Security Lists** > **Add Ingress Rules** > Source CIDR: `0.0.0.0/0`, IP Protocol: `TCP`, Destination Port: `8501`. E no Linux: `sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 8501 -j ACCEPT` seguido de `sudo netfilter-persistent save`. |
| **DigitalOcean / Linode** | Networking > **Firewalls** > Inbound Rules > Adicionar `TCP` porta `8501` de `All IPv4`. |
| **Servidor com UFW (Ubuntu)** | No terminal do servidor: `sudo ufw allow 8501/tcp && sudo ufw reload` |

---

## 🌐 4. Como Acessar o Portal de Qualquer Computador

Abra qualquer navegador web (Chrome, Edge, Firefox, Safari) em qualquer computador ou smartphone e digite:

```text
http://<IP_PUBLICO_DO_SEU_SERVIDOR>:8501
```
*(Substitua `<IP_PUBLICO_DO_SEU_SERVIDOR>` pelo IP público fornecido pela sua nuvem, exemplo: `http://54.233.120.45:8501`).*

### 🔑 Credenciais Padrão:
- **Usuário**: `admin`
- **Senha**: `admin123`
*(Recomendamos alterar a senha ou criar novos gestores na aba de usuários após o primeiro acesso).*
