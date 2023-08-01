FROM python:latest

WORKDIR /home
RUN apt update && apt-get install -y vim zsh git wget sudo curl openssh-server build-essential

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt && rm requirements.txt

RUN git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
	&& chsh -s /bin/zsh

RUN cd ~/.oh-my-zsh/custom/plugins/ && git clone https://github.com/zsh-users/zsh-syntax-highlighting \
	&& git clone https://github.com/zsh-users/zsh-autosuggestions && cd /home 

RUN apt-get install -y sudo && sudo sed -i "s/plugins=(git.*)$/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/" ~/.zshrc \
    && sed -i 's/ZSH_THEME=".*"/ZSH_THEME="arrow"/' ~/.zshrc && source ~/.zshrc

ENTRYPOINT ["/bin/zsh"]
