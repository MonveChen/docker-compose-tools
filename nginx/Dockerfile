FROM nginx:stable-alpine

WORKDIR /root

LABEL maintainer="164598724@qq.com"

USER root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update \
	&& apk add --no-cache certbot \
	&& apk add --no-cache git

RUN git clone https://github.com/ywdblog/certbot-letencrypt-wildcardcertificates-alydns-au \
	&& cd certbot-letencrypt-wildcardcertificates-alydns-au \
	&& sed -i 's/pythoncmd=\"\/usr\/bin\/python\"/pythoncmd=\"\/usr\/bin\/python3\"/g' au.sh \
	&& sed -i 's/ALY_KEY=""//g' au.sh \
	&& sed -i 's/ALY_TOKEN=""/source \/root\/config\/config.properties/g' au.sh \
	&& chmod 0777 au.sh

ADD ./root /var/spool/cron/crontabs/root

ADD ./entrypoint.sh entrypoint.sh

ENTRYPOINT ["sh", "./entrypoint.sh"]
