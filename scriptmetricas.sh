#!/bin/bash

# Arquivo para salvar os resultados
output_file="resultados_experimentos.txt"
echo "Resultados dos experimentos" > $output_file
echo "" >> $output_file

# Cenário 1 - Visualização dos logs do sistema em tempo real
echo "Cenário 1: Visualização em tempo real" | tee -a $output_file
start_time=$(date +%s)
journalctl -f &
sleep 10
kill $!
end_time=$(date +%s)
exec_time=$((end_time - start_time))
echo "Tempo de execução: $exec_time segundos" | tee -a $output_file
echo "" >> $output_file

# Cenário 2 - Filtragem de logs por unidade específica
echo "Cenário 2: Filtragem de logs por unidade" | tee -a $output_file
start_time=$(date +%s)
time journalctl -u nome-do-serviço > filtro_servico.log
end_time=$(date +%s)
exec_time=$((end_time - start_time))
echo "Tempo de execução: $exec_time segundos" | tee -a $output_file
echo "" >> $output_file

# Cenário 3 - Exportação de logs para um arquivo
echo "Cenário 3: Exportação de logs" | tee -a $output_file
start_time=$(date +%s)
journalctl > logs_exportados.txt
end_time=$(date +%s)
exec_time=$((end_time - start_time))
echo "Tempo de execução: $exec_time segundos" | tee -a $output_file
echo "" >> $output_file

# Cenário 4 - Configuração de rotação de logs
echo "Cenário 4: Execução manual de rotação de logs" | tee -a $output_file
start_time=$(date +%s)
logrotate -f /etc/logrotate.conf
end_time=$(date +%s)
exec_time=$((end_time - start_time))
echo "Tempo de execução: $exec_time segundos" | tee -a $output_file
echo "" >> $output_file

# Cenário 5 - Métricas: Troca de contexto e I/O
echo "Métricas: Troca de contexto e I/O" | tee -a $output_file
PID=$(pgrep nome-do-processo) # Ajustar com o nome do processo real

echo "Status antes da execução:" >> $output_file
cat /proc/$PID/status | grep voluntary_ctxt_switches >> $output_file
start_time=$(date +%s)
pidstat -dl 1 10 >> $output_file
end_time=$(date +%s)
exec_time=$((end_time - start_time))
echo "Tempo de execução: $exec_time segundos" | tee -a $output_file

echo "Status após execução:" >> $output_file
cat /proc/$PID/status | grep voluntary_ctxt_switches >> $output_file
echo "" >> $output_file

echo "Resultados salvos em $output_file"
