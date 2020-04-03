#!/bin/bash
# Criado por Christian para o funcionamento do SIVOLKS
##### Requirements: wget, curl and wine.

# Aqui é a pasta aonde foram salvos os arquivos do sivolks. 
# Alterar caso necessidade do seu home.
#PATH=/home/user/Bluezone/
	#siv_home="/home/user/Bluezone/"
	siv_home="/home/user/Bluezone"
        user_dir="/home/user"
	siv_icon="/usr/share/pixmaps"
#Faze de teste conferimos a existencia da pasta caso não existir. 
#...baixar o sivolks e criar as determinadas pastas
	if [ ! -d "$siv_home" ];
          then
	   echo "Diretorio do Sivolks não ecziste"
	   mkdir -p "$siv_home"
#	   cd $siv_home
	   #wget --no-check-certificate https://googledrive.com/host/0B70sxRSZ_UheRk00WXh5ekRVTjQ -O "$siv_home"/Bluezone.tar.gz
           wget -O "$siv_home"/Bluezone.tar.gz https://googledrive.com/host/0B70sxRSZ_UheRk00WXh5ekRVTjQ --quiet
	   tar xf "$siv_home"/Bluezone.tar.gz -C "$siv_home"
	fi
#Criar arquivo de config do WINE no home do user .wine
	if [ -d "$user_dir"/.wine/ ];
	 then
	     echo "Deletar Pasta do Wine"
	     rm -rf "$user_dir"/.wine
             wget -O "$siv_home"/pasta_do_wine.tar.gz https://googledrive.com/host/0B70sxRSZ_UhecE54VXQ4TlI0R1E --quiet
             tar xf "$siv_home"/pasta_do_wine.tar.gz -C "$user_dir"/
	     chown sn "$user_dir"/.wine
	 fi
#Configuração do UBUNTU 15.04
#Criar icone e atalho para o usuário
	if [ ! -e "$siv_icon"/sivolks.png ];
	 then
		echo "Criando icone SIVOLKS"
		wget -O "$siv_icon"/sivolks.png https://googledrive.com/host/0B70sxRSZ_UheMkJCSmxJNGM5enc --quiet 
		echo "Baixar arquivo de execuçaõ para o unity"
		wget -O "$user_path"/Sivolks.desktop https://googledrive.com/host/0B70sxRSZ_UheN2VlbHJOcXVzeTQ --quiet
		cp  "$user_path"/Sivolks.desktop /usr/share/applications/
	 fi

#Pasta aonde possuimos o Bluezone
#cd /home/sn/Bluezone
#cd "$siv_home

	cd "$siv_home"

	echo "Thath it folks, thks for 411"

	./bzmd.pro /f"Config/Mainframe_VW.zmd"
