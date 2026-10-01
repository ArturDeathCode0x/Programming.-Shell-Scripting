#!/bin/bash

# ==========================================================
# LINUX SYSTEM MANAGER
# Projeto prático de comandos Linux
# Autor: Pedro
# ==========================================================

# ----------------------------------------------------------
# CORES
# ----------------------------------------------------------

VERDE="\033[0;32m"
VERMELHO="\033[0;31m"
AMARELO="\033[1;33m"
AZUL="\033[0;34m"
RESET="\033[0m"

# ----------------------------------------------------------
# FUNÇÃO: PAUSAR
# ----------------------------------------------------------

pausar() {
    echo
    read -p "Pressione ENTER para continuar..."
}

# ----------------------------------------------------------
# FUNÇÃO: MOSTRAR MENU
# ----------------------------------------------------------

mostrar_menu() {

    clear

    echo -e "${AZUL}"
    echo "╔════════════════════════════════════════╗"
    echo "║        LINUX SYSTEM MANAGER            ║"
    echo "╠════════════════════════════════════════╣"
    echo "║ 1 - Informações do sistema             ║"
    echo "║ 2 - Listar arquivos                    ║"
    echo "║ 3 - Criar diretório                    ║"
    echo "║ 4 - Criar arquivo                      ║"
    echo "║ 5 - Procurar arquivo                   ║"
    echo "║ 6 - Procurar texto                     ║"
    echo "║ 7 - Ver processos                      ║"
    echo "║ 8 - Encerrar processo                  ║"
    echo "║ 9 - Ver permissões                     ║"
    echo "║ 10 - Ver usuário atual                 ║"
    echo "║ 11 - Ver pacotes instalados            ║"
    echo "║ 0 - Sair                               ║"
    echo "╚════════════════════════════════════════╝"
    echo -e "${RESET}"

}

# ----------------------------------------------------------
# FUNÇÃO: INFORMAÇÕES DO SISTEMA
# ----------------------------------------------------------

informacoes_sistema() {

    clear

    echo "===== INFORMAÇÕES DO SISTEMA ====="
    echo

    echo "Usuário atual:"
    whoami

    echo
    echo "Hostname:"
    hostname

    echo
    echo "Sistema:"
    uname -a

    echo
    echo "Uso do disco:"
    df -h

    echo
    echo "Memória:"
    free -h

    pausar
}

# ----------------------------------------------------------
# FUNÇÃO: LISTAR ARQUIVOS
# ----------------------------------------------------------

listar_arquivos() {

    clear

    echo "===== ARQUIVOS ====="
    echo

    ls -lah

    pausar
}

# ----------------------------------------------------------
# FUNÇÃO: CRIAR DIRETÓRIO
# ----------------------------------------------------------

criar_diretorio() {

    clear

    echo "===== CRIAR DIRETÓRIO ====="
    echo

    read -p "Digite o nome da pasta: " pasta

    if [ -z "$pasta" ]; then

        echo -e "${VERMELHO}Nome inválido.${RESET}"

    else

        mkdir "$pasta"

        if [ $? -eq 0 ]; then
            echo -e "${VERDE}Pasta criada com sucesso!${RESET}"
        else
            echo -e "${VERMELHO}Não foi possível criar a pasta.${RESET}"
        fi

    fi

    pausar
}

# ----------------------------------------------------------
# FUNÇÃO: CRIAR ARQUIVO
# ----------------------------------------------------------

criar_arquivo() {

    clear

    echo "===== CRIAR ARQUIVO ====="
    echo

    read -p "Digite o nome do arquivo: " arquivo

    if [ -z "$arquivo" ]; then

        echo -e "${VERMELHO}Nome inválido.${RESET}"

    else

        touch "$arquivo"

        if [ $? -eq 0 ]; then
            echo -e "${VERDE}Arquivo criado com sucesso!${RESET}"
        else
            echo -e "${VERMELHO}Não foi possível criar o arquivo.${RESET}"
        fi

    fi

    pausar
}

