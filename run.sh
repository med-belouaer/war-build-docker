#!/bin/bash
set -e
TOMCAT_VERSION_TAG=8.0
JMX_AGENT_VERSION=0.3.1
JMX_AGENT_PORT=8686
JMX_AGENT_URL="https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/$JMX_AGENT_VERSION/jmx_prometheus_javaagent-$JMX_AGENT_VERSION.jar"
TOMCAT_CONFIG_YAML_URL="https://raw.githubusercontent.com/prometheus/jmx_exporter/master/example_configs/tomcat.yml"

TIME_STRING=`date +%Y%m%d%H%M%S`

rm -rf DockerBuild-$TIME_STRING
mkdir DockerBuild-$TIME_STRING

# Get tomcat-jmx-exporter.yaml and jmx_prometheus_javaagent.jar
curl -L -o DockerBuild-$TIME_STRING/tomcat-jmx-exporter.yml $TOMCAT_CONFIG_YAML_URL
curl -L -o DockerBuild-$TIME_STRING/jmx_prometheus_javaagent.jar $JMX_AGENT_URL

# Modify Dockerfile
cp -r Dockerfile target/ DockerBuild-$TIME_STRING

cd DockerBuild-$TIME_STRING
docker build -t tomcat-with-jmx-exporter:$TOMCAT_VERSION_TAG .

cd ..
rm -rf DockerBuild-$TIME_STRING
