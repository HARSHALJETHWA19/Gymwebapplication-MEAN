pipeline {
    agent any

    stages {
       

        stage('Build Frontend') {
            steps {
                // Install Node.js and npm if not already installed on the Jenkins machine
                // Use a specific Node.js version if required
                sh 'nvm install 14.20'

                // Install Angular CLI globally
                sh 'npm install -g @angular/cli'

                // Install frontend dependencies
                sh 'npm install'

                // Build the frontend
                sh 'ng build'
            }
        }

        stage('Build Backend') {
            steps {
                // Install Node.js and npm if not already installed on the Jenkins machine
                // Use a specific Node.js version if required
                sh 'nvm install 14.20'

                // Install backend dependencies
                sh 'npm install'

                sh 'node server.js'
            }
        }

       

        stage('Deploy') {
            steps {
                // Start MongoDB
                 sh 'ng build'

                // Start the Node.js backend server
                sh 'node server.js'

                // Serve the Angular frontend using a web server like Nginx or Apache
                 sh 'nginx -c /path/to/nginx.conf'

                // Add any additional deployment steps or configurations
                // Example: sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
