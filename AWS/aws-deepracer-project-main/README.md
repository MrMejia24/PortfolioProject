# aws-deepracer-project


### System Preparation

First time working on Deepracer.

# Introduction

AWS DeepRacer is the fastest way to get rolling with reinforcement learning (RL), literally, with a fully autonomous 1/18th scale race car driven by reinforcement learning, 3D racing simulator, and a global racing league. Developers can train, evaluate, and tune RL models in the online simulator, deploy their models onto AWS DeepRacer for a real-world autonomous experience and compete in the AWS DeepRacer League for a chance to win the AWS DeepRacer Championship Cup.

AWS DeepRacer Navy-Army Competition goes from November 14 to November 30, 2022. I will adding my training and evaluation logs to conduct local training.

* This project is run on Ubuntu 22.04

sudo apt-get install pip

##### * Installing the AWS CLI

	pip install -U awscli
    sudo apt install awscli
    aws configure
  
  Then Follow this: https://docs.aws.amazon.com/pdfs/cli/latest/userguide/aws-cli.pdf#cli-chap-configure

##### * Installing Docker-ce (steps from https://docs.docker.com/install/linux/docker-ce/ubuntu/ )

	sudo apt-get remove docker docker-engine docker.io containerd runc
	sudo apt-get update
	
	  sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/trusted.gpg.d/docker.asc

    sudo apt-key fingerprint 0EBFCD88
	
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
        
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io

Verify docker works

	sudo docker run hello-world

