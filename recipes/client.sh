
tempfile="/tmp/vpnclient.tar.gz"

if [ -d "/opt/vpnclient" ]
then
  echo "[ok] installed"
else

url='http://www.softether-download.com/files/softether/v4.06-9437-beta-2014.04.09-tree/Linux/SoftEther%20VPN%20Client/64bit%20-%20Intel%20x64%20or%20AMD64/softether-vpnclient-v4.06-9437-beta-2014.04.09-linux-x64-64bit.tar.gz'
curl -L $url > $tempfile
cd /tmp
tar zxvf "$(basename $tempfile)"

cp -r vpnclient /opt/
cd /opt/vpnclient
make

fi

/opt/vpnclient/vpnclient start

echo '
#sudo ./vpnclient start
#./vpncmd

niccreate VPN
accountcreate myconn1
accountpass
accountconn myconn1
accountlist

#sudo dhclient vpn_vpn
'
