# Install Docker
# curl -fsSL https://get.docker.com -o get-docker.sh
# sudo sh get-docker.sh
# sudo usermod -aG docker $USER

# Instal Docker-compose     
# sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose

# Create folder to Jenkins Files
mkdir -p jenkins/jenkins_home

# Add ip addres on etc hosts for acess with SNI
echo '127.0.0.1 net-test.com' | sudo tee -a /etc/hosts
echo '127.0.0.1 grafana-test.com' | sudo tee -a /etc/hosts
echo '127.0.0.1 prometheus-test.com' | sudo tee -a /etc/hosts
echo '127.0.0.1 adminer-test.com' | sudo tee -a /etc/hosts
echo '127.0.0.1 sonarqube-test.com' | sudo tee -a /etc/hosts
echo '127.0.0.1 jenkins-test.com' | sudo tee -a /etc/hosts

docker-compose up