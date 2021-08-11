pipeline {
    agent {label 'pod-dind'}
    environment {
        DOCKER_BUILDKIT = 1
    }
    stages {
        stage('Build'){
          steps{
            container('dind'){
              sh  'docker build -t jonyjalfon94/java-docker:$BUILD_NUMBER --target test .'
            }
          }
        }
        stage("Push image to DockerHub"){
            steps{
                container('dind'){
                    withCredentials([usernamePassword(credentialsId: 'test-creds-dockerhub', passwordVariable: 'docker-password', usernameVariable: 'docker-username')]) {
                        sh 'docker login -u $docker-username -p $docker-password'
                        sh 'docker push jonyjalfon94/java-docker:$BUILD_NUMBER'
                    }
                }
            }
        }
    }
}
