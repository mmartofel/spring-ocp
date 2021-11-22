FROM registry.access.redhat.com/openjdk/openjdk-11-rhel7:latest

# If you have your jar built locally it's enough to copy it over
# COPY target/*.jar app.jar

COPY .mvn ./.mvn
COPY mvnw .
COPY pom.xml .
COPY src ./src

# Build your jar and copy to your current dir to run from
RUN ./mvnw clean package
RUN cp target/*.jar app.jar

ENTRYPOINT ["java","-jar","app.jar"]

EXPOSE 8080/tcp
