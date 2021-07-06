FROM tomcat:8.5.50-jdk8-openjdk

ARG WAR_FILE
ARG CONTEXT
ARG HOST_UID
ARG HOST_GID

COPY ${WAR_FILE} /usr/local/tomcat/webapps/${CONTEXT}.war

USER root

RUN groupmod -g ${HOST_GID} jenkins
RUN usermod -u ${HOST_UID} -g ${HOST_GID} jenkins

USER jenkins
