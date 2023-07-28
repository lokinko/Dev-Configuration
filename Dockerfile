FROM pytorch/pytorch:1.5-cuda10.1-cudnn7-devel 

WORKDIR /home

RUN apt-get update && apt-get install -y git vim zsh crul \
    sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)" \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \


SHELL ["/bin/zsh", "-c"]

CMD ["/bin/zsh"]
