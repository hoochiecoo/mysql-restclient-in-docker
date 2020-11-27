# ruby-in-docker

# run mys
docker run -p 3306:3306 --name mysql2 -e MYSQL_ROOT_PASSWORD=rootpassword -d mysql --default-authentication-plugin=mysql_native_password
# run and link adminer
docker run d- --link mysql2:mys -p 8080:8080 adminer
# run ruby
docker run -it --link mysql2:mys -p 4567:4567 hoochiecoo/mysql-restclient:latest bash

docker build . -t hoochiecoo/mysql-restclient

docker run -it --link mysql2:mys -p 4567:4567 hoochiecoo/mysql-restclient:latest
