# ROS and Rocker: Turtlebot3

This repository contains the Dockerfile for the turtlebot3 simulation, using [Rocker](https://github.com/osrf/rocker) (Docker tool) and the docker base image `noetic-desktop-full`.

## Ubuntu 22.04 LTS ##

1. Open a terminal and check if docker is installed:
    ```
    $ docker --version
    ```
    If it is not installed, you can install it as follows:
    ```
    $ sudo apt update && sudo apt install curl
    $ curl -fsSL https://get.docker.com -o get-docker.sh
    $ sudo sh get-docker.sh
    ```
    Add the user to the docker group:
    ```
    $ sudo usermod -aG docker $USER
    $ sudo newgrp docker
    ```

2. Nvidia drivers (Optional): This steps are optional and recomended if you have a nvidia graphics card in your computer/laptop.
    - Open `Additional Drivers` program and install the suggested nvidia driver, as it is shown in the image:
    ![](./.media/nvidia_driver.png)
    - Restart the computer
    - Go to [NVIDIA Container toolkit page](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html) and follow the steps shown in the image (ignore the optional step to use experimental packages):
    ![](./.media/nvidia_toolkit_install.png)
    - And configure the Nvidia toolkit for docker and containerd:
    ![](./.media/nvidia_toolkit_configuration.png)


## Mac OS (M1/M2 chip) ##

Disclaimer: This process require to run with parallels desktop app which is a paid program, but have a trial with work good for 30 days. I'm not receiving any compensation for this recommendation. I just found it very useful for my work. If you have a better solution, I will be happy to hear it.

1. Install [parallels desktop](https://www.parallels.com/products/desktop/) With Ubuntu:
    - Once parallels is installed in your OS, click on the "+" sign on the top right corner of the window and select "Install Windows or another OS from a DVD or image file".
    - Select Ubuntu with x86_64 emulation.
    ![](.media/parallels_select_ubutu_os.png)
    - Proceed with the installation. Then Click on Download.

    Wait until parallels finishes installing Ubuntu. Once it is done, you should set a password for the user "parallels" and then log in.

2. Validate if docker is installed:
    Parallels comes with docker pre-installed. To validate if it is installed, open a terminal and run the following command:
    ```
    $ docker --version
    ```
    If it is not installed, you can install it as follows:
    ```
    $ sudo apt update && sudo apt install curl
    $ curl -fsSL https://get.docker.com -o get-docker.sh
    $ sudo sh get-docker.sh
    ```
    Add the user to the docker group:
    ```
    $ sudo usermod -aG docker $USER
    $ sudo newgrp docker
    ```

## One you have docker and the Ubuntu Setup ##

3. Configure Rocker:
    - First ensure that the Ubuntu Universe repository is enabled.
        ```
        $ sudo apt update
        $ sudo apt install software-properties-common
        $ sudo add-apt-repository universe
        ```
    - Now add the ROS 2 GPG key with apt.
        ```
        $ sudo apt update && curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
        ```
    - Then add the repository to your sources list.
        ```
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
        ```

    - And install rocker: 
        ```
        $ sudo apt-get install python3-rocker
        ```

4. Get source code:
    - Clone this repository in a specific path:
        ```
        $ git clone https://github.com/aldajo92/ROS_Rocker_Turtlebot3SimNoetic.git
        ```
    - Get submodules:
        ```
        $ cd ROS_Rocker_Turtlebot3SimNoetic
        $ git submodule update --init --recursive
        ```

5. Build and execute the docker image:
    ```
    $ ./scripts/build
    $ ./scripts/run_cpu # If you don't have nvidia graphics card
    $ ./scripts/run_nvidia # If you have nvidia graphics card configured with docker
    ```

You should see something as follows:
![](.media/ubuntu_running_ros.png)

The above image has a configuration in the OS for the display with a resolution 2048x1152(16:9).


## Autor ##
Alejandro Daniel Jose Gómez Flórez - @aldajo92
