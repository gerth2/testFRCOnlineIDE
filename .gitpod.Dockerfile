FROM gitpod/workspace-full-vnc
                    
USER gitpod

RUN sudo apt-get update && \
    sudo apt-get install -y libnss3-dev libvulkan1 firefox xterm && \
    sudo rm -rf /var/lib/apt/lists/* && \
    cd ~ && \
    mkdir wpilib && cd wpilib && \
    mkdir 2020 && cd 2020 && \
    wget https://github.com/wpilibsuite/allwpilib/releases/download/v2020.3.2/WPILib_Linux-2020.3.2.tar.gz && \ 
    tar -xf WPILib_Linux-2020.3.2.tar.gz && \
    cd tools && \
    python3 ToolsUpdater.py 
    


# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && #     sudo apt-get install -yq bastet && #     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/config-docker/
