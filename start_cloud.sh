#!/bin/bash
# ==============================================================================
# Script de Inicialização do Portal de Projetos em Nuvem / Servidor Linux
# ==============================================================================

echo "=========================================================="
echo "🚀 Iniciando Portal de Gestão de Projetos na Nuvem"
echo "=========================================================="

# Diretório atual do script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR"

# 1. Verificar se Python 3 está instalado
if ! command -v python3 &> /dev/null; then
    echo "❌ Erro: python3 não encontrado. Instale com: sudo apt update && sudo apt install -y python3 python3-pip python3-venv"
    exit 1
fi

# 2. Criar ambiente virtual se não existir
if [ ! -d "venv" ]; then
    echo "📦 Criando ambiente virtual Python (venv)..."
    python3 -m venv venv
fi

# 3. Ativar venv e instalar dependências
echo "📦 Instalando / atualizando dependências..."
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

# 4. Inicializar banco de dados e testes
python3 -c "import database; database.init_db()"

# 5. Iniciar o Streamlit ouvindo em todas as interfaces de rede (0.0.0.0) na porta 8501
echo "🌐 Iniciando servidor Streamlit na porta 8501..."
echo "Acesse no navegador: http://<IP_PUBLICO_DO_SEU_SERVIDOR>:8501"

# Executa em segundo plano com nohup ou diretamente
if [ "$1" == "--daemon" ] || [ "$1" == "-d" ]; then
    nohup streamlit run app.py --server.port=8501 --server.address=0.0.0.0 > portal.log 2>&1 &
    echo "✅ Servidor rodando em segundo plano (PID: $!). Logs salvos em portal.log"
    echo "Para parar o servidor: pkill -f 'streamlit run app.py'"
else
    streamlit run app.py --server.port=8501 --server.address=0.0.0.0
fi
