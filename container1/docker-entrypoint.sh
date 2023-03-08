#!/bin/bash

su nexus -c "/opt/nexus/bin/nexus start";
jenkins;

# echo $JENKINS_HOME
# echo $JENKINS_PORT
# cat /var/lib/jenkins/secrets/intialAdminPassword