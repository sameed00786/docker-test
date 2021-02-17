FROM tomcat:9.0.43-jdk15-openjdk-oraclelinux7
COPY /var/lib/jenkins/workspace/automate_java_app/target/springboot-hellowolrd-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
EXPOSE 8090