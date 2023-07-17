pipeline {
    agent any
    stages {
        stage('Login') {
            agent {
                label 'worknode'
            }
            steps {
                    // Assuming 'HoldingContainer' is the Docker Hub username and 'Admin@123' is the password
                sh 'docker login --username checkmate123 --password Saadawais@123'
            }
        }
        stage('Docker Build') {
            agent {
                label 'workernode'
            }
            steps {
                sh 'docker build -t checkmate123/outsource:latest .'
            }
        }
        stage('Push') {
            agent {
                label 'worknode'
            }
            steps {
                sh 'docker push checkmate123/outsource:latest'
            }
        }
        stage('CD Stage') {
            steps {
                sh 'docker run -d --rm -p 81:80 --name nginx checkmate123/outsource:latest'
            }
        }
    }
}
