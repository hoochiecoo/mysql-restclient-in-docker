[![Hits-of-Code](https://hitsofcode.com/github/hoochiecoo/mysql-restclient-in-docker?branch=master)](https://hitsofcode.com/github/hoochiecoo/mysql-restclient-in-docker?branch=master/view?branch=master)

# ruby-in-docker

# run mys
docker run -p 3306:3306 --name mysql2 -e MYSQL_ROOT_PASSWORD=rootpassword -d mysql --default-authentication-plugin=mysql_native_password
# run and link adminer
docker run -d --link mysql2:mys -p 8080:8080 adminer
# run ruby
docker run -it --link mysql2:mys -p 4567:4567 hoochiecoo/mysql-restclient:latest bash

docker build . -t hoochiecoo/mysql-restclient

docker run -it --link mysql2:mys -p 4567:4567 hoochiecoo/mysql-restclient:latest


docker run -it --link mysql2:mys -p 4567:4567 -e MYSQL_RESTCLIENT_HOST=mys -e MYSQL_RESTCLIENT_USERNAME=root -e MYSQL_RESTCLIENT_PASSWORD=rootpassword -e MYSQL_RESTCLIENT_DB=mysql hoochiecoo/mysql-restclient:latest
