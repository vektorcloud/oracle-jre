FROM quay.io/vektorcloud/glibc:latest

ENV JAVA_VERSION 8u171
ENV JAVA_VERSION_BUILD 11
ENV JAVA_PACKAGE server-jre
ENV JAVA_HASH 512cd62ec5174c3487ac17c61aaa89e8

# Download and unarchive Java
RUN apk add --no-cache curl wget tar bash && \
    mkdir /opt && wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" -O - \
    http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}-b${JAVA_VERSION_BUILD}/${JAVA_HASH}/${JAVA_PACKAGE}-${JAVA_VERSION}-linux-x64.tar.gz \
    | tar -xzf - -C /opt &&\
    ln -s /opt/jdk1.* /opt/jdk &&\
    rm -rf /opt/jdk/*src.zip \
           /opt/jdk/lib/missioncontrol \
           /opt/jdk/lib/visualvm \
           /opt/jdk/lib/*javafx* \
           /opt/jdk/jre/lib/plugin.jar \
           /opt/jdk/jre/lib/ext/jfxrt.jar \
           /opt/jdk/jre/bin/javaws \
           /opt/jdk/jre/lib/javaws.jar \
           /opt/jdk/jre/lib/desktop \
           /opt/jdk/jre/plugin \
           /opt/jdk/jre/lib/deploy* \
           /opt/jdk/jre/lib/*javafx* \
           /opt/jdk/jre/lib/*jfx* \
           /opt/jdk/jre/lib/amd64/libdecora_sse.so \
           /opt/jdk/jre/lib/amd64/libprism_*.so \
           /opt/jdk/jre/lib/amd64/libfxplugins.so \
           /opt/jdk/jre/lib/amd64/libglass.so \
           /opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
           /opt/jdk/jre/lib/amd64/libjavafx*.so \
           /opt/jdk/jre/lib/amd64/libjfx*.so

# Set environment
ENV JAVA_HOME /opt/jdk
ENV PATH ${PATH}:${JAVA_HOME}/bin
