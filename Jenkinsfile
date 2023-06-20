pipeline {
    agent any

    tools {
        nodejs 'node' 
        // docker 'docker'// Assumes you have configured Node.js in Jenkins Global Tool Configuration
    }

     stages {
        stage('Pull Docker Image') {
            steps {
                // withCredentials([usernamePassword(credentialsId: 'docker-registry-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh "docker login -u harshal1903 -p Harshal190103"
                    // sh "docker pull my-docker-registry.com/my-image:tag"
                    sh "docker pull harshal1903/backend-app:latest"
                  sh "docker pull harshal1903/frontend-app:latest"
                  sh "docker pull harshal1903/my-mongodb"
                }
            }
        

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
                        retry(3) {
                            sh 'npm install -g @angular/cli'
                            sh 'npm install'
                            sh 'npm run build'
                            // Start the backend app in a Docker container
                            sh 'docker run -p 3000:3000 -d -e MONGO_HOST=localhost -e MONGO_PORT=27017 harshal1903/backend-app:latest'
                            // Wait for the server to start
                            sleep 10
                            // Connect to MongoDB
                            sh 'docker run -it -e MONGO_HOST=localhost -d -e MONGO_PORT=27017 my-mongodb  mongosh "mongodb+srv://cluster0.rz3xfvy.mongodb.net/" --apiVersion 1 --username jethwaharshal5 --password Harshal19'
                        }
                        // Open the application in the browser
                        sh 'xdg-open http://localhost:3000'
                    } else {
                        retry(3) {
                            bat 'npm install -g @angular/cli'
                            bat 'npm install'
                            bat 'npm run build'
                            // Start the backend app in a Docker container
                            bat 'docker run -p 3000:3000 -d -e MONGO_HOST=localhost -e MONGO_PORT=27017 harshal1903/backend-app:latest'
                        }
                        // Wait for the server to start
                        sleep 10
                        // Connect to MongoDB
                        bat 'docker run -d -it -e MONGO_HOST=localhost -e MONGO_PORT=27017 my-mongodb  mongosh "mongodb+srv://cluster0.rz3xfvy.mongodb.net/" --apiVersion 1 --username jethwaharshal5 --password Harshal19'
                        // Open the application in the browser
                        bat 'start /B cmd /c start http://localhost:3000'
                    }
                }
            }
        }
    }
}







//  pipeline {
//     agent any

//     tools {
//         nodejs 'node' // Assumes you have configured Node.js in Jenkins Global Tool Configuration
//     }
    
//     stages {
//         stage('Build Frontend') {
//             steps {
//                 script {
//                     // Determine the operating system
//                     def isUnix = isUnix()

//                     if (isUnix) {
//                         retry(3) {
//                             sh 'npm install -g @angular/cli'
//                             sh 'npm install'
//                             sh 'npm run build'
//                             // Start the Angular app in a Docker container
//                             sh 'docker run -p 4200:4200 -d harshal1903/frontend-app:latest'
//                         }
//                         // Wait for the server to start
//                         sleep 10
//                         // Open the application in the browser
//                         sh 'xdg-open http://localhost:4200'
//                     } else {
//                         retry(3) {
//                             bat 'npm install -g @angular/cli'
//                             bat 'npm install'
//                             bat 'npm run build'
//                             // Start the Angular app in a Docker container
//                             bat 'start /B cmd /c start docker run -p 4200:4200 -d harshal1903/frontend-app:latest'
//                         }
//                         // Wait for the server to start
//                         sleep 10
//                         // Open the application in the browser
//                         bat 'start /B cmd /c start http://localhost:4200'
//                     }
//                 }
//             }
//         }


//         stage('Build Backend') {
//             steps {
//                 script {
//                     // Determine the operating system
//                     def isUnix = isUnix()

//                 if (isUnix) {
//                         // Uncomment the necessary commands for Unix systems
//                          sh 'npm install -g @angular/cli'
//                             sh 'npm install'
//                             sh 'npm run build'
//                             // Start the Angular app in a Docker container
//                             sh 'start /B cmd /c start docker run -p 3000:3000 -d harshal1903/backend-app:latest'
//                             sh 'node server.js'
//                         // sh 'npm start'

//                         // Wait for the server to start
//                         sleep 10

//                         // Open the application in the browser
//                         sh 'xdg-open http://localhost:3000'
//                     } else {
//                         // Uncomment the necessary commands for Windows systems
//                             bat 'npm install -g @angular/cli'
//                             bat 'npm install'
//                             bat 'npm run build'
//                             // Start the Angular app in a Docker container
//                             bat 'docker run -p 3000:3000 -d harshal1903/backend-app:latest'

//                         // Open the application in the browser
//                         bat 'start /B cmd /c start http://localhost:3000'
//                     }

//                     // sh 'timeout 9999 >NUL' // To keep the pipeline running
//                 }
//             }
//         }
//     }
// }






//         // stage('Deploy') {
//         //     steps {
//         //         script {
//         //             if (isUnix()) {
//         //                 sh 'npm run build'
//         //                 sh 'node server.js'
//         //             } else {
//         //                 bat 'npm run build'
//         //                 bat 'start /B node server.js'
//         //             }
//         //         }
//         //         // Additional deployment steps or configurations can be added here
//         //     }
//         // }
// //     }
// // }

// // pipeline {
// //     agent any

// //     stages {
// //         stage('Build') {
// //             steps {
// //                 // Install Node.js and npm
// //                 tool 'NodeJS' // Assuming you have configured a NodeJS installation in Jenkins
// //                 sh 'npm install' // Install dependencies
// //                 sh 'npm install -g @angular/cli'
                
// //                 // Build the project
// //                 sh 'npm run build' // Replace <path_to_npm_executable> with the actual path to npm executable
// //             }
// //         }
        
// //         stage('backend') {
// //             steps {
// //                 // Add deployment steps here
// //                 // For example, you can deploy the built files to a server or a hosting platform
// //                  if (isUnix()) {
// //                         sh 'npm run build'
// //                         sh 'node server.js'
// //                     } else {
// //                         bat 'npm run build'
// //                         bat 'start /B node server.js'
// //                     }
// //             }
// //         }
// //     }
// // // }
// // pipeline {
// //     agent any
// // tools {
// //         nodejs 'node' // Assumes you have configured Node.js in Jenkins Global Tool Configuration
// //     }
// //     stages {
// //         stage('Build') {
// //             steps {
// //                 // Install Node.js and npm
// //                 // tool 'node' // Assuming you have configured a NodeJS installation in Jenkins
// //                 sh 'npm install --force' // Install dependencies
                
// //                 // Build the project
// //                 if (isUnix()) {
// //                     sh 'npm run build'
// //                 } else {
// //                     bat 'npm run build'
// //                 }
// //             }
// //         }
        
// //         stage('Deploy') {
// //             steps {
// //                 // Add deployment steps here
// //                 // For example, you can deploy the built files to a server or a hosting platform
                
// //                 // Run the server
// //                 if (isUnix()) {
// //                     sh 'node server.js'
// //                 } else {
// //                     bat 'start /B node server.js'
// //                 }
// //             }
// //         }
// //     }
// // }
