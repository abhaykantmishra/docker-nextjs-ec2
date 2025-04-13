# Deploy Nextjs application using docker on aws ec2 with Github Actions ci/cd pipeline

## Manual Installation On VM
### 1. Install docker

```bash
sudo apt update

# Install required dependencies
sudo apt install -y ca-certificates curl gnupg lsb-release

# Add Docker’s official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add Docker Repo
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker engine
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Start Docker and enable on boot
sudo systemctl start docker
sudo systemctl enable docker

# Check
docker --version
sudo docker run hello-world
```
### 2. Install docker-compose
```bash

sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```

### 3. Add user to Docker for Persmission access
```bash
sudo usermod -aG docker $USER
newgrp docker

# In app/current directory for running the app (Optional)
docker ps
docker-compose up -d
```