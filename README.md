Análise das Ferramentas journalctl e logrotate para Gerenciamento e Análise de Logs em um Sistema Debian
Descrição
Este projeto realiza uma análise detalhada das ferramentas journalctl e logrotate no contexto de gerenciamento e análise de logs em um sistema Linux Debian. Ele explora a visualização e filtragem de logs em tempo real com journalctl, bem como a configuração e rotação de logs com logrotate.

Cenários de Teste
1. Visualização e Filtragem de Logs com journalctl
Visualização dos logs do sistema em tempo real:
bash
Copiar código
journalctl -f
Filtragem de logs por unidade/serviço específico:
bash
Copiar código
journalctl -u nome-do-serviço
Exportação de logs para um arquivo:
bash
Copiar código
journalctl > arquivo.txt
2. Configuração e Rotação de Logs com logrotate
Configuração de rotação diária de logs para um arquivo de log de aplicação:
bash
Copiar código
/var/log/sua-aplicacao.log {
  daily
  rotate 7
  compress
  missingok
  notifempty
}
Execução manual da rotação de logs:
bash
Copiar código
logrotate -f /etc/logrotate.conf
Verificação do status dos logs após a rotação:
bash
Copiar código
pidstat -dl <tempo_de_experimento> <repetições>
Métricas de Desempenho
Troca de contexto: Utilizar o comando cat /proc/PID/status antes e após cada teste.
Tempo de execução: Medido com o comando time.
Leitura e Escrita no Disco: Monitorado com o comando pidstat -dl.
Como Executar
Clone o repositório:
bash
Copiar código
git clone <URL_DO_REPOSITÓRIO>
cd <PASTA_DO_REPOSITÓRIO>
Execute os cenários descritos acima.
Para medir o desempenho, utilize os comandos de monitoramento como pidstat e time.
Requisitos
Sistema operacional: Debian (ou distribuições derivadas)
Ferramentas: journalctl, logrotate, pidstat
Contribuições
Contribuições são bem-vindas. Sinta-se à vontade para abrir uma issue ou enviar um pull request.

Licença
Este projeto está licenciado sob a Licença MIT. Consulte o arquivo LICENSE para mais informações.
