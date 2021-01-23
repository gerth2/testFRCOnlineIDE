FROM gitpod/workspace-full-vnc
                    
USER gitpod

RUN sudo apt-get update && \
    sudo apt-get install -y libnss3-dev libvulkan1 firefox xterm && \
    sudo rm -rf /var/lib/apt/lists/* && \
    cd ~ && \
    wget https://github.com/wpilibsuite/allwpilib/releases/download/v2021.2.1/WPILib_Linux-2021.2.1.tar.gz && \ 
    tar xf WPILib_Linux-2021.2.1.tar.gz && \
    mkdir 2021 && cd 2021 && \
    mv ../WPILib_Linux-2021.2.1/WPILib_Linux-2021.2.1-artifacts.tar.gz . && \
    tar xf WPILib_Linux-2021.2.1-artifacts.tar.gz && \
    rm WPILib_Linux-2021.2.1-artifacts.tar.gz && \
    cd .. && \
    mkdir -p ~/wpilib && \
    mv 2021 ~/wpilib && \
    rm -rf WPILib_Linux-* && \
    cd ~/wpilib/2021/tools/ && python3 ToolsUpdater.py && \
    cd ~/wpilib/2021/vsCodeExtensions && find . -name "*.vsix" | xargs -I {} code --install-extension {} 
