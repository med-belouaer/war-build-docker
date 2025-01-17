FROM tomcat:8

ENV JAVA_OPTS="$JAVA_OPTS -javaagent:/usr/local/tomcat/jmx_prometheus_javaagent.jar=8686:/usr/local/tomcat/tomcat-jmx-exporter.yml"

COPY tomcat-jmx-exporter.yml /usr/local/tomcat/
COPY jmx_prometheus_javaagent.jar /usr/local/tomcat/

COPY target/hello-world-war-1.0.0.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
EXPOSE 8686
