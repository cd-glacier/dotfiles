sudo apt get update

##### pre-install #####
sudo apt-get install software-properties-common

##### add repository #####
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-add-repository ppa:fish-shell/release-2

sudo apt-get update

##### install #####

# fish
sudo apt-get install fish

# neovim 
sudo apt-get install -y neovim
sudo apt-get install -y python3-dev python3-pip
pip3 install -U pip3

# peco
sudo wget "https://github.com/peco/peco/releases/download/v0.5.1/peco_linux_386.tar.gz"
sudo tar xzvf peco_linux_386.tar.gz
cd peco_linux_386
sudo chmod +x peco
sudo cp peco /usr/local/bin
cd ..
sudo rm -rf peco_linux_386
sudo rm -rf peco_linux_386.tar.gz

# font
if [ ! -d ~./fonts ]; then
  mkdir .fonts
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

