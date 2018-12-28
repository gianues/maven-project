pipeline {
    agent any

    tools {
      maven 'localMaven'
      docker 'localDocker'
    }

    stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
                // build in the current dir using the Dockerfile
                // a container with this tag (note the "" instead of '' to be able to use the env.build_id)
                sh "docker build . -t tomcatwebapp:${env.BUILD_ID}"
            }
        }
    }
}
