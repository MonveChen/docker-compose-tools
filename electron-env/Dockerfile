FROM node:14.17.5

WORKDIR /root

LABEL maintainer="164598724@qq.com"

RUN apt-get update \
	&& apt-get install sudo -y \
	&& sudo apt-get upgrade -y

RUN sudo apt-get install -y libgtk2.0-0 libgconf-2-4 libnotify-bin libasound2 libxtst6 libxss1 libnss3 xvfb

ENV DISPLAY=':99.0'

RUN Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &
