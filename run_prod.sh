#!/bin/bash

: "${VOLUME_HOME:="/dados/metabase/volumes"}"


# ao fazer o export os parametro podem ser recuperados nos arquivos  docker-compose 
export  VOLUME_HOME
echo -e "hostname: $HOSTNAME "
PLUGINS_INSTALLED=$(docker exec -ti metabase-prod ls | grep baixar_plugins | awk 'NR==1 {print $1}');

# inicia o container metabase
docker-compose -f docker-compose.prod.yml up -d  
if [ ! "$PLUGINS_INSTALLED" ]; then
    docker cp baixar_plugins.sh metabase-prod:/
    docker exec -ti -u root metabase-prod bash baixar_plugins.sh

else
        echo -e "\n \e[1;35m Plugins ja instalados \e[0m"
fi
