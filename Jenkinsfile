// pipeline {
//     agent any
//     stages{
//         stage ("build") {
//             steps{
//                 echo "hi"
//             }
//         }
//         stage ("deploy") {
//             steps{
//                 echo "hello"
//             }
//         }
//     }
// }

pipeline {
    agent {
        node {
            label 'AGENT-1'
        }
    }
    // environment {
    //     packageVersion = ''
    //     nexusURL = '172.31.83.26:8081'
    // }
    options {
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds()
    }
    parameters {
        string(name: 'version', defaultValue: '1.0.0', description: 'artifact version')
        string(name: 'environment', defaultValue: 'dev', description: 'environment')
    }
    //build
    stages {
        stage('Deploy') {
            steps {
               sh """
                  echo "version: ${params.version}"
               """
            }
        }
        stage('install dependencies') {
            steps {
               sh """
                   npm install
               """
            }
        }
        stage('Build') {
            steps {
                sh """
                    ls -la
                    zip -q -r catalogue.zip ./* -x ".git" -x ".zip"
                    ls -ltr
                """
            }
        }
        stage('Public artifact') {
            steps {
                nexusArtifactUploader(
                    nexusVersion: 'nexus3',
                    protocol: 'http',
                    nexusUrl: "${nexusURL}",
                    groupId: 'com.roboshop',
                    version: "${packageVersion}",
                    repository: 'catalogue',
                    credentialsId: 'nexus-auth',
                    artifacts: [
                        [artifactId: 'catalogue',
                        classifier: '',
                        file: 'catalogue.zip',
                        type: 'zip']
                    ]
                )
            }
        }
        stage('Deploy') {
            steps {
                sh """
                    echo 'Here i wrote shell script'
                """
            }
        }
    }
    //post build
    post {
        always {
            echo 'I will always say HELLO again'
            deleteDir()
        }
        failure {
            echo 'This run when pipeline failed'
        }
        success {
            echo 'This pipeline is sucess'
        }
    }
}

