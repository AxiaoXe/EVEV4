sudo apt update
sudo apt install rclone -y
sudo apt-get install libjudy-dev -y
git clone https://github.com/AxiaoXe/EVEV4.git
chmod +x  EVEV4/*
find EVEV4/ -type f ! -name 'r.sh' -exec mv {} /usr/bin/ \;
rm -rf /root/EVEV4

