#!/bin/bash

# Cenário 1 - Visualização dos logs do sistema em tempo real
echo "Cenário 1: Visualização em tempo real"
time journalctl -f &
sleep 10
kill $!

# Cenário 2 - Filtragem de logs por unidade específica
echo "Cenário 2: Filtragem de logs por unidade"
time journalctl -u nome-do-serviço > filtro_servico.log

# Cenário 3 - Exportação de logs para um arquivo
echo "Cenário 3: Exportação de logs"
time journalctl > logs_exportados.txt

# Cenário 4 - Configuração de rotação diária de logs (simulação manual)
echo "Cenário 4: Execução manual de rotação de logs"
time logrotate -f /etc/logrotate.conf

# Cenário 5 - Verificação de troca de contexto e leitura/escrita no disco
echo "Métricas: Troca de contexto e I/O"
PID=$(pgrep nome-do-processo)
echo "Status antes da execução:"
cat /proc/$PID/status
pidstat -dl 1 10

echo "Status após execução:"
cat /proc/$PID/status
