FROM openjdk:8-jdk-alpine

LABEL maintainer="heena.mittal@nagarro.com"

ADD target/demo-0.0.1-SNAPSHOT.jar demo-0.0.1-SNAPSHOT.jar

EXPOSE 9100

ENTRYPOINT ["java", "-jar","demo-0.0.1-SNAPSHOT.jar"]