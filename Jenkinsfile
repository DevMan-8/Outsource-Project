pipeline {
    agent any

    stages{

        stage{
            steps{
                agent { label 'worknode'}
                docker login --username=HoldingContainer --password=Admin@123
            }
            steps{
                docker login
            }
        }
        stage{
            agent { label 'worknode'}
            steps{
                sh 'docker build -t holdingcontainer/secondproject:latest .'

            }
        }
        stage{
            agent { label 'worknode'}
            steps{
                withDockerRegistry(credentialsId: 'DockerHub' , url: 'https://hub.docker.com/repository/docker/holdingcontainer/secondproject/general')
                    sh 'docker push holdingcontainer/secondproject:latest'
            }
        }

        stage('CD Stage'){
            steps{
                withDockerRegistry(credentialsId: 'DockerHub', url: 'https://hub.docker.com/repository/docker/holdingcontainer/secondproject/general')
                    sh '''
                    docker kill nginx:
                    docker run -d --rm -p 81:80 --name nginx holdingcontainer/secondproject:latest
                    '''
            }


        }
    }





}