================================================================================
                    PING AUTOMATICO - VERIFICADOR DE HOSTS
                              Versao 1.0.0
================================================================================

               Criado pelo TIME DE CERTIFICACAO RESIDENCIAL
                              Janeiro/2026

================================================================================

DESCRICAO:
----------
Este script faz ping em todos os IPs e dominios do arquivo "hosts" e gera uma
planilha Excel com os resultados, mostrando quais estao online (verde) e 
offline (vermelho), organizados por categoria.

Desenvolvido para facilitar a verificacao em massa de conectividade de 
servidores e servicos em ambientes corporativos.


AUTOR:
------
Time de Certificacao Residencial


ARQUIVOS:
---------
- ping_automatico.py   : Script principal
- hosts                : Lista de IPs e dominios para verificar
- requirements.txt     : Dependencias do Python
- executar.bat         : Executa o script automaticamente (Windows)
- pacotes/             : Pacotes para instalacao offline


COMO USAR:
----------

OPCAO 1 - AUTOMATICA (Windows):
   Basta dar duplo clique no arquivo "executar.bat"

OPCAO 2 - MANUAL:
   1. Abra o Prompt de Comando (cmd) ou PowerShell
   2. Navegue ate a pasta do script:
      cd "C:\caminho\para\pasta"
   3. Instale as dependencias:
      pip install -r requirements.txt
   4. Execute o script:
      python ping_automatico.py


PRE-REQUISITOS:
---------------
1. Python 3.x instalado (https://www.python.org/downloads/)
   - Durante a instalacao, marque "Add Python to PATH"

2. Conexao de rede com os hosts que serao verificados


ARQUIVOS GERADOS:
-----------------
Apos a execucao, serao criados:

- resultado_ping_YYYYMMDD_HHMMSS.xlsx : Planilha com resultados
  - Aba "Resultado Ping": Lista todos os hosts com status
  - Aba "Resumo por Categoria": Estatisticas por grupo

- ping_log_YYYYMMDD_HHMMSS.txt : Log completo da execucao


PERSONALIZACAO:
---------------
Para adicionar/remover hosts, edite o arquivo "hosts":

# NOME DA CATEGORIA
10.10.10.10 dominio.exemplo.com
10.10.10.11 outro-dominio.com

- Linhas que comecam com # sao categorias/comentarios
- Formato: IP [TAB ou ESPACO] dominio


INSTALACAO OFFLINE (VDI/Ambientes sem internet):
------------------------------------------------
1. Copie TODA a pasta incluindo a subpasta "pacotes"
2. O script detecta automaticamente os pacotes offline
3. Nao precisa de conexao com a internet


DUVIDAS:
--------
- Certifique-se de que o Python esta instalado corretamente
- Verifique se tem permissao de rede para fazer ping nos hosts
- Alguns hosts podem bloquear ICMP (ping) por firewall


================================================================================
                Desenvolvido pelo Time de Certificacao Residencial
                                  2026
================================================================================
