# 🐧 Linux System Manager

<p align="center">
  <img src="assets/banner.png" alt="Linux System Manager Banner" width="100%">
</p>

![Linux](https://img.shields.io/badge/OS-Linux-FCC624?style=flat&logo=linux&logoColor=black)
![Shell](https://img.shields.io/badge/Shell-Bash-4EAA25?style=flat&logo=gnu-bash&logoColor=white)
![Security](https://img.shields.io/badge/Focus-Linux%20Security-red)
![Status](https://img.shields.io/badge/Status-Em%20construção-yellow)

Projeto prático desenvolvido para estudar e demonstrar conhecimentos
em administração Linux, Bash, processos, arquivos, permissões e
conceitos básicos de segurança.

---

## 🎯 Objetivo

O projeto tem como objetivo transformar conhecimentos de comandos
Linux em ferramentas práticas.

O projeto possui duas ferramentas principais:

- `linux-manager.sh`
- `security-audit.sh`

---

# 🛠️ Linux Manager

<p align="center">
  <img src="assets/linux-manager-screenshot.png" alt="Menu do Linux Manager" width="80%">
</p>

O Linux Manager apresenta um menu interativo para executar tarefas
básicas de administração do sistema.

### Funções

- Informações do sistema
- Listagem de arquivos
- Criação de diretórios
- Criação de arquivos
- Busca de arquivos
- Busca de textos
- Visualização de processos
- Encerramento de processos
- Verificação de permissões
- Informações do usuário
- Informações sobre gerenciamento de pacotes

---

# 🔐 Security Audit

<p align="center">
  <img src="assets/security-audit-screenshot.png" alt="Execução do Security Audit" width="80%">
</p>

O Security Audit realiza uma auditoria básica do sistema Linux.

### Informações analisadas

- Usuário atual
- Hostname
- Kernel
- Sistema operacional
- Uso do disco
- Memória RAM
- Processos
- Usuários
- Grupos
- Portas em escuta
- Arquivos executáveis

O resultado é salvo automaticamente na pasta:

```text
reports/
```
