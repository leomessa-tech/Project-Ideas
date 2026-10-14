import hashlib
import os
import secrets
from typing import Tuple

def gerar_salt() -> str:
    return secrets.token_hex(16)

def hash_senha(senha: str, salt: str = None) -> Tuple[str, str]:
    if salt is None:
        salt = gerar_salt()
    # Utiliza SHA-256 com salt seguro
    h = hashlib.sha256()
    h.update((salt + senha).encode("utf-8"))
    return h.hexdigest(), salt

def verificar_senha(senha_fornecida: str, hash_salvo: str, salt: str) -> bool:
    h = hashlib.sha256()
    h.update((salt + senha_fornecida).encode("utf-8"))
    return h.hexdigest() == hash_salvo
