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

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]