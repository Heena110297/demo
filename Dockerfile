FROM tomcat:alpine

LABEL maintainer="Heena Mittal"

RUN curl -O /usr/local/tomcat/webapps/launchstation04.war  http://localhost:8082/artifactory/demoArtifactory/com/nagarro/nagp/demo/0.0.1-SNAPSHOT/demo-0.0.1-SNAPSHOT.war

EXPOSE 9100

CMD /usr/local/tomcat/bin/cataline.bat run