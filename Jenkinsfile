pipeline {
    agent {label 'pod-dind'}
    environment {
        DOCKER_BUILDKIT = 1
    }
    stages {
        stage('Build'){
          steps{
            container('dind'){
              sh  'docker build -t java-docker --target test .'
            }
          }
        }
    }

}
