pipeline {
  agent any

  environment {
    DOCKER_IMAGE = "harsha7633/flask:latest"
    DOCKER_CREDENTIALS_ID ="dockercred"
  }
  stages {
    stage ('clone repo') {
      steps {
        git credentialsId: 'githubcred', url: 'https://github.com/harsha5401/StreakAI18march.git',branch:'main'
      }
    }
    stage('docker login'){
      steps {
        script{
          withcredentials([usernamepassword(credentailsID: DOCKER_CREDENTIALS_ID,usernameVariable:'DOCKER_USER',passwordvariable:'DOCKER_PASS')]){
             sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                    }
                }
            }
    }
    stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }
    stage('Push to Docker Hub') {
            steps {
                script {
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }
    stage('Remove image') {
            steps {
                script {
                    sh "docker rmi ${DOCKER_IMAGE}"
                }
            }
        }
    stage('test') {
            steps {
                sh ' ./test_api.sh'
                
        }
    }
} 
}  
