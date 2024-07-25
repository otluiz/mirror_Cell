# Mirror Cell

Este projeto contém scripts para espelhamento de dispositivos Android usando `scrcpy`.

## Scripts Disponíveis

- `connect_scrcpy.sh`: Script inicial para configurar e conectar um dispositivo Android.
- `connect_scrcpy_v2.sh`: Versão aprimorada do script com detecção automática de IP.
- `install_scrcpy.sh`: Script para instalar todas as dependências e compilar o scrcpy.

## Como Usar

### Requisitos

- `scrcpy`
- `adb`
- `nmap`
- Chave SSH configurada para GitHub

### Passos para Configuração

1. Clone o repositório:
   ```sh
   git clone git@github.com:otluiz/mirror_Cell.git
   cd mirror_Cell

## No seu computador
2. Configure as variáveis de ambiente para o Android SDK:
   export ANDROID_HOME=~/Android/Sdk
   export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

3. Dê permissão de execução aos scripts:
   chmod +x connect_scrcpy.sh
   chmod +x connect_scrcpy_v2.sh

4. Execute o script para conectar e espelhar:
   ./connect_scrcpy_v2.sh

Contribuindo

   Se você quiser contribuir com este projeto, sinta-se à vontade para abrir issues e pull requests no GitHub

Licença

   Este projeto é licenciado sob a Licença MIT.
