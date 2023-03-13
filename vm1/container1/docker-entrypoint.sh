#!/bin/bash

jenkins > /tmp/jenkinslog 2>&1 &
su nexus -c "/opt/nexus/bin/nexus start";
bash
# cat /opt/sonatype-work/nexus3/admin.password;
cat /tmp/jenkinslog | more

# echo $JENKINS_HOME
# echo $JENKINS_PORT
# cat /var/lib/jenkins/secrets/intialAdminPassword