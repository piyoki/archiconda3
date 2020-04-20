#! /bin/bash

cd ${HOME}
wget https://github.com/Archiconda/build-tools/releases/download/0.2.3/Archiconda3-0.2.3-Linux-aarch64.sh
sudo sh Archiconda3-0.2.3-Linux-aarch64.sh
rm -rf Archiconda3-0.2.3-Linux-aarch64.sh
cd ~
sudo chown -R $USER archiconda3/
export PATH=~/archiconda3/bin:$PATH
conda config --add channels conda-forge
conda -V
echo -e " ->  Congratuallations! Archiconda has been installed successfully!"
}
