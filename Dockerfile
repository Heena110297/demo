FROM tomcat:alpine

LABEL maintainer="Heena Mittal"

RUN wget -U jenkinsuser:Learning@% http://192.168.18.90:8082/artifactory/demoArtifactory/com/nagarro/nagp/demo/0.0.1-SNAPSHOT/demo-0.0.1-20200823.053346-18.war

EXPOSE 9100

CMD /usr/local/tomcat/bin/cataline.bat run