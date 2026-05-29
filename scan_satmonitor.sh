#!/bin/bash
# =============================================================================
# SatMonitor - Security Scan
# FIAP - Global Solution
# Script: scan_satmonitor.sh
# Descrição: Automação de scan de segurança com nmap.
# Autor: Equipe SatMonitor
# Versão: 1.0
# Data: $(date +%Y-%m-%d)
# =============================================================================

# --- Configurações iniciais ---

# Nome do projeto 
PROJETO="SatMonitor - Security Scan"

# Diretório onde os scans serão salvos
DIR_SCANS="scans"

# Verifica se o diretório 'scans' existe, se não, cria
if [ ! -d "$DIR_SCANS" ]; then
    echo "[INFORMAÇÃO] Diretório '$DIR_SCANS' não encontrado. Criando..."
    mkdir -p "$DIR_SCANS"
    echo "[OK] Diretório criado: $DIR_SCANS"
fi

# --- Definição do alvo ---

# Se o primeiro argumento ($1) foi passado, usa ele como alvo
# Caso contrário, usa 'localhost' como padrão
ALVO="${1:-localhost}"

# Validação simples: o argumento não pode estar vazio (já tratado pelo padrão, mas segurança extra)
if [ -z "$ALVO" ]; then
    echo "[ERRO] Nenhum alvo fornecido. Encerrando."
    exit 1
fi

# --- Timestamp para nome do arquivo ---

# Formato: YYYYMMDD_HHMMSS
DATA_ATUAL=$(date +"%Y%m%d_%H%M%S")

# Nome do arquivo de saída
ARQUIVO_SCAN="$DIR_SCANS/scan_$DATA_ATUAL.txt"

# --- Cabeçalho do scan ---

# Exibe informações iniciais
echo "=============================================="
echo "  $PROJETO"
echo "  FIAP - Global Solution"
echo "=============================================="
echo ""
echo "[INÍCIO] Scan de segurança iniciado em: $(date '+%Y-%m-%d %H:%M:%S')"
echo "[ALVO]  $ALVO"
echo "[ARQUIVO] $ARQUIVO_SCAN"
echo ""

# --- Execução do scan ---

# Executa nmap com opções:
#   -sV : detecção de versão dos serviços
#   -sC : executa scripts padrão (safe)
#   -oN : saída normal (formato texto) para o arquivo definido
#   --open : mostra apenas portas abertas (opcional, melhora clareza)
# Redireciona erros (stderr) para o terminal também, mas mantendo no arquivo via tee
echo "[EXECUTANDO] nmap -sV -sC --open $ALVO"
nmap -sV -sC --open "$ALVO" -oN "$ARQUIVO_SCAN"

# Verifica se o nmap foi bem-sucedido
if [ $? -eq 0 ]; then
    echo ""
    echo "[FIM] Scan concluído com sucesso em: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "[RESULTADO] Salvo em: $ARQUIVO_SCAN"
else
    echo ""
    echo "[AVISO] Scan pode ter sido interrompido ou apresentou erros."
    echo "[ARQUIVO] Possível resultado parcial em: $ARQUIVO_SCAN"
fi

echo "=============================================="
exit 0