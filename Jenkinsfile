pipeline {
    agent any

    environment {
        IMAGE_NAME = "b2b-api"
        IMAGE_TAG = "snapshot"
        CONTAINER_NAME = "b2b-api"
        PORT = "8101"
    }

    stages {
        stage('Pull cambios') {
            steps {
                // Pull desde el repo
                git branch: 'main', url: 'https://github.com/INGOR0/jenkins-test.git'
            }
        }

        stage('Constuir la imagen Docker') {
            steps {
                // Cosntruye la imagen con el Dockerfile
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Detener contenedor antiguo') {
            steps {
                // Borrar el anterior contenedor
                sh 'docker rm -f $CONTAINER_NAME || true'
            }
        }

        stage('Hacer contenedor nuevo') {
            steps {
                // Corre el nuevo contenedor de la imagen
                sh 'docker run -d --name $CONTAINER_NAME -p $PORT:$PORT $IMAGE_NAME:$IMAGE_TAG'
            }
        }

        stage('Prueba') {
            steps {
                // Espera un poco y comprueba si la api responde
                sh 'sleep 5'
                sh 'curl http://localhost:$PORT || exit 1'
            }
        }
    }
}
