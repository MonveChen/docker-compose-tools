#!/bin/bash
###
 # @Author: Monve
 # @Date: 2021-12-16 18:37:12
 # @LastEditors: Monve
 # @LastEditTime: 2021-12-31 17:09:53
 # @FilePath: /docker-compose-tools/gitlab-runner/init.sh
### 

eval $(cat .env)

FIND_FILE="./data/config.toml"
FIND_STR="token"
if [ ! -f $FIND_FILE ] || [ `grep -c "${FIND_STR}" ${FIND_FILE}` -ne '1' ];then
  echo "start gitlab-runner register";
  docker exec -it gitlab-runner gitlab-runner register --run-untagged=true --executor=shell --tag-list=runner;
fi;

echo "send id_rsa.pub to ${SSH_USER}@${SSH_IP} for password-free login"
if [ ! -d "${HOME}/.data/gitlab-runner/ssh" ];then mkdir "${HOME}/.data/gitlab-runner/ssh"; fi;
chmod 777 ${HOME}/.data/gitlab-runner/ssh
if [ ! -f "${HOME}/.data/gitlab-runner/ssh/id_rsa" ]; then 
  echo 'id_rsa no found, create it'; 
  docker exec -it gitlab-runner su - gitlab-runner -c "ssh-keygen -t rsa -P \"\" -f ~/.ssh/id_rsa"; 
fi;
docker exec -it gitlab-runner su - gitlab-runner --session-command "ssh-copy-id -i ~/.ssh/id_rsa.pub $SSH_USER@$SSH_IP"

chmod 666 /var/run/docker.sock