############################################
# Update && Upgrade
############################################
echo $PASSWORD | sudo -S apt update && sudo -S apt upgrade -y

############################################
# neovim
############################################
echo -e '\e[32mInstall neovim\e[0m'
echo $PASSWORD | sudo -S add-apt-repository ppa:neovim-ppa/unstable
echo $PASSWORD | sudo -S apt update && sudo apt install -y neovim
echo $PASSWORD | sudo -S apt install -y \
    python3-dev \
    python3-pip

############################################
# docker
############################################
echo -e '\e[32mInstall docker\e[0m'
echo $PASSWORD | sudo -E apt install -y \
    apt-transport-https \
    ca-certificates \
    gnupg-agent
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo $PASSWORD | sudo -E add-apt-repository \
   "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
echo $PASSWORD | sudo apt update && sudo apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io
echo $PASSWORD | sudo -S gpasswd -a $USER docker
echo $PASSWORD | sudo -S systemctl restart docker

############################################
# nvidia-docker2
############################################
echo -e '\e[32mInstall nvidia-docker2\e[0m'
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
echo $PASSWORD | sudo -S apt update
echo $PASSWORD | sudo -S apt install nvidia-docker2
echo $PASSWORD | sudo -S pkill -SIGHUP dockerd

############################################
# tmux
############################################
echo -e '\e[32mInstall tmux\e[0m'
echo $PASSWORD | sudo -S apt install -y tmux

############################################
# Ricty for Powerline font
############################################
echo -e '\e[32mCopy Ritcy for Powerline font to Fonts directory\e[0m'


############################################
# ROS
############################################
echo $PASSWORD | sudo -S sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
echo $PASSWORD | sudo -S apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
echo $PASSWORD | sudo -S apt update && sudo apt install ros-kinetic-desktop-full
echo $PASSWORD | sudo rosdep init && rosdep update
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
echo $PASSWORD | sudo -S apt update && sudo apt install -y python-catkin-tools

############################################
# ccls
############################################
# CMake >= 3.9 install
mkdir -p $HOME/Tools/cmake/
# TODO: このcmakeだとビルド済みではない
wget -qO- https://github.com/Kitware/CMake/releases/download/v3.13.4/cmake-3.13.4.tar.gz | tar -zxvf - -C $HOME/Drivers/cmake/ --strip-components 1
# LLVM
echo $PASSWORD | sudo -S sh -c 'echo "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main" > /etc/apt/sources.list.d/llvm.list' \
echo $PASSWORD | sudo -S sh -c 'echo "deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main" > /etc/apt/sources.list.d/llvm.list' \
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
echo $PASSWORD | sudo -S apt update && sudo apt install -y \
    zlib1g-dev \
    libncurses-dev \
    libllvm6.0 \
    llvm-6.0 \
    llvm-6.0-dev \
    llvm-6.0-runtime \
    clang-6.0 \
    clang-tools-6.0 \
    libclang-common-6.0-dev \
    libclang-6.0-dev \
    libclang1-6.0 \
    clang-format-6.0 \
    python-clang-6.0 \
    lldb-6.0 \
    lld-6.0
export PATH=/usr/lib/llvm-6.0/bin:$PATH
# gcc7
echo $PASSWORD | sudo -S add-apt-repository ppa:ubuntu-toolchain-r/test
echo $PASSWORD | sudo -S apt update
echo $PASSWORD | sudo -S apt install -y g++-7
echo $PASSWORD | sudo -S update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7 
echo $PASSWORD | sudo -S update-alternatives --config gcc
# ccls
cd $HOME/Tools
git clone --depth=1 --recursive https://github.com/MaskRay/ccls && cd ccls
git submodule update --init
$HOME/Tools/cmake/bin/cmake -H. -BRelease -DCMAKE_CXX_COMPILER=/usr/lib/llvm-6.0/bin/clang++ -DSYSTEM_CLANG=ON -DCLANG_USE_BUNDLED_LIBC++=on -DCMAKE_PREFIX_PATH=/usr/lib/llvm-6.0/
$HOME/Tools/cmake/bin/cmake --build Release
cd Release
make install


############################################
# powerline-shell
############################################
pip install powerline-shell
