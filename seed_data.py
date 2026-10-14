from datetime import date, timedelta
import database

def popular_dados_exemplo(forcar: bool = False):
    database.init_db()
    projetos_existentes = database.listar_projetos()
    
    if projetos_existentes and not forcar:
        return
        
    hoje = date.today()
    
    exemplos = [
        {
            "nome": "Implantação do Sistema ERP Integrado",
            "data_inicio": (hoje - timedelta(days=60)).strftime("%Y-%m-%d"),
            "data_termino": (hoje + timedelta(days=5)).strftime("%Y-%m-%d"),
            "data_aviso": (hoje - timedelta(days=2)).strftime("%Y-%m-%d"), # Já atingiu aviso -> Atenção / Chegando ao fim!
            "responsavel": "Mariana Souza",
            "email_responsavel": "mariana.souza@empresa.com.br",
            "prioridade": "Crítica",
            "status_manual": "Em Homologação",
            "observacoes": "Módulos financeiro e fiscal em fase final de testes e homologação pelos usuários-chave.",
            "concluido": 0
        },
        {
            "nome": "Reformulação do Portal do Cliente",
            "data_inicio": (hoje - timedelta(days=30)).strftime("%Y-%m-%d"),
            "data_termino": (hoje + timedelta(days=45)).strftime("%Y-%m-%d"),
            "data_aviso": (hoje + timedelta(days=35)).strftime("%Y-%m-%d"), # Ainda no prazo
            "responsavel": "Carlos Eduardo",
            "email_responsavel": "carlos.eduardo@empresa.com.br",
            "prioridade": "Alta",
            "status_manual": "Em Execução",
            "observacoes": "Design system concluído, integração de autenticação OAuth2 iniciada.",
            "concluido": 0
        },
        {
            "nome": "Migração de Servidores para Nuvem AWS",
            "data_inicio": (hoje - timedelta(days=90)).strftime("%Y-%m-%d"),
            "data_termino": (hoje - timedelta(days=3)).strftime("%Y-%m-%d"), # Ultrapassou término -> Atrasado!
            "data_aviso": (hoje - timedelta(days=15)).strftime("%Y-%m-%d"),
            "responsavel": "Rafael Albuquerque",
            "email_responsavel": "rafael.albuquerque@empresa.com.br",
            "prioridade": "Crítica",
            "status_manual": "Em Pausa",
            "observacoes": "Pendente liberação de portas de firewall e rota DirectConnect junto à operadora.",
            "concluido": 0
        },
        {
            "nome": "Auditoria de Segurança da Informação e LGPD",
            "data_inicio": (hoje - timedelta(days=40)).strftime("%Y-%m-%d"),
            "data_termino": (hoje + timedelta(days=2)).strftime("%Y-%m-%d"),
            "data_aviso": (hoje - timedelta(days=5)).strftime("%Y-%m-%d"),
            "responsavel": "Beatriz Mendes",
            "email_responsavel": "beatriz.mendes@empresa.com.br",
            "prioridade": "Média",
            "status_manual": "Concluído",
            "observacoes": "Relatório final entregue e assinado pela diretoria de compliance.",
            "concluido": 1 # Concluído
        }
    ]
    
    for ex in exemplos:
        pid = database.criar_projeto(
            nome=ex["nome"],
            data_inicio=ex["data_inicio"],
            data_termino=ex["data_termino"],
            data_aviso=ex["data_aviso"],
            responsavel=ex["responsavel"],
            email_responsavel=ex["email_responsavel"],
            observacoes=ex["observacoes"],
            prioridade=ex["prioridade"],
            status_manual=ex["status_manual"]
        )
        if ex["concluido"] == 1:
            database.alternar_conclusao(pid, 1)
            
    print(f"Seed concluído com {len(exemplos)} projetos de exemplo.")

if __name__ == "__main__":
    popular_dados_exemplo(forcar=True)
