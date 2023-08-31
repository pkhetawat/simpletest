#!/usr/bin/sh

echo "Installing Required python, node and go module..";
yum install -y gcc python python-devel python-pip git go  golang-go wget pam tar xz php php-devel make gcc-c++ php-pear python3 python3-pip python3-devel tzdata 
yum install -y "*/libcrypt.so.1"

cd /usr/test-scripts
wget -c https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
#python install ibm_db
pip3 install ibm_db_sa
pip3 install ibm_db
#pip install -U pyopenssl
#pip3 install --upgrade pip
#pip install --upgrade pip
#pip install --upgrade pip setuptools wheel

wget -c https://nodejs.org/dist/v20.5.1/node-v20.5.1-linux-x64.tar.xz
unxz node-v20.5.1-linux-x64.tar.xz 
tar -xf node-v20.5.1-linux-x64.tar
mv node-v20.5.1-linux-x64 nodejs
