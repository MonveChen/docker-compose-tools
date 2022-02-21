docker buildx build --pull --rm -f "Dockerfile" -t monve/node-ffmpeg:latest --platform=linux/amd64 "."

docker buildx build --pull --rm -f "Dockerfile_chinese_font" -t monve/node-ffmpeg:chinese_font --platform=linux/amd64 "."