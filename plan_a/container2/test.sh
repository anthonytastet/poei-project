# upgrade system
yum update

# install utilities
yum install -y unzip procps

# install Java 11 required by Sonarqube
# yum -y java-11-openjdk

# install PostgreSQL 13
yum install -y postgresql postgresql-contrib

# install Sonarqube
cd /tmp/ && wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.0.43852.zip && unzip sonarqube*.zip -d /opt && rm sonarqube*.zip && mv /opt/sonarqube* /opt/sonarqube

# setup Java environment variables 
# echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk" >> /etc/bash.bashrc && source /etc/environment


# setup PostgreSQL
userdel -r postgres && adduser --disabled-password --gecos "" --shell "/bin/bash" postgres && mkdir -p /usr/local/pgsql && chown -R postgres /usr/local/pgsql && chown -R postgres /var/run/postgresql

# echo "alias psql=/usr/lib/postgresql/13/bin/psql" >> /etc/bash.bashrc && echo "alias initdb=/usr/lib/postgresql/13/bin/initdb" >> /etc/bash.bashrc && echo "alias pg_ctl=/usr/lib/postgresql/13/bin/pg_ctl" >> /etc/bash.bashrc && source /etc/bash.bashrc'

# USER postgres
su sonar -c '/usr/lib/postgresql/13/bin/initdb -D /usr/local/pgsql/data && /usr/lib/postgresql/13/bin/pg_ctl -D /usr/local/pgsql/data -l /home/postgres/logfile start && /usr/lib/postgresql/13/bin/createuser -w sonar && psql -c "CREATE DATABASE sonarqube OWNER sonar;" && psql -c "grant all privileges on DATABASE sonarqube to sonar;"'


# setup Sonarqube
echo "sonarqube   -   nofile   65536" >> /etc/security/limits.conf && echo "sonarqube   -   nofile   65536" >> /etc/security/limits.conf && groupadd sonar && useradd -c "user to run SonarQube" -d /opt/sonarqube -g sonar sonar && chown sonar:sonar /opt/sonarqube -R && echo "sonar.jdbc.username=sonar" >> /opt/sonarqube/conf/sonar.properties && echo "sonar.jdbc.password=sonar" >> /opt/sonarqube/conf/sonar.properties && echo "RUN_AS_USER=sonar" >> /opt/sonarqube/bin/linux-x86-64/sonar.sh