# ----------------------------------------------------------
# FUNÇÃO: PROCURAR ARQUIVO
# ----------------------------------------------------------

procurar_arquivo() {

    clear

    echo "===== PROCURAR ARQUIVO ====="
    echo

    read -p "Digite o nome do arquivo: " arquivo

    echo
    echo "Resultado:"
    echo

    find . -name "$arquivo" 2>/dev/null

    pausar
}

# ----------------------------------------------------------
# FUNÇÃO: PROCURAR TEXTO
# ----------------------------------------------------------

procurar_texto() {

    clear

    echo "===== PROCURAR TEXTO ====="
    echo

    read -p "Digite o texto que deseja procurar: " texto
    read -p "Digite o arquivo: " arquivo

    echo
    echo "Resultado:"
    echo

    grep -n "$texto" "$arquivo"

    pausar
}

# ----------------------------------------------------------
# FUNÇÃO: VER PROCESSOS
# ----------------------------------------------------------

ver_processos() {

    clear

    echo "===== PROCESSOS ====="
    echo

    ps aux

    pausar
}

# ----------------------------------------------------------
# FUNÇÃO: ENCERRAR PROCESSO
# ----------------------------------------------------------

encerrar_processo() {

    clear

    echo "===== ENCERRAR PROCESSO ====="
    echo

    ps aux | head -15

    echo
    read -p "Digite o PID do processo: " pid

    if [ -z "$pid" ]; then

        echo -e "${VERMELHO}PID inválido.${RESET}"

    else

        kill "$pid"

        if [ $? -eq 0 ]; then
            echo -e "${VERDE}Sinal enviado ao processo.${RESET}"
        else
            echo -e "${VERMELHO}Não foi possível encerrar o processo.${RESET}"
        fi

    fi

    pausar
}

# ----------------------------------------------------------
# FUNÇÃO: VER PERMISSÕES
# ----------------------------------------------------------

ver_permissoes() {

    clear

    echo "===== PERMISSÕES ====="
    echo

    read -p "Digite o arquivo ou diretório: " caminho

    echo
    ls -l "$caminho"

    pausar
}

# ----------------------------------------------------------
# FUNÇÃO: USUÁRIO
# ----------------------------------------------------------

ver_usuario() {

    clear

    echo "===== USUÁRIO ====="
    echo

    echo "Usuário atual:"
    whoami

    echo
    echo "Informações do usuário:"
    id

    pausar
}

# ----------------------------------------------------------
# FUNÇÃO: PACOTES
# ----------------------------------------------------------

ver_pacotes() {

    clear

    echo "===== GERENCIAMENTO DE PACOTES ====="
    echo

    echo "Para atualizar a lista de pacotes:"
    echo
    echo "sudo apt update"

    echo
    echo "Para atualizar os programas:"
    echo
    echo "sudo apt upgrade"

    echo
    echo "Para instalar um programa:"
    echo
    echo "sudo apt install <pacote>"

    pausar
}

# ==========================================================
# PROGRAMA PRINCIPAL
# ==========================================================

while true
do

    mostrar_menu

    read -p "Escolha uma opção: " opcao

    case $opcao in

        1)
            informacoes_sistema
            ;;

        2)
            listar_arquivos
            ;;

        3)
            criar_diretorio
            ;;

        4)
            criar_arquivo
            ;;

        5)
            procurar_arquivo
            ;;

        6)
            procurar_texto
            ;;

        7)
            ver_processos
            ;;

        8)
            encerrar_processo
            ;;

        9)
            ver_permissoes
            ;;

        10)
            ver_usuario
            ;;

        11)
            ver_pacotes
            ;;

        0)
            clear
            echo -e "${VERDE}Sistema encerrado. Até mais!${RESET}"
            exit 0
            ;;

        *)
            echo -e "${VERMELHO}Opção inválida!${RESET}"
            sleep 2
            ;;

    esac

done
