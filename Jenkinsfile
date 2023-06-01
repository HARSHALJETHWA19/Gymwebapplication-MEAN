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
                        sh 'npm run build &'
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
                sh 'npm install --force'
                if (isUnix()) {
                    sh 'node server.js &'
                } else {
                    bat 'start /B cmd /c node server.js'
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
