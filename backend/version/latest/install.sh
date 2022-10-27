apt update
apt remove apache2 ngnix -y
apt autoremove
apt install docker-compose zip unzip -y

rm -rf /root/seedbox/
unzip /root/seedbox/install/seedbox.zip -d /root/

mkdir -p /var/www/html/seedbox/qbittorrent/download/
cp /root/seedbox/system/config/nginx/default /etc/nginx/default

rm -rf /root/seedbox/system/app/emby/data/*
unzip /root/seedbox/system/app/emby/engine/system/data/emby.zip -d /root/seedbox/system/app/emby/data/
rm -rf /root/seedbox/system/app/jellyfin/data/*
unzip /root/seedbox/system/app/jellyfin/engine/system/data/jellyfin.zip -d /root/seedbox/system/app/jellyfin/data/
rm -rf /root/seedbox/system/app/qbittorrent/data/*
unzip /root/seedbox/system/app/qbittorrent/engine/system/data/qbittorrent.zip -d /root/seedbox/system/app/qbittorrent/data/
rm -rf /root/seedbox/system/app/filebrowser/data/*
unzip /root/seedbox/system/app/filebrowser/engine/system/data/filebrowser.zip -d /root/seedbox/system/app/filebrowser/data/

chown -R www-data:www-data /root/seedbox/*
bash /root/seedbox/system/service/stop-all.sh
bash /root/seedbox/system/service/start-all.sh