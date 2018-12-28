pipeline {
    agent any

    tools {
      maven 'localMaven'
    }

    stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
                // build in the current dir using the Dockerfile
                // a container with this tag
                sh 'docker build . -t tomcatwebapp:${env.BUILD_ID}'
            }
        }
    }
}
