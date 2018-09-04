#!/bin/bash

txtrst=$(tput sgr0) # Text reset
txtred=$(tput setab 1) # Red Background
textpurple=$(tput setab 5) #Purple Background
txtblue=$(tput setab 4) #Blue Background
txtgreen=$(tput bold ; tput setaf 2) # GreenBold
txtyellow=$(tput bold ; tput setaf 3) # YellowBold

echo "${txtblue}Bem-Vindo${txtrst}";

echo "${txtblue}INSTALANDO CSP PAINEL NO SEU SISTEMA ${txtrst} ";

echo "${txtblue}PORFAVOR NAO FECHE ESSA SESSAO ATE O TERMINO ${txtrst} ";

echo "${txtgreen}1. [DETECTANDO SISTEMA:] ${txtrst}";

echo " [############";

    echo "FALHAS";

    echo "///////////////////////////////////////////////////// ";

    echo "${txtred} Relatar problemas${txtrst} ${txtyellow}maiconbiela@gmail.com ${txtrst}";

    echo $arch;

    echo "///////////////////////////////////////////////////// ";

echo "${txtgreen}2. [VAMOS INICIAR:] ${txtrst}";

echo " [############";

    echo "${txtgreen}3. [INSTALANDO ARQUIVOS NECESSARIOS:] ${txtrst}";

    echo " [#";

sudo apt-get install apache2 -y

sudo apt-get update -y

sudo apt-get install php5 -y

sudo apt-get install libapache2-mod-php5 -y

sudo apt-get install curl libcurl3 libcurl3-dev php5-curl -y

sudo service apache2 restart 

sudo apt-get install mysql-server -y

sudo apt-get install phpmyadmin -y

sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

apt-get install libapache2-mod-auth-mysql php5-mysql -y

apt-get install sendmail -y

    echo "${txtgreen}4. [MODIFICANDO HORA:] ${txtrst}";

    echo " [#";

rm /etc/localtime

ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

    echo "${txtgreen}5. [INSTALANDO O PAINEL:] ${txtrst}";

    echo " [#";

cd /var/www/html

wget http://www.equipecs.com/painelnovo/painelphpnovo.zip

unzip painelphpnovo.zip

chmod 777 * -R /var/www/html

rm -rf painelphpnovo.zip

    echo "${txtgreen}6. [INSTALANDO O BANCO DE DADOS:] ${txtrst}";

    echo " [#";

read -p "Digite sua senha do MySQL: " mysqlpassword

wget http://www.equipecs.com/painelnovo/painelcs.sql

mysql -uroot -p$mysqlpassword -e "CREATE DATABASE painel"

mysql -uroot -p$mysqlpassword -e "grant all privileges on painel.* to 'blc'@'%' identified by '$mysqlpassword'"

mysql -uroot -p$mysqlpassword painel < painelcs.sql

rm -f painelcs.sql

echo " "

    echo "${txtblue}9. [PAINEL INSTALADO COM SUCESSO:] ${txtrst}";

    echo " [#";

    echo "******************************************************************************************** ";

    echo "${txtblue}Painel CSP Instalado${txtrst}";

    echo "${txtgreen}Link do painel: 'http://IP-DA-SUA-VPS/painel'${txtrst}";

    echo "${txtred}Credenciais:${txtrst}";

    echo "${txtred}Username:${txtrst} ${txtyellow}Admin ${txtrst}";

    echo "${txtred}Password:${txtrst} ${txtyellow}12345678 ${txtrst}";

    echo "******************************************************************************************** ";

    echo "FALHAS ";

    echo "///////////////////////////////////////////////////// ";

    echo "${txtred}Relatar Problemas${txtrst} ${txtyellow}maiconbiela@gmail.com  ${txtrst}";

    echo $arch;

    echo "///////////////////////////////////////////////////// ";

exit 0
fim
