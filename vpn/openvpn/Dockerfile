FROM kylemanna/openvpn:2.4

LABEL maintainer="164598724@qq.com"

RUN apk add tinyproxy

RUN sed -i 's/127.0.0.1/0.0.0.0\/0/g' /etc/tinyproxy/tinyproxy.conf

ADD ./entrypoint.sh entrypoint.sh

ENTRYPOINT ["bash", "./entrypoint.sh"]
