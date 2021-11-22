
docker stop -t 1 spring-boot
docker rm spring-boot

docker build -t spring-boot/demo:latest .

docker run -d -p 8080:8080 --name spring-boot spring-boot/demo:latest

# docker exec -ti spring-boot /bin/bash

