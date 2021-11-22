
docker login quay.io

docker image tag spring-boot/demo quay.io/mmartofe/spring-boot:latest
docker images | grep spring-boot
docker image push quay.io/mmartofe/spring-boot:latest


