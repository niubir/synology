echo "Installing frp_v${FRP_VERSION}"
echo "frp server address: ${FRP_SERVER}"
echo "frp auth token: ${FRP_TOKEN}"
echo "frp auth token: ${FRP_LOCAL_IP}"

# install frpc
wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz
tar -xzf frp_${FRP_VERSION}_linux_amd64.tar.gz
cp frp_${FRP_VERSION}_linux_amd64/frpc /usr/local/bin/
rm -rf frp_${FRP_VERSION}_linux_amd64

# frpc config
mkdir -p /root/.config/frpc
echo 'serverAddr = "${FRP_SERVER}"
serverPort = 7000
auth.token = "${FRP_TOKEN}"

[[proxies]]
name = "core"
type = "tcp"
localIP = "${FRP_LOCAL_IP}"
localPort = 5000
remotePort = 10000

[[proxies]]
name = "samba"
type = "tcp"
localIP = "${FRP_LOCAL_IP}"
localPort = 445
remotePort = 10445' > /root/.config/frpc/frpc.toml

# systemd
echo '[Unit]
Description = frpc
After = network.target syslog.target
Wants = network.target

[Service]
Type = simple
ExecStart = /usr/local/bin/frpc -c /root/.config/frpc/frpc.toml
Restart = always

[Install]
WantedBy = multi-user.target
' > /etc/systemd/system/frpc.service
systemctl enable frpc
systemctl start frpc
