#!/bin/bash

# Função para detectar o IP do dispositivo Android
detectar_ip() {
  echo "Procurando dispositivos Android na rede..."
  IP_LIST=$(nmap -sn 192.168.0.0/24 | grep "Nmap scan report" | awk '{print $5}')
  
  if [ -z "$IP_LIST" ]; then
    echo "Nenhum dispositivo Android encontrado na rede."
    exit 1
  fi

  echo "Dispositivos encontrados:"
  PS3="Escolha o número do dispositivo que você deseja conectar: "
  select IP in $IP_LIST; do
    if [ -n "$IP" ]; then
      DEVICE_IP=$IP
      break
    else
      echo "Opção inválida. Tente novamente."
    fi
  done
}

# Verificar se o dispositivo está conectado via USB
DEVICE=$(adb devices | grep -w "device" | awk 'NR==1{print $1}')

if [ -z "$DEVICE" ]; then
  echo "Nenhum dispositivo conectado via USB. Por favor, conecte seu dispositivo Android via USB e tente novamente."
  exit 1
fi

echo "Dispositivo encontrado: $DEVICE"

# Ativar o modo TCP/IP
echo "Configurando o dispositivo para conexão TCP/IP..."
adb tcpip 5555

# Desconectar o dispositivo USB (você pode fazer isso manualmente)
echo "Desconecte o cabo USB do dispositivo agora."
sleep 5

# Detectar o IP do dispositivo Android
detectar_ip

# Conectar ao dispositivo via Wi-Fi
echo "Conectando ao dispositivo via Wi-Fi no IP $DEVICE_IP..."
adb connect $DEVICE_IP:5555

# Verificar se a conexão foi bem-sucedida
CONNECTED=$(adb devices | grep -w "$DEVICE_IP:5555")

if [ -z "$CONNECTED" ]; then
  echo "Falha na conexão ao dispositivo. Verifique o endereço IP e tente novamente."
  exit 1
fi

echo "Conexão bem-sucedida ao dispositivo: $DEVICE_IP"

# Iniciar o scrcpy com a tela sempre ativa
echo "Iniciando o scrcpy..."
scrcpy --stay-awake

echo "Conexão e espelhamento configurados com sucesso!"
