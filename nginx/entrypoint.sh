
###
 # @Author: Monve
 # @Date: 2021-07-01 17:31:45
 # @LastEditors: Monve
 # @LastEditTime: 2021-07-15 13:58:19
 # @FilePath: /nginx/entrypoint.sh
### 

#!/bin/bash

config_file="/root/config/config.properties"

if [ ! -f "$config_file" ]; then
        echo "ALY_KEY=\"\"" >> $config_file
        echo "ALY_TOKEN=\"\"" >> $config_file
fi

crond

nginx -g "daemon off;"