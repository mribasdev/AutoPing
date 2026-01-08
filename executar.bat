@echo off
chcp 65001 >nul
echo ================================================================================
echo                     PING AUTOMATICO - VERIFICADOR DE HOSTS
echo                               Versao 1.0.0
echo ================================================================================
echo.
echo               Criado pelo TIME DE CERTIFICACAO RESIDENCIAL
echo.
echo ================================================================================
echo.

REM Tenta encontrar o Python em varios locais comuns
set PYTHON_CMD=

REM Tenta python direto
python --version >nul 2>&1
if %errorlevel% equ 0 (
    set PYTHON_CMD=python
    goto :found
)

REM Tenta py (launcher do Windows)
py --version >nul 2>&1
if %errorlevel% equ 0 (
    set PYTHON_CMD=py
    goto :found
)

REM Tenta python3
python3 --version >nul 2>&1
if %errorlevel% equ 0 (
    set PYTHON_CMD=python3
    goto :found
)

REM Tenta caminhos comuns do Python
if exist "C:\Python312\python.exe" (
    set PYTHON_CMD=C:\Python312\python.exe
    goto :found
)
if exist "C:\Python311\python.exe" (
    set PYTHON_CMD=C:\Python311\python.exe
    goto :found
)
if exist "C:\Python310\python.exe" (
    set PYTHON_CMD=C:\Python310\python.exe
    goto :found
)
if exist "%LOCALAPPDATA%\Programs\Python\Python312\python.exe" (
    set PYTHON_CMD=%LOCALAPPDATA%\Programs\Python\Python312\python.exe
    goto :found
)
if exist "%LOCALAPPDATA%\Programs\Python\Python311\python.exe" (
    set PYTHON_CMD=%LOCALAPPDATA%\Programs\Python\Python311\python.exe
    goto :found
)
if exist "%LOCALAPPDATA%\Programs\Python\Python310\python.exe" (
    set PYTHON_CMD=%LOCALAPPDATA%\Programs\Python\Python310\python.exe
    goto :found
)

REM Python nao encontrado
echo [ERRO] Python nao encontrado!
echo.
echo Por favor, instale o Python:
echo https://www.python.org/downloads/
echo.
echo OU informe o caminho do Python:
echo.
set /p PYTHON_CMD="Digite o caminho completo do python.exe: "
if not exist "%PYTHON_CMD%" (
    echo Caminho invalido!
    pause
    exit /b 1
)

:found
echo [OK] Python encontrado: %PYTHON_CMD%
echo.

REM Instala dependencias - primeiro tenta OFFLINE da pasta pacotes
echo Instalando dependencias...

if exist "pacotes\openpyxl*.whl" (
    echo [*] Instalando pacotes OFFLINE...
    "%PYTHON_CMD%" -m pip install --no-index --find-links=pacotes openpyxl --user --quiet 2>nul
    if %errorlevel% equ 0 (
        echo [OK] Dependencias instaladas offline!
        goto :run
    )
)

REM Se offline falhou, tenta online
echo [*] Tentando instalacao online...
"%PYTHON_CMD%" -m pip install openpyxl --user --quiet 2>nul
if %errorlevel% equ 0 (
    echo [OK] Dependencias instaladas!
    goto :run
)

REM Tenta com timeout maior
echo [*] Tentando com timeout maior...
"%PYTHON_CMD%" -m pip install openpyxl --user --timeout 60 2>nul
if %errorlevel% neq 0 (
    echo.
    echo [ERRO] Nao foi possivel instalar as dependencias.
    echo.
    echo Opcoes:
    echo 1. Configure o proxy: python -m pip install openpyxl --proxy http://proxy:porta
    echo 2. Copie a pasta 'pacotes' junto com os outros arquivos
    echo.
    pause
    exit /b 1
)

:run
echo.

REM Executa o script
echo Iniciando verificacao de hosts...
echo.
"%PYTHON_CMD%" ping_automatico.py

echo.
echo ================================================================================
echo                Desenvolvido pelo Time de Certificacao Residencial
echo ================================================================================
echo.
echo Pressione qualquer tecla para sair...
pause >nul
