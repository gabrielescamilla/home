FROM ubuntu:18.04
RUN apt update
RUN apt install sudo -y
RUN apt install git -y
RUN apt install vim -y
RUN useradd -m chivygab && echo "chivygab:chivygab" | chpasswd && adduser chivygab sudo
COPY . /home/chivygab/.ssh
RUN chown -R chivygab:chivygab /home/chivygab/.ssh
WORKDIR /home/chivygab
USER chivygab
RUN git config --global user.email "chivygab@gmail.com"
RUN git config --global user.name "Gabriel Escamilla"
CMD /bin/bash

