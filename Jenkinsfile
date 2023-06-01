pipeline {
    agent any

    tools {
        nodejs 'node' // Assumes you have configured Node.js in Jenkins Global Tool Configuration
    }
    stages {
        stage('Build Frontend') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'npm install -g @angular/cli'
                        sh 'npm install'
                        sh 'nohup npm run build &'
                    } else {
                        bat 'npm install -g @angular/cli'
                        bat 'npm install'
                        bat 'start /B cmd /c npm run build'
                    }
                }
            }
        }

        stage('Build Backend') {
            steps {
                sh 'npm install'
                sh 'node server.js'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'npm run build'
                        sh 'node server.js'
                    } else {
                        bat 'npm run build'
                        bat 'start /B node server.js'
                    }
                }
                // Additional deployment steps or configurations can be added here
            }
        }
    }
}
