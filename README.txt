# 🚀 Ping Automático – Verificador de Hosts

**Versão:** 1.0.0
**Data:** Janeiro/2026

Desenvolvido pelo **Time de Certificação Residencial**

---

## 📌 Visão Geral

O **Ping Automático – Verificador de Hosts** é um script em Python desenvolvido para realizar testes de conectividade (ICMP/Ping) em massa, a partir de uma lista de IPs e domínios definida pelo usuário.

Ao final da execução, o script gera uma **planilha Excel detalhada**, com indicadores visuais de status (**online** e **offline**), além de um **log completo da execução**, organizando os resultados por categoria.

Este projeto foi criado para **facilitar a validação de conectividade de servidores e serviços em ambientes corporativos**.

---

## ✨ Funcionalidades

* Verificação automática de conectividade (ping) de múltiplos hosts
* Suporte a IPs e domínios
* Organização por categorias
* Geração de relatório em Excel:

  * Hosts online destacados em **verde**
  * Hosts offline destacados em **vermelho**
* Geração de log detalhado da execução
* Compatível com **instalação offline** (VDI ou ambientes restritos)
* Execução simplificada via arquivo `.bat` no Windows

---

## 📁 Estrutura do Projeto

```text
.
├── ping_automatico.py   # Script principal
├── hosts                # Lista de IPs e domínios para verificação
├── requirements.txt     # Dependências Python
├── executar.bat         # Execução automática (Windows)
├── pacotes/             # Pacotes para instalação offline
```

---

## ▶️ Como Utilizar

### Opção 1 – Execução Automática (Windows)

Basta dar **duplo clique** no arquivo:

```text
executar.bat
```

---

### Opção 2 – Execução Manual

1. Abra o **Prompt de Comando (cmd)** ou **PowerShell**
2. Navegue até o diretório do projeto:

   ```bash
   cd "C:\caminho\para\pasta"
   ```
3. Instale as dependências:

   ```bash
   pip install -r requirements.txt
   ```
4. Execute o script:

   ```bash
   python ping_automatico.py
   ```

---

## ✅ Pré-requisitos

* **Python 3.x** instalado
  👉 [https://www.python.org/downloads/](https://www.python.org/downloads/)

  > ⚠️ Durante a instalação, marque a opção **“Add Python to PATH”**

* Conectividade de rede com os hosts que serão testados

---

## 📊 Arquivos Gerados

Após a execução, os seguintes arquivos serão criados automaticamente:

### 📄 Relatório Excel

* **resultado_ping_YYYYMMDD_HHMMSS.xlsx**

  * Aba **Resultado Ping**: lista completa de hosts e status
  * Aba **Resumo por Categoria**: estatísticas agrupadas

### 🧾 Log de Execução

* **ping_log_YYYYMMDD_HHMMSS.txt**

  * Registro detalhado de toda a execução

---

## ⚙️ Personalização

Para adicionar ou remover hosts, edite o arquivo `hosts`.

### Exemplo:

```text
# SERVIDORES INTERNOS
10.10.10.10 dominio.exemplo.com
10.10.10.11 outro-dominio.com
```

### Regras do arquivo `hosts`:

* Linhas iniciadas com `#` representam **categorias ou comentários**
* Formato:

  ```text
  IP [TAB ou ESPAÇO] domínio
  ```

---

## 💾 Instalação Offline (VDI / Ambientes sem Internet)

1. Copie **toda a pasta do projeto**, incluindo a subpasta `pacotes/`
2. O script detecta automaticamente os pacotes offline
3. **Não é necessária conexão com a internet**

---

## ❓ Dúvidas e Observações

* Verifique se o Python está corretamente instalado e acessível pelo PATH
* Confirme se o usuário possui permissão de rede para realizar ping
* Alguns hosts podem bloquear ICMP por regras de firewall

---

## 👥 Autor

**Time de Certificação Residencial**
© 2026

---

📌 *Projeto desenvolvido para uso interno e automação de testes de conectividade.*
