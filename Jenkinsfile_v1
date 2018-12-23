pipeline {
  agent any
  tools {
    maven 'localMaven'
  }
  stages {
    // Build
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
    // Deploy to Staging
    stage('Deploy to Staging') {
      steps {
        // 'deploy-to-staging is a Jenkins job'
        build job: 'deploy-to-staging'
      }
    }
    // Deploy to Production
    stage('Deploy to Production') {
      steps {
        // fails if nobody approves within 5 days
        timeout(time:5, unit:'DAYS') {
          input message: 'Approve Production Deployment?'
        }
        // 'deploy-to-production is a Jenkins job'
        build job: 'deploy-to-production'
      }
      post {
        success {
          echo 'Successfully deployed to production'
        }
        failure {
          echo 'Failed to deploy to production'
        }
      }
    }
  }
}
