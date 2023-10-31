# Use an official Tomcat runtime as a base image
FROM tomcat:latest

# Copy the WAR file from your local machine to the Tomcat webapps directory
COPY target/your-web-app.war /usr/local/tomcat/webapps/