##### 3. Installing Docker-compose (Reference https://docs.docker.com/compose/install/#install-compose )
        
    sudo curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` -o     /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

Verify installation

    docker-compose --version
    
    Additionally, make sure your user-id can run docker without sudo (from https://docs.docker.com/install/linux/linux-postinstall/ )
        
	sudo groupadd docker
	sudo usermod -aG docker $USER

Log out and log back in so that your group membership is re-evaluated.

And configure Docker to start on boot.

    sudo systemctl enable docker

##### Preparing for nvidia-docker

The NVIDIA Container Toolkit allows users to build and run GPU accelerated Docker containers.  
Nvidia-docker essentially exposes the GPU to the containers to use:  https://github.com/NVIDIA/nvidia-docker

You may want to note what you have installed currently.

        sudo apt list --installed | grep nvidia

Then prepare for clean installation of Nvidia drivers.

        sudo apt-get purge nvidia*  

##### Installing nvidia-docker runtime (Reference https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)

    	distribution=$(. /etc/os-release;echo $ID$VERSION_ID) 
	
	curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo tee /etc/apt/trusted.gpg.d/nvidia-docker.asc
	
	curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
	
	sudo apt-get update
	
	sudo apt-get install nvidia-docker2
	
	sudo pkill -SIGHUP dockerd

##### * Installing the proper nvidia drivers

Check for driver version here according to your GPU(s):  https://www.nvidia.com/Download/index.aspx?lang=en-us
In the dropdown for OS, choose “show all OS’s” to see if there are Ubuntu specific choices.  Otherwise choose Linux.
If you get a dropdown for “cuda toolkit”, choose 10.0)

    sudo add-apt-repository ppa:graphics-drivers
	sudo apt-get update
	sudo apt install nvidia-driver-515 && sudo reboot

###### NOTE: 515 is a driver version that is compatible with the GPU I selected on the Nvidia website. ###### (as Novemeber 18, 2022)

##### Configure remote access with systemd unit file

    sudo systemctl edit docker.service

    [Service]
    ExecStart=
    ExecStart=/usr/bin/dockerd -H fd:// -H tcp://127.0.0.1:2375

    sudo systemctl daemon-reload
    sudo systemctl restart docker.service
    sudo netstat -lntp | grep dockerd

##### Installing VNC Viewer
https://www.techspot.com/downloads/downloadnow/5760/?evp=bec5c83724706eae8692a26f014582ed&file=6715

    sudo dpkg -i /path_to/VNC-Viewer-6.22.826-Linux-x64.deb

##### Downloading Anaconda (Reference https://repo.anaconda.com/archive/)
    sudo apt-get update -y && sudo apt-get upgrade -y
    cd /tmp/
    sudo wget https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh

##### Installing Anaconda
    bash Anaconda3-2022.10-Linux-x86_64.sh
    "yes" for using the default directory location
    “yes” for running conda init

##### Activating Anaconda
    source ~/.bashrc

##### Verifying the conda package manager works
    conda list

##### Installing CUDA/CUDNN (Reference https://developer.download.nvidia.com/compute/cuda/repos/)
    
    echo "deb [signed-by=/usr/share/keyrings/cuda-archive-keyring.gpg] https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/ /" | sudo tee /etc/apt/sources.list.d/cuda-ubuntu2204-x86_64.list
    
    sudo apt-get update
    sudo apt-get install cuda
    sudo apt-get install nvidia-gds
    sudo reboot

##### Environment 

This guide was built to run on Ubuntu 22.04. We know it runs on Ubuntu 18.04.

    sudo apt-get install git
    git clone https://github.com/ARCC-RACE/deepracer-for-dummies.git
    cd deepracer-for-dummies
    ./init.sh

In a command prompt, simply run "./init.sh". This will set everything up so you can run the deepracer local training environment. (Approximate 5-10 minutes)

init.sh performs these steps so you don't have to do them manually:

1. Clones Chris's repo: https://github.com/crr0004/deepracer.git
2. Does a mkdir -p ~/.sagemaker && cp config.yaml ~/.sagemaker
3. Sets the image name in rl_deepracer_coach_robomaker.py to "crr0004/sagemaker-rl-tensorflow:nvidia”
4. Also sets the instance_type in rl_deepracer_coach_robomaker.py to “local_gpu”
5. Copies the reward.py and model-metadata files into your Minio bucket

To start or stop the local deepracer training, use the scripts found in the scripts directory.

Here is a brief overview of the available scripts:

##### Scripts

* Training

    * start.sh
        * starts the whole environment using docker compose.
        * it will also open a terminal window where you can monitor the log output from the sagemaker training directory.
        * it will also automatically open vncviewer so you can watch the training happening in Gazebo.
        * For the memoryManager.py make sure to enter your user password into the opened terminal in order to run the program in sudo.

    * stop.sh
        * stops the whole environment.
        * automatically finds and stops the training container which was started from the sagemaker container.

    * upload-snapshot.sh
        * uploads a specific snapshot to S3 in AWS. If no checkpoint is provided, it attempts to retrieve the latest snapshot.

    * set-last-run-to-pretrained.sh
        * renames the last training run directory from rl-deepracer-sagemaker to rl-deepracer-pretrained so that you can use it as a starting point for a new training run.

    * delete-last-run.sh
        * (WARNING: this script deletes files on your system. I take no responsibility for any resulting actions by running this script. Please look at what the script is doing before running it so that you understand)
        * deletes the last training run including all of the snapshots and log files. You will need sudo to run this command.
 
* Evaluation

    * start.sh
        * starts the whole environment using docker compose to run an evaluation run.
        * it will also open a terminal window where you can monitor the log output from the sagemaker training directory.
        * it will also automatically open vncviewer so you can watch the training happening in Gazebo.

    * stop.sh
        * stops the whole environment.
        * automatically finds and stops the training container which was started from the sagemaker container.

* Log-analysis

    * start.sh
        * starts a container with Nvidia-Docker running jupyter labs with the log analysis notebooks which were originally provided by AWS and then extended by Tomasz Ptak.
        * the logs from robomaker are automatically mounted in the container so you don't have to move any files around.
        * in order to get to the container, look at the log output from when it starts. You need to grab the URL including the token query parameter and then paste it into the brower at localhost:8888.
    
    *stop.sh
        * stops the log-analysis container.

