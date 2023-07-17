pipeline {
    
    agent any
    stages {
        stage('Login') {
            agent { label 'worknode'}
            steps {
                script {
                    // Assuming 'HoldingContainer' is the Docker Hub username and 'Admin@123' is the password
                    sh 'docker login --username checkmate123 --password Saadawais@123 '
                }
            }
        }
        stages {
            stage('Docker Build') {
                agent { label  'workernode'}
                    steps {
                        sh 'docker build -t checkmate123/outsource:latest .'
                    }    
            }
        }
        stage('Push') {
            agent {
                label 'worknode'
            }
            steps {
                script {
                    withDockerRegistry(credentialsId: 'DockerHub', url: 'https://index.docker.io/v1/') {
                    sh 'docker push checkmate123/outsource:latest'
                    }
                }
            }
        }
        stage('CD Stage') {
            steps {
                sh 'docker run -d --rm -p 81:80 --name nginx checkmate123/outsource:latest'
            }
        }
    }
}
