FROM python:latest

RUN apt update && apt-get install -y vim git wget curl openssh-server build-essential

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
