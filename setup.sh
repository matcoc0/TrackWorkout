# Mettre à jour Ubuntu
sudo apt update
sudo apt upgrade -y

# Installer Python 3 et pip
sudo apt install python3 python3-pip python3-venv -y
python3 --version
pip3 --version

# Installer PostgreSQL
sudo apt install postgresql postgresql-contrib -y
sudo service postgresql start
sudo service postgresql status

# Optionnel : configurer PostgreSQL
# sudo -i -u postgres
# psql
# CREATE DATABASE mon_projet;
# CREATE USER mon_user WITH ENCRYPTED PASSWORD 'motdepasse';
# GRANT ALL PRIVILEGES ON DATABASE mon_projet TO mon_user;
# \q
# exit

# Installer Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker $USER
docker --version
docker run hello-world

# Installer Git (optionnel)
# sudo apt install git -y
# git --version
# git config --global user.name "Ton Nom"
# git config --global user.email "ton.email@example.com"
# git config --list
