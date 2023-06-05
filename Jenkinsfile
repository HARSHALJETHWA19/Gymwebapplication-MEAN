pipeline {
    agent any

    tools {
        nodejs 'node' // Assumes you have configured Node.js in Jenkins Global Tool Configuration
    }
    
    stages {
        stage('Build Frontend') {
            steps {
                script {
                    // Determine the operating system
                    def isUnix = isUnix()

                    if (isUnix) {
                        retry(3) {
                            sh 'npm install -g @angular/cli'
                            sh 'npm install'
                            sh 'npm run build'
                            // Start the Angular app in a Docker container
                            sh 'docker run -p 4200:4200 -d harshal1903/frontend-app:latest'
                        }
                        // Wait for the server to start
                        sleep 10
                        // Open the application in the browser
                        sh 'xdg-open http://localhost:4200'
                    } else {
                        retry(3) {
                            bat 'npm install -g @angular/cli'
                            bat 'npm install'
                            bat 'npm run build'
                            // Start the Angular app in a Docker container
                            bat 'start /B cmd /c start docker run -p 4200:4200 -d harshal1903/frontend-app:latest'
                        }
                        // Wait for the server to start
                        sleep 10
                        // Open the application in the browser
                        bat 'start /B cmd /c start http://localhost:4200'
                    }
                }
            }
        }


        stage('Build Backend') {
            steps {
                script {
                    // Determine the operating system
                    def isUnix = isUnix()

                    if (isUnix) {
                        // Uncomment the necessary commands for Unix systems
                        // Wait for the server to start
                         sh 'docker run -p 4200:4200 -d harshal1903/backend-app:latest'
                        sleep 10
                        // Open the application in the browser
                        sh 'xdg-open http://localhost:3000'
                    } else {
                        // Uncomment the necessary commands for Windows systems
                        // Wait for the server to start
                         bat 'start /B cmd /c start docker run -p 4200:4200 -d harshal1903/backend-app:latest'
                        
                        // Open the application in the browser
                        bat 'start /B cmd /c start http://localhost:3000'
                    }

                    // sh 'timeout 9999 >NUL' // To keep the pipeline running
                }
            }
        }
    }
}






        // stage('Deploy') {
        //     steps {
        //         script {
        //             if (isUnix()) {
        //                 sh 'npm run build'
        //                 sh 'node server.js'
        //             } else {
        //                 bat 'npm run build'
        //                 bat 'start /B node server.js'
        //             }
        //         }
        //         // Additional deployment steps or configurations can be added here
        //     }
        // }
//     }
// }

// pipeline {
//     agent any

//     stages {
//         stage('Build') {
//             steps {
//                 // Install Node.js and npm
//                 tool 'NodeJS' // Assuming you have configured a NodeJS installation in Jenkins
//                 sh 'npm install' // Install dependencies
//                 sh 'npm install -g @angular/cli'
                
//                 // Build the project
//                 sh 'npm run build' // Replace <path_to_npm_executable> with the actual path to npm executable
//             }
//         }
        
//         stage('backend') {
//             steps {
//                 // Add deployment steps here
//                 // For example, you can deploy the built files to a server or a hosting platform
//                  if (isUnix()) {
//                         sh 'npm run build'
//                         sh 'node server.js'
//                     } else {
//                         bat 'npm run build'
//                         bat 'start /B node server.js'
//                     }
//             }
//         }
//     }
// // }
// pipeline {
//     agent any
// tools {
//         nodejs 'node' // Assumes you have configured Node.js in Jenkins Global Tool Configuration
//     }
//     stages {
//         stage('Build') {
//             steps {
//                 // Install Node.js and npm
//                 // tool 'node' // Assuming you have configured a NodeJS installation in Jenkins
//                 sh 'npm install --force' // Install dependencies
                
//                 // Build the project
//                 if (isUnix()) {
//                     sh 'npm run build'
//                 } else {
//                     bat 'npm run build'
//                 }
//             }
//         }
        
//         stage('Deploy') {
//             steps {
//                 // Add deployment steps here
//                 // For example, you can deploy the built files to a server or a hosting platform
                
//                 // Run the server
//                 if (isUnix()) {
//                     sh 'node server.js'
//                 } else {
//                     bat 'start /B node server.js'
//                 }
//             }
//         }
//     }
// }
