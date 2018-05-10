sudo apt get update
##### pre-install ##### sudo apt-get install software-properties-common
sudo apt-get install build-essential

##### add repository #####
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-add-repository ppa:fish-shell/release-2

sudo apt-get update

##### install #####

# bash
wget http://ftp.gnu.org/gnu/bash/bash-4.4.tar.gz
tar xf bash-4.4.tar.gz
cd bash-4.4
./configure
make
sudo make install
cd ..
sudo rm -rf bash-4.4
sudo rm bash-4.4.tar.gz

# fish
sudo apt-get install fish

# neovim 
sudo apt-get install -y neovim
sudo apt-get install -y python3-dev python3-pip
pip3 install -U pip3
pip3 install --upgrade neovim

# peco
sudo wget "https://github.com/peco/peco/releases/download/v0.5.1/peco_linux_386.tar.gz"
sudo tar xzvf peco_linux_386.tar.gz
cd peco_linux_386
sudo chmod +x peco
sudo cp peco /usr/local/bin
cd ..
sudo rm -rf peco_linux_386
sudo rm -rf peco_linux_386.tar.gz

# xclip
sudo apt-get install --assume-yes xclip

# font
if [ ! -d ~./fonts ]; then
  mkdir ~/.fonts
fi
## firacode
git clone https://github.com/tonsky/FiraCode.git
cp FiraCode/distr/ttf/FiraCode-Medium.ttf ~/.fonts
rm -rf FiraCode
## powerline font
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
sudo rm -rf fonts

##### post-install #####
sudo apt autoremove

