pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your source code from the repository
                // You can use Git or any other version control system here
                // Example: git 'https://github.com/your-repo.git'
            }
        }

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

        stage('Run Tests') {
            steps {
                // // Run frontend tests
                // sh 'cd frontend && ng test --watch=false'

                // // Run backend tests
                // sh 'cd backend && npm test'
            }
        }

        stage('Deploy') {
            steps {
                // Start MongoDB
                // Example: sh 'docker-compose up -d mongo'

                // Start the Node.js backend server
                // Example: sh 'cd backend && node server.js'

                // Serve the Angular frontend using a web server like Nginx or Apache
                // Example: sh 'nginx -c /path/to/nginx.conf'

                // Add any additional deployment steps or configurations
                // Example: sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
