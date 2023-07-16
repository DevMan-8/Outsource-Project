pipeline {
    agent any
    stages {
        stage('Login') {
            steps {
                script {
                    // Assuming 'HoldingContainer' is the Docker Hub username and 'Admin@123' is the password
                    docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {
                        docker.login('HoldingContainer', 'Admin@123')
                    }
                }
            }
        }
        stage('Build') {
            agent {
                label 'worknode'
            }
            steps {
                script {
                    docker.build('holdingcontainer/secondproject:latest', '.')
                }
            }
        }
        stage('Push') {
            agent {
                label 'worknode'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {
                        docker.image('holdingcontainer/secondproject:latest').push()
                    }
                }
            }
        }
        stage('CD Stage') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {
                        docker.image('holdingcontainer/secondproject:latest').run('-d --rm -p 81:80 --name nginx')
                    }
                }
            }
        }
    }
}