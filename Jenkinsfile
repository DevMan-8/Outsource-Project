pipeline {
    agent {
        label "worknode"
    }
    stages {
        stage('Build') {
            steps {
                git 'https://github.com/your/repo.git'
                script {
                    docker.build("nginx-image", "-f Dockerfile .")
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.image('nginx-image').withRun('-p 80:80') { container ->
                        // Perform any additional deployment steps here
                        // For example, you could run tests or execute commands inside the container
                    }
                }
            }
        }
    }
}
