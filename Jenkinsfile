pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "harsha7633/flask-app:latest"
        DOCKER_CREDENTIALS_ID = "dockercred"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/harsha5401/pycode18march.git'
            }
        }
        stage('Login to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
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
          stage('test') {
            steps {
                sh ' ./test_api.sh'
            }
          }
        
    }
}
