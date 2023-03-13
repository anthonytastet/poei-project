firewall-cmd --add-port=18080/tcp --permanent
firewall-cmd --add-port=18081/tcp --permanent
cat /opt/sonatype-work/nexus3/admin.password
cat /var/lib/jenkins/secrets/intialAdminPassword

    	<!-- <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    	<maven.compiler.source>17</maven.compiler.source>
    	<maven.compiler.target>17</maven.compiler.target> -->

        			<!--
			<plugin>
			      <groupId>org.apache.maven.plugins</groupId>
			      <artifactId>maven-enforcer-plugin</artifactId>
			      <executions>
				<execution>
				  <id>enforce-versions</id>
				  <goals>
				    <goal>enforce</goal>
				  </goals>
				  <configuration>
				    <rules>
				      <requireJavaVersion>
					<version>17.0.1</version>
				      </requireJavaVersion>
				    </rules>
				  </configuration>
				</execution>
			      </executions>
            </plugin>
			<plugin>
			-->

            					<!-- <release>17</release> -->