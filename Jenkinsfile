pipeline {
  agent any
  tools {
    maven 'localMaven'
  }
  stages {
    stage('Build'){
      steps {
        sh 'mvn clean package'
      }
      post {
        success {
          echo 'Now archiving...'
          archiveArtifacts artifacts: '**/target/*.war'
        }
      }
    }
    stage('Deploy to Staging') {
      steps {
        // 'deploy-to-staging is a Jenkins job'
        build job: 'deploy-to-staging'
      }
    }
  }
}
