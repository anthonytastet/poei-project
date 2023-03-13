FROM debian:11

#create workdir
RUN /bin/bash -c 'mkdir /opt/tomcat/'
WORKDIR /opt/tomcat

# install utilities
RUN /bin/bash -c 'apt update && \
    apt install -y \
    vim \
    curl \
    wget\
    sudo'

# upgrade packages
RUN /bin/bash -c 'apt upgrade -y'

# install Java 17 required by Jenkins
RUN /bin/bash -c 'apt update && \
    apt install -y openjdk-17-jdk'

# setup Java environment variables 
RUN /bin/bash -c 'echo "export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64" >> /etc/bash.bashrc && \
    source /etc/environment'

# install Apache Tomcat
RUN /bin/bash -c 'cd /tmp && \
    wget https://downloads.apache.org/tomcat/tomcat-10/v10.1.7/bin/apache-tomcat-10.1.7.tar.gz -O /tmp/tomcat.tar.gz && \
    tar xf tomcat.tar.gz && \
    cp -Rv /tmp/apache-tomcat-10.1.7/* /opt/tomcat/'

# install Apache Tomcat MySQL connector
RUN /bin/bash -c 'cd /tmp && \
    wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.39.tar.gz -O /tmp/mysql-connector-java.tar.gz && \
    tar xf mysql-connector-java.tar.gz && \
    cp mysql-connector-java-5.1.39/mysql-connector-java-5.1.39-bin.jar /opt/tomcat/lib/'

# cp du server.xml
COPY server.xml /opt/tomcat/conf/server.xml
RUN /bin/bash -c 'chmod 600 /opt/tomcat/conf/server.xml'

# cp du server.xml
COPY tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml
RUN /bin/bash -c 'chmod 600 /opt/tomcat/conf/tomcat-users.xml'

# cp du Bookstore.war
COPY target/Bookstore.war /opt/tomcat/webapps/bookstore.war
RUN /bin/bash -c 'chmod -x /opt/tomcat/webapps/bookstore.war'

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
