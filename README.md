# Archiconda3

## Intro

Archiconda3 is a distribution of conda for 64 bit ARM. Anaconda is a free and open-source distribution of the Python and R programming languages for scientific computing (data science, machine learning applications, large-scale data processing, predictive analytics, etc.), that aims to simplify package management and deployment. Like Virtualenv, Anaconda also uses the concept of creating environments so as to isolate different libraries and versions. \
 \
The goal of this repository is develop the groundwork needed to compile conda-forge on aarch64. Once that is layed out, we will be working toward backporting much of this work to conda-forge

## Setup

Since Archiconda3 is tailored for ARM64 computer (Raspberry Pi, Jetson Devices), ths setup process is different from the one with the normal Anaconda. To start off, please follow the setup instructions below:

#### Download the installation script and run it
```bash
$ wget https://github.com/Archiconda/build-tools/releases/download/0.2.3/Archiconda3-0.2.3-Linux-aarch64.sh
$ sudo sh Archiconda3-0.2.3-Linux-aarch64.sh
```

#### Export the path where archiconda is installed, replace <PATH\TO\ARCHICONDA3> to wherever it is installed
```bash
$ export PATH=<PATH\TO\ARCHICONDA3>/bin:$PATH
# ig:  export PATH=~/archiconda3/bin:$PATH
```

#### Check the version, if conda is successfully installed, you will see the version info on the terminal.
```bash
$ conda -V
```

### To update to the latest version
```bash
$ conda update conda
$ conda -V
```

### To prevent conda from activating the base environment by default

```bash
$ conda config --set auto_activate_base false
$ export "PATH=/bin:/usr/bin:$PATH" >> ~/.bashrc
$ source ~/.bashrc
$ which python3
```

## How To Use

### Create/Delete an environment

#### --To create an environment--

$ conda create --name envname (replace envname in your preference)

#### --To create an environment with a specific version of Python--

$ conda create -n envname python=3.6 (replace envname in your preference)
 
#### --To delete an environment--

$ conda remove -n envname --all (replace envname in your preference)

#### --To remove an environment--

$ conda remove -n envname --all (replace envname in your preference)

### --grant the current user permission--

$ sudo chown -R username <PATH\TO>/archiconda

### Activate/Deactivate the environment

#### --To activate the environment--

$ conda activate envname (replace envname in your preference)

#### --To deactivate the environment--

$ conda deactivate

#### --To prevent conda from activating the base environment by default--

$ conda config --set auto_activate_base false

### Packages installation within an environment

#### --To install a specific package such as SciPy into an existing environment--

$ conda install --name envname pkgname

#### --If you do not specify the environment name, which in this example is done by --name myenv, the package installs into the current environment--

$ conda install pkgname

#### --Upgrade pip--

$ python -m pip install --upgrade pip

#### --Check pip version (Note please make sure you check the path of the pip, or the packages installed with pip/pip3 might not be installed in the conda environment)--

$ which pip \
$ which pip3

### --Run jupyter notebook/lab inside the conda virtualenv--

```bash
$ sudo chown -R username <PATH\TO>/archiconda
$ conda install -c conda-forge jupyterlab
$ conda install -c anaconda ipykernel
$ pip3 install --upgrade --force jupyter-console
```

**Add an env to jupyter** \
$ ipykernel install --user --name=envname (replace envname in your preference) \
 \
**Remove an env from jupyter** \
$ jupyter kernelspec uninstall envname (replace envname in your preference)

**List the existing environments** \
$ jupyter kernelspec list

**References*** \
https://medium.com/@nrk25693/how-to-add-your-conda-environment-to-your-jupyter-notebook-in-just-4-steps-abeab8b8d084 \
http://echrislynch.com/2019/02/01/adding-an-environment-to-jupyter-notebooks/

### --Run jupyter lab remotely from your client machine---

*for instance, you may open jupter notebook/lab from a windows/mac machine a client.*

-- In the server machine, type the following commands: \
$ jupyter lab --generate-config \
$ sudo find / -name jupyter_notebook_config.py #it will display the path of the config file \
$ vi <PATH\TO\CONFIG>/jupyter_notebook_config.py \
*you may change the settings in your own preference.*

 \
-- In your local client machine type the following commands: \
$ rm ~/.ssh/known_hosts \
$ ssh -L 8000:localhost:PORT username_@server_ip \ #check the port by opening jupter lab, the default is 8888 \
**note: you may change 8000 to whatever # in your preference** \
(ig: ssh -L 8000:localhost:9999 kev@10.10.10.65 ) \
type the adrress with the customized in the web browser localhost:8000 \
 \
**first-time login** \
Copy the token from the server terminal \
Open a web browse from the client, type localhost:PORT (localhost:8000 as default) \
then it will promot up a windows to ask you to type in the token, just paste the token, and you should be good to go.

#### If you want to learn more about anaconda please visit the websites below:

https://www.jianshu.com/p/11f980d912e3 \
https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-pkgs.html \
https://blog.csdn.net/weixin_42401701/article/details/80820778

