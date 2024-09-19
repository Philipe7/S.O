#!/bin/bash

# Diretório para salvar os resultados
output_dir="resultados_experimentos"
mkdir -p $output_dir

# Cenário 1 - Visualização dos logs do sistema em tempo real
echo "Cenário 1: Visualização em tempo real"
output_file_cenario1="$output_dir/cenario1_visualizacao_tempo_real.txt"
start_time=$(date +%s)
journalctl -f &
sleep 10
kill $!
end_time=$(date +%s)
exec_time=$((end_time - start_time))
echo "Tempo de execução: $exec_time segundos" > $output_file_cenario1

# Cenário 2 - Filtragem de logs por unidade específica
echo "Cenário 2: Filtragem de logs por unidade"
output_file_cenario2="$output_dir/cenario2_filtragem_logs.txt"
start_time=$(date +%s)
journalctl -u nome-do-serviço > filtro_servico.log
end_time=$(date +%s)
exec_time=$((end_time - start_time))
echo "Tempo de execução: $exec_time segundos" > $output_file_cenario2

# Cenário 3 - Exportação de logs para um arquivo
echo "Cenário 3: Exportação de logs"
output_file_cenario3="$output_dir/cenario3_exportacao_logs.txt"
start_time=$(date +%s)
journalctl > logs_exportados.txt
end_time=$(date +%s)
exec_time=$((end_time - start_time))
echo "Tempo de execução: $exec_time segundos" > $output_file_cenario3

# Cenário 4 - Configuração de rotação de logs
echo "Cenário 4: Execução manual de rotação de logs"
output_file_cenario4="$output_dir/cenario4_rotacao_logs.txt"
start_time=$(date +%s)
logrotate -f /etc/logrotate.conf
end_time=$(date +%s)
exec_time=$((end_time - start_time))
echo "Tempo de execução: $exec_time segundos" > $output_file_cenario4

# Cenário 5 - Métricas: Troca de contexto e I/O
echo "Métricas: Troca de contexto e I/O"
output_file_cenario5="$output_dir/cenario5_metricas_io.txt"
PID=$(pgrep nome-do-processo) # Ajustar com o nome do processo real

echo "Status antes da execução:" > $output_file_cenario5
cat /proc/$PID/status | grep voluntary_ctxt_switches >> $output_file_cenario5
start_time=$(date +%s)
pidstat -dl 1 10 >> $output_file_cenario5
end_time=$(date +%s)
exec_time=$((end_time - start_time))
echo "Tempo de execução: $exec_time segundos" >> $output_file_cenario5

echo "Status após execução:" >> $output_file_cenario5
cat /proc/$PID/status | grep voluntary_ctxt_switches >> $output_file_cenario5

echo "Resultados dos cenários salvos em $output_dir"
