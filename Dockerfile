FROM tomcat:alpine

LABEL maintainer="Heena Mittal"

RUN wget -O /usr/local/tomcat/webapps/launchstation04.war http://localhost:8081/artifactory/demo-application/com/example/demo-application-exec/0.0.1-SNAPSHOT/demo-application-exec-0.0.1.war

EXPOSE 9100

CMD /usr/local/tomcat/bin/cataline.sh run