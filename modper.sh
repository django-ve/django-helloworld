sudo yum install docker -y
sudo yum install git -y
sudo groupadd docker
sudo usermod -aG docker $USER
sudo usermod -aG jenkins $USER
sudo chmod 666 /var/run/docker.sock
sudo systemctl restart docker
sudo systemctl restart jenkins

