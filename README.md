# docker
show running container : docker ps

show all running and stopped container : docker ps -a

get running container terminal : docker exec -it 4c3bef43a21c /bin/bash

run docker like : docker run -d -p 9000:80 -v /var/www/:/var/www/html/ apache2-php5:29062016

delete container : docker rm <container>

delete images : docker rmi <image>

