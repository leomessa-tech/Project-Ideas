import os
import zipfile

def criar_pacote_nuvem():
    raiz = os.path.dirname(os.path.abspath(__file__))
    zip_nome = os.path.join(raiz, "portal_projetos_nuvem.zip")
    
    pastas_ignorar = {"__pycache__", "venv", ".venv", ".git", ".idea", ".vscode"}
    ext_ignorar = {".pyc", ".log", ".tmp"}
    arquivos_ignorar = {"portal_projetos_nuvem.zip"}

    print("Compactando arquivos para transferencia em nuvem...")
    with zipfile.ZipFile(zip_nome, "w", zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(raiz):
            dirs[:] = [d for d in dirs if d not in pastas_ignorar]
            for file in files:
                if file in arquivos_ignorar:
                    continue
                if any(file.endswith(ext) for ext in ext_ignorar):
                    continue
                caminho_completo = os.path.join(root, file)
                caminho_relativo = os.path.relpath(caminho_completo, raiz)
                zipf.write(caminho_completo, caminho_relativo)
                print(f"  + {caminho_relativo}")

    tamanho_mb = os.path.getsize(zip_nome) / (1024 * 1024)
    print(f"\n[SUCESSO] Pacote gerado com sucesso!")
    print(f"Arquivo: {zip_nome}")
    print(f"Tamanho: {tamanho_mb:.2f} MB")

if __name__ == "__main__":
    criar_pacote_nuvem()
