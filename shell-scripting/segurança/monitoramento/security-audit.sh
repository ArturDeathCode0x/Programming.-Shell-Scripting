#!/bin/bash

# ==========================================================
# LINUX SECURITY AUDIT
# Auditoria básica de segurança do sistema Linux
# Autor: Pedro
# ==========================================================

VERDE="\033[0;32m"
AMARELO="\033[1;33m"
AZUL="\033[0;34m"
RESET="\033[0m"

REPORT_DIR="reports"
REPORT_FILE="$REPORT_DIR/security-report.txt"

# Criar diretório de relatórios caso não exista
mkdir -p "$REPORT_DIR"

# Criar relatório
{
    echo "=================================================="
    echo "           LINUX SECURITY AUDIT"
    echo "=================================================="
    echo
    echo "Data:"
    date
    echo

    echo "===== USUÁRIO ATUAL ====="
    whoami
    echo

    echo "===== HOSTNAME ====="
    hostname
    echo

    echo "===== SISTEMA ====="
    uname -a
    echo

    echo "===== KERNEL ====="
    uname -r
    echo

    echo "===== ESPAÇO EM DISCO ====="
    df -h
    echo

    echo "===== MEMÓRIA ====="
    free -h
    echo

    echo "===== PROCESSOS ====="
    ps aux
    echo

    echo "===== USUÁRIOS ====="
    cut -d: -f1 /etc/passwd
    echo

    echo "===== GRUPOS DO USUÁRIO ====="
    groups
    echo

    echo "===== PORTAS EM ESCUTA ====="

    if command -v ss >/dev/null 2>&1; then
        ss -tuln
    else
        echo "Comando ss não encontrado."
    fi

    echo

    echo "===== ARQUIVOS EXECUTÁVEIS NO HOME ====="
    find "$HOME" -type f -perm /111 2>/dev/null

    echo
    echo "=================================================="
    echo "             AUDITORIA FINALIZADA"
    echo "=================================================="

} > "$REPORT_FILE"

echo
echo -e "${AZUL}========================================${RESET}"
echo -e "${AZUL}       LINUX SECURITY AUDIT             ${RESET}"
echo -e "${AZUL}========================================${RESET}"
echo

echo -e "${VERDE}[+] Auditoria concluída.${RESET}"
echo
echo "Relatório salvo em:"
echo
echo -e "${AMARELO}$REPORT_FILE${RESET}"
echo
echo "Para visualizar:"
echo
echo "cat $REPORT_FILE"
echo
