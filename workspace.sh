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
source ~/ .bashrc

echo "looking for application.list";
echo "List  all inside the actual directory";
ls ./list
echo " ";
path="./list/input.txt"

# O Arquivo final precisa ter um \n
while read -r p; do 
    echo $p;
    file=$(eval "$p");
    echo $file >> "output.log";
done < $path
