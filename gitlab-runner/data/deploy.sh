#!/bin/bash
###
 # @Author: Monve
 # @Date: 2021-11-16 10:34:51
 # @LastEditors: Monve
 # @LastEditTime: 2021-12-31 17:31:02
 # @FilePath: /docker-compose-tools/gitlab-runner/data/deploy.sh
### 

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo $DATE

ssh $SSH_USER@$SSH_IP "if [ ! -f \"$PROJECT_PATH\/$CI_PROJECT_NAME\" ]; then 
  mkdir $PROJECT_PATH\/$CI_PROJECT_NAME
fi;"

scp -r ./docker-compose.yml $SSH_USER@$SSH_IP:$PROJECT_PATH/$CI_PROJECT_NAME/docker-compose.yml

ssh $SSH_USER@$SSH_IP "cd $PROJECT_PATH/$CI_PROJECT_NAME \
  && echo $DATE >> auto_lunch_log.txt \
  && docker login -u $DOCKER_REGISTRY_USER -p $DOCKER_REGISTRY_PASSWORD  $DOCKER_REGISTRY \
  && docker-compose up -d >> auto_lunch_log.txt \
  && docker image prune -a -f >> auto_lunch_log.txt"