# ruby-in-docker

docker run -it --link mysql2:mys -p 4567:4567 hoochiecoo/mysql-restclient:latest bash

docker build . -t hoochiecoo/mysql-restclient
