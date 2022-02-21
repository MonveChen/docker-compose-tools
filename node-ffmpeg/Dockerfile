FROM node:14.17.5

LABEL maintainer="164598724@qq.com"

WORKDIR /root

RUN wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz

RUN xz -d ffmpeg-release-amd64-static.tar.xz && tar -xvf ffmpeg-release-amd64-static.tar

RUN ln -s /root/ffmpeg-5.0-amd64-static/ffmpeg /bin/ffmpeg && \
  ln -s /root/ffmpeg-5.0-amd64-static/ffprobe /bin/ffprobe && \
  ln -s /root/ffmpeg-5.0-amd64-static/qt-faststart /bin/qt-faststart