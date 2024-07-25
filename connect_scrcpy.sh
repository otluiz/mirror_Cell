#!/bin/bash

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

# Pedir o endereço IP do dispositivo
read -p "Digite o endereço IP do dispositivo: " DEVICE_IP

# Conectar ao dispositivo via Wi-Fi
echo "Conectando ao dispositivo via Wi-Fi..."
adb connect $DEVICE_IP:5555

# Verificar se a conexão foi bem-sucedida
CONNECTED=$(adb devices | grep -w "$DEVICE_IP:5555")

if [ -z "$CONNECTED" ]; then
  echo "Falha na conexão ao dispositivo. Verifique o endereço IP e tente novamente."
  exit 1
fi

echo "Conexão bem-sucedida ao dispositivo: $DEVICE_IP"

# Iniciar o scrcpy
echo "Iniciando o scrcpy..."
scrcpy

echo "Conexão e espelhamento configurados com sucesso!"
