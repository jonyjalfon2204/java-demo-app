pipeline {
    agent {label 'pod-dind'}
    environment {
        DOCKER_BUILDKIT = 1
    }
 
    stage('Build'){
        steps{
          container('dind'){
            sh  'docker build -t java-docker --target test .'
          }
        }
    }
}
