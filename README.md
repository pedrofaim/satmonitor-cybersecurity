# Escaneamento básico de portas TCP
nmap -sT -p- <IP_DO_GATEWAY>

# Escaneamento com detecção de versão de serviços
nmap -sV -p 22,80,443,8080 <IP_DO_GATEWAY>

# Escaneamento de portas UDP comuns
nmap -sU --top-ports 20 <IP_DO_GATEWAY>

# Escaneamento completo com saída detalhada (XML para análise)
nmap -A -oX scan_resultado.xml <IP_DO_GATEWAY>
