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
        stage('print version') {
            steps {
               sh """
                  echo "version: ${params.version}"
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

