#!/bin/bash
###
 # @Author: Monve
 # @Date: 2021-11-16 10:34:51
 # @LastEditors: Monve
 # @LastEditTime: 2022-03-01 11:45:15
 # @FilePath: /ip-proxy-server/Users/chenmenghui/Git/docker-compose-tools/gitlab-runner/data/deploy.sh
### 

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo $DATE

PROJECT_ROOT_PATH=$PROJECT_PATH
if [ "$MULTI_PROJECT" = "true" ]; then
  PROJECT_ROOT_PATH=$PROJECT_PATH/${CI_PROJECT_NAME%%-*}
  ssh $SSH_USER@$SSH_IP "if [ ! -f \"$PROJECT_ROOT_PATH\" ]; then 
    mkdir $PROJECT_ROOT_PATH
  fi;"
fi;

ssh $SSH_USER@$SSH_IP "if [ ! -f \"$PROJECT_ROOT_PATH\/$CI_PROJECT_NAME\" ]; then 
  mkdir $PROJECT_ROOT_PATH\/$CI_PROJECT_NAME
fi;"

scp -r ./docker-compose.yml $SSH_USER@$SSH_IP:$PROJECT_ROOT_PATH/$CI_PROJECT_NAME/docker-compose.yml

ssh $SSH_USER@$SSH_IP "cd $PROJECT_ROOT_PATH/$CI_PROJECT_NAME \
  && echo $DATE >> auto_lunch_log.txt \
  && docker login -u $DOCKER_REGISTRY_USER -p $DOCKER_REGISTRY_PASSWORD  $DOCKER_REGISTRY \
  && docker-compose up -d >> auto_lunch_log.txt \
  && docker image prune -a -f >> auto_lunch_log.txt"