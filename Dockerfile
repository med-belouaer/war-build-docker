FROM tomcat:8
COPY catalina.sh /usr/local/tomcat/bin/
COPY tomcat-jmx-exporter.yml /usr/local/tomcat/
COPY jmx_prometheus_javaagent.jar /usr/local/tomcat/
COPY target/hello-world-war-1.0.0.war /usr/local/tomcat/webapps/ROOT.war
COPY target/hello-world-war-1.0.0/ /usr/local/tomcat/webapps/ROOT

EXPOSE 8080

