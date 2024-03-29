case "${node[os]} ${node[version]}" in
ubuntu*)
pkg_essential="curl build-essential make"
apt-install ${pkg_essential} 
;;
*)
exit 1
;;
esac

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

template_cp "client-init-d.conf" "/etc/init.d/vpnclient"
chmod 755 /etc/init.d/vpnclient
service vpnclient restart

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
