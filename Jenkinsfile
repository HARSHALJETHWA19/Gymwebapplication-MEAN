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
                        sh 'nohup npm install -g @angular/cli & npm install & npm run build'
                          
                    } else {
                        bat 'start /B npm install -g @angular/cli'
                    }
                }
           }

        stage('Build Backend') {
            steps {
                // Install Node.js and npm if not already installed on the Jenkins machine
                // Use a specific Node.js version if required
//                 sh 'nvm install 14.20'

                // Install backend dependencies
                sh 'npm install'

                sh 'node server.js'
            }
        }

       

        stage('Deploy') {
            steps {
                // Start MongoDB
                 sh 'npm run build'

                // Start the Node.js backend server
                sh 'node server.js'

                // Serve the Angular frontend using a web server like Nginx or Apache
//                  sh 'nginx -c /path/to/nginx.conf'

                // Add any additional deployment steps or configurations
                // Example: sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
