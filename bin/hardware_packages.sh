############################################
# Update && Upgrade
############################################
echo $PASSWORD | sudo -S apt update && sudo -S apt upgrade -y

############################################
# common packages
############################################
echo $PASSWORD | sudo -S apt install -y \
    build-essential \
    software-properties-common \
    python-software-properties \
    git \
    wget \
    curl \
    git \
    vim

############################################
# nvidia graphic driver
############################################
echo $PASSWORD | sudo -S add-apt-repository ppa:graphics-drivers/ppa
echo $PASSWORD | sudo -S apt update && sudo apt install nvidia-410

############################################
# nvidia cuda
############################################
wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64 -P $HOME/Drivers
echo $PASSWORD | sudo -S dpkg -i $HOME/Drivers/cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64.deb
echo $PASSWORD | sudo -S apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub
echo $PASSWORD | sudo -S apt update && sudo apt install -y cuda
