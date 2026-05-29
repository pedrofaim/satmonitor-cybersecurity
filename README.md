# SatMonitor - Módulo de Cibersegurança

![Status](https://img.shields.io/badge/status-concluído-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)
![FIAP](https://img.shields.io/badge/FIAP-Global%20Solution-red)
![Semestre](https://img.shields.io/badge/semestre-1º%20%2F%202026-orange)

## Descrição do Projeto

O **SatMonitor** é um sistema de monitoramento ambiental baseado em uma constelação de satélites IoT (Internet das Coisas), desenvolvido no contexto da **Global Solution** da FIAP – Engenharia de Software, 1º semestre de 2026. O projeto integra conceitos de economia espacial e sustentabilidade, propondo uma solução de baixo custo para coleta de dados ambientais em regiões remotas, com foco na segurança cibernética de toda a infraestrutura.

Este repositório contém exclusivamente o **Módulo de Cibersegurança** do SatMonitor, responsável por identificar, analisar e mitigar riscos nos principais ativos do sistema, utilizando metodologias consolidadas e ferramentas práticas de segurança.

---

## Entregas do Módulo de Cibersegurança

1. **Identificação de Riscos (STRIDE)**  
   Aplicação da metodologia STRIDE (Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege) sobre cinco ativos críticos:
   - Satélite IoT
   - Gateway de comunicação
   - Banco de dados
   - API REST
   - Estação de controle

2. **Implementação de Seis Controles de Segurança**  
   - **TLS/SSL** – Criptografia de comunicação entre gateways e servidores  
   - **Firewall** – Regras iptables/UFW para segmentação de rede  
   - **IAM** – Gerenciamento de identidades e acessos  
   - **Backup Automatizado** – Rotinas de backup para banco de dados e configurações  
   - **Hardening de Servidores** – Remoção de serviços desnecessários, atualizações, senhas fortes  
   - **Monitoramento de Logs** – Auditoria via auditd/syslog com alertas em tempo real

3. **Teste de Segurança (Evidência Prática)**  
   Varredura de portas com **Nmap** na estação de controle do SatMonitor (localhost), evidenciando portas abertas, serviços expostos e correlação com os riscos mapeados no STRIDE.

---

## Tecnologias Utilizadas

- **Nmap** – Escaneamento e descoberta de serviços na rede
- **STRIDE** – Modelagem de ameaças estruturada
- **Python 3** – Scripts de automação de backups e monitoramento
- **Bash** – Scripts de hardening e configuração de firewall (iptables/UFW)
- **Linux Ubuntu Server** – Ambiente de implantação dos controles

---

## Como Executar o Scan Nmap
```bash
# Clone o repositório
git clone https://github.com/pedrofaim/satmonitor-cybersecurity.git
cd satmonitor-cybersecurity

# Execute o scan automatizado (alvo padrão: localhost)
./scripts/scan_satmonitor.sh

# Ou especifique um alvo
./scripts/scan_satmonitor.sh 192.168.1.100
