pipeline {
    agent {
        label "worknode"
    }
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/DevMan-8/Outsource-Project.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry('', 'dockerhub') {
                        def dockerImage = docker.build("nginx:${env.BUILD_NUMBER}", "-f Dockerfile .")
                        dockerImage.push()
                    }
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    docker.run("-p 80:80 --name nginx-${env.BUILD_NUMBER} nginx:${env.BUILD_NUMBER}")
                }
            }
        }
    }
}
