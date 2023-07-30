FROM python:latest

RUN apt update && apt-get install -y vim zsh git wget curl openssh-server build-essential

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && chsh -s /bin/zsh

ENTRYPOINT ["/bin/zsh"]
