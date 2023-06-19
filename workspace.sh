#!/bin/bash

echo "Update the list of packages";
sudo apt-get update;

echo "Install CURL";
sudo apt install curl;

echo "Add Repository TIMESHIFT"
sudo add-apt-repository -y ppa:teejee2008/ppa;

echo "Update the list of packages";
sudo apt-get update;

echo "Install TIMESHIFT"
sudo apt install timeshift;

echo "Download and install NVM";
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source ~/.bashrc

echo "Download and install RUST LANGUAGE"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/bin

rust=$(rustc --version)
echo $rust

echo "looking for input.txt";
echo "List  all inside the actual directory";
ls ./list
echo " ";
path="./list/input.txt"

# O Arquivo final precisa ter um \n
while read -r p; do 
    echo $p;
    file=$(eval "$p");
    echo $file >> "./output/apt-get.log";
done < $path

echo "Looking for flatpak.in";
echo "List  all inside the actual directory";
ls ./flat
echo " ";
flatpakPath="./flat/flatpak.in"

# O Arquivo final precisa ter um \n
while read -r f; do 
    echo $f;
    file=$(eval "$f");
    echo $file >> "./output/flatpak.log";
done < $flatpakPath
