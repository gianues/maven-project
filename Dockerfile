# use the tomcat:8.0 as base version for this container
FROM tomcat:8.0

# runs from the Jenkins working dir
# and adds the war file to the docker folder tomcat/webapps
ADD ./webapp/target/*.war /usr/local/tomcat/webapps/

# expose the port 8080 (this is the port from the image,
# not the host that we will run it later)
EXPOSE 8080

# run a cmd that runs tomcat with parameter run
CMD ["catalina.sh", "run"]
