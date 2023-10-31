# Use an official Tomcat runtime as a base image
FROM tomcat:latest

# Copy the WAR file from your local machine to the Tomcat webapps directory
COPY target/helloworld.jar /usr/local/tomcat/webapps/

