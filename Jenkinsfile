pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "harsha7633/flask-app:latest"
        DOCKER_CREDENTIALS_ID = "dockercred"
        CONTAINER_NAME = "flask_app"
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
        stage('Run Container') {
            steps {
                script {
                    sh "docker run -d -p 5000:5000 --name ${CONTAINER_NAME} ${DOCKER_IMAGE}"
                    sleep 5 // Wait for container to start
                }
            }
        }
        stage('Run API Tests') {
            steps {
                script {
                    sh './test_api.sh'
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
        stage('Cleanup') {
            steps {
                script {
                    sh """
                        docker stop ${CONTAINER_NAME} || true
                        docker rm ${CONTAINER_NAME} || true
                        docker rmi -f ${DOCKER_IMAGE} || true
                        docker system prune -f
                    """
                }
            }
        }
    }
}
