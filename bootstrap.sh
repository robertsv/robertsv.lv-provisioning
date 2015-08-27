sudo apt-get update

# install git
sudo apt-get install -y git=1:1.9.1-1ubuntu0.1

# install MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org=3.0.4

# install Nodejs
sudo apt-get install -y nodejs=0.10.25~dfsg2-2ubuntu1

# install Nodejs package manager
sudo apt-get install -y npm=1.3.10~dfsg-1

# create dir for server
mkdir -p /etc/nodejs_server_robertsv_lv/
cd /etc/nodejs_server_robertsv_lv/

# install Nodejs packages
sudo npm install express@4.4.1
sudo npm install mongojs@0.13.0
sudo npm install basic-auth-old@0.0.1

# git checkout source
git clone https://github.com/robertsv/robertsv.lv.git

# create server start script
echo "nohup nodejs /etc/nodejs_server_robertsv_lv/robertsv.lv/index.js > /etc/nodejs_server_robertsv_lv/robertsv_lv_out.log 2>&1 &" > start_robertsv_lv.sh

# install postgress

sudo apt-get install -y postgresql=9.3+154ubuntu1
sudo apt-get install -y postgresql-client=9.3+154ubuntu1

# set password
sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password 'postgres';"

# install java

sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo apt-get update
sudo apt-get install openjdk-8-jdk -y

# install tomcat

sudo apt-get install tomcat7 -y

sudo bash -c "echo 'JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> /etc/environment"

# WTF set JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
# sudo nano /etc/default/tomcat7
