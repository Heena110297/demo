FROM tomcat:alpine

LABEL maintainer="Heena Mittal"

RUN wget -O /usr/local/tomcat/webapps/ROOT.war -U admin:Learning http://192.168.18.90:8082/artifactory/demoArtifactory/com/nagarro/nagp/demo/0.0.1-SNAPSHOT/demo-0.0.1-SNAPSHOT.war

EXPOSE 9100
