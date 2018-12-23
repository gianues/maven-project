pipeline {
    agent any

    parameters {
         string(name: 'tomcat_stage', defaultValue: 'localhost:8090', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: 'localhost:8095', description: 'Production Server')
    }

    triggers {
         // poll every minute
         pollSCM('* * * * *')
    }

    stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage ('Deployments'){
            parallel{
                stage ('Deploy to Staging'){
                    steps {
                        sh "cp **/target/*.war {params.tomcat_stage}:/Users/gian/Development/servers/apache-tomcat-8.5.37/webapps"
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                        //sh "scp -i /home/jenkins/tomcat-demo.pem **/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat7/webapps"
                        sh "cp **/target/*.war {params.tomcat_prod}:/Users/gian/Development/servers/apache-tomcat-8.5.37-prod/webapps"
                    }
                }
            }
        }
    }
}
