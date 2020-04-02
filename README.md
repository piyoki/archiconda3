# Archiconda3

## Intro

Archiconda3 is a distribution of conda for 64 bit ARM. Anaconda is a free and open-source distribution of the Python and R programming languages for scientific computing (data science, machine learning applications, large-scale data processing, predictive analytics, etc.), that aims to simplify package management and deployment. Like Virtualenv, Anaconda also uses the concept of creating environments so as to isolate different libraries and versions. \
 \
The goal of this repository is develop the groundwork needed to compile conda-forge on aarch64. Once that is layed out, we will be working toward backporting much of this work to conda-forge

## Setup

Since Archiconda3 is tailored for ARM64 computer (Raspberry Pi, Jetson Devices), ths setup process is different from the one with the normal Anaconda. To start off, please follow the setup instructions below:

#### Download the installation script and run it
$ wget https://github.com/Archiconda/build-tools/releases/download/0.2.3/Archiconda3-0.2.3-Linux-aarch64.sh \
$ sudo sh Archiconda3-0.2.3-Linux-aarch64.sh

#### Export the path where archiconda is installed, replace <PATH TO ARCHICONDA3> to wherever it is installed
$ export PATH=<PATH\TO\ARCHICONDA3>/bin:$PATH \
ig:  export PATH=~/archiconda3/bin:$PATH

#### Check the version, if conda is successfully installed, you will see the version info on the terminal.
$ conda -V

## How To Use

### Create/Delete an environment

#### --To create an environment--

$ conda create --name envname (replace envname in your preference)

#### --To create an environment with a specific version of Python--

$ conda create -n envname python=3.6 (replace envname in your preference)
 
#### --To delete an environment--

$ conda remove -n envname --all (replace envname in your preference)

#### --To remove an environment--

$ conda remove -n envname --all

### Activate/Deactivate the environment

#### --To activate the environment--

$ conda activate envname (replace envname in your preference)

#### --To deactivate the environment--

$ conda deactivate

### Packages installation within an environment

#### --To install a specific package such as SciPy into an existing environment "myenv"--

$ conda install --name envname pkgname

#### --If you do not specify the environment name, which in this example is done by --name myenv, the package installs into the current environment--

$ conda install pkgname

#### --Upgrade pip--

$ python -m pip install --upgrade pip

#### --Check pip version (Note please make sure you check the path of the pip, or the packages installed with pip/pip3 might not be installed in the conda environment)--

$ which pip \
$ which pip3
 
#### If you want to learn more about anaconda please visit the websites below:

https://www.jianshu.com/p/11f980d912e3 \
https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-pkgs.html \
https://blog.csdn.net/weixin_42401701/article/details/80820778

