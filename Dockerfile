FROM openjdk:8u171-jre-alpine3.8

# Set version and paths
ENV JMETER_VERSION=4.0
ENV PLUGIN_MANAGER_VERSION=1.2
ENV JMETER_HOME=/usr/local/apache-jmeter-${JMETER_VERSION}
ENV PATH=${JMETER_HOME}/bin:${PATH}
ENV PLUGINS_PATH $JMETER_PATH/plugins

# Add your test scripts (will need a subfolder below your docker file name jmeter with your .jmx and datafiles -> .csv)
ADD /jmeter /usr/

# Install jmeter and plugins
RUN wget http://apache.mirror.amaze.com.au//jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz && \
tar -xzf apache-jmeter-${JMETER_VERSION}.tgz -C /usr/local/ && \
rm -rf apache-jmeter-${JMETER_VERSION}.tgz

# Add the ability to troubleshoot using Curl
RUN apk update; apk add curl

# Get jmeter plugin manager
ADD http://search.maven.org/remotecontent?filepath=kg/apc/jmeter-plugins-manager/1.2/jmeter-plugins-manager-1.2.jar /usr/local/apache-jmeter-4.0/lib/ext/jmeter-plugins-manager-${PLUGIN_MANAGER_VERSION}.jar

# Concurrent threads plugin ( bzm concurrent thread Group )
ADD http://central.maven.org/maven2/kg/apc/jmeter-plugins-casutg/2.5/jmeter-plugins-casutg-2.5.jar /usr/local/apache-jmeter-4.0/lib/ext/jmeter-plugins-casutg-2.5.jar

#ES backend listener to send logs to ES and view these in Kibana
ADD https://github.com/delirius325/jmeter-elasticsearch-backend-listener/releases/download/2.4.1-SNAPSHOT/jmeter.backendlistener.elasticsearch-2.4.1-SNAPSHOT.jar /usr/local/apache-jmeter-4.0/lib/ext/jmeter.backendlistener.elasticsearch-2.4.1-SNAPSHOT.jar
