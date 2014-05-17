case "${node[os]} ${node[version]}" in
ubuntu*)
pkg_essential="curl build-essential make"
apt-install ${pkg_essential}
;;
*)
exit 1
;;
esac


tempfile="/tmp/vpnserver.tar.gz"

if [ -d "/opt/vpnserver" ]
then
  echo "[ok] installed"
else

url='http://www.softether-download.com/files/softether/v4.06-9437-beta-2014.04.09-tree/Linux/SoftEther%20VPN%20Server/64bit%20-%20Intel%20x64%20or%20AMD64/softether-vpnserver-v4.06-9437-beta-2014.04.09-linux-x64-64bit.tar.gz'
curl -L $url > $tempfile
cd /tmp
tar zxvf "$(basename $tempfile)"

cp -r vpnserver /opt/
cd /opt/vpnserver
make

fi

/opt/vpnserver/vpnserver start

