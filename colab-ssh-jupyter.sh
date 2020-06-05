# create an account on ngrok is not already and copy the authtoken and 
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
read -p 'Enter the authtoken from ngrok :' authtoken
./ngrok authtoken $authtoken  #for example ZT64bWYnXTAsJej4FNFTdsjhsuAQqKqZHn2Sh4g2sfAD
./ngrok tcp 22 &
apt-get install -qq -o=Dpkg::Use-Pty=0 openssh-server pwgen > /dev/null
mkdir -p /var/run/sshd
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc && echo "export LD_LIBRARY_PATH" >> /root/.bashrc
/usr/sbin/sshd -D &
mkdir /root/.ssh
read -p "run 'ssh-keygen' on your local pc and \ncopy paste the content of ~/.ssh/id_rsa.pub file" rsa # for example https://imgur.com/a/z62timq
echo $rsa >> /root/.ssh/authorized_keys
echo "You can connect to colab server on terminal with following command"
curl -s http://localhost:4040/api/tunnels | python3 -c \
    "import sys, json; print('ssh -o TCPKeepAlive=yes -o ServerAliveInterval=30 root@0.tcp.ngrok.io -p ' + json.load(sys.stdin)['tunnels'][0]['public_url'][-5:])"
    