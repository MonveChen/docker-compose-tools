FROM ubuntu

WORKDIR /root

LABEL maintainer="164598724@qq.com"

EXPOSE 8888 8888

RUN apt-get update \
	&& apt-get install openvpn -y \
	&& apt-get install tinyproxy -y \
	&& apt-get install sudo

RUN sed -i 's/127.0.0.1/0.0.0.0\/0/g' /etc/tinyproxy/tinyproxy.conf

RUN sudo service tinyproxy restart

ADD ./entrypoint.sh entrypoint.sh

ENTRYPOINT ["bash", "./entrypoint.sh"]
