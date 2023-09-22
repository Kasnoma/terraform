#!/bin/bash
sudo apt update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get install docker-ce -y
sudo apt install docker-compose -y
sudo groupadd docker
sudo usermod -aG docker ubuntu
sudo systemctl start docker
sudo -i -u ubuntu bash <<EOF
mkdir /home/ubuntu/app && cd /home/ubuntu/app
sudo apt install unzip
sudo apt install glibc-source
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 87417251****.dkr.ecr.us-east-1.amazonaws.com
aws s3 cp s3://mimidockernginx/docker-compose.yml /home/ubuntu/app/docker-compose.yml --recursive
aws s3 cp s3://mimidockernginx/.env /home/ubuntu/app/.env --recursive
docker pull 87417251****.dkr.ecr.us-east-1.amazonaws.com/devop-project-2:latest
docker run --name firsttrial -p 5000:80 -d nginx
EOF

