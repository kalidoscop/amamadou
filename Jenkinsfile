pipeline{

    agent any

    stages{
        stage('Echo') {
            steps{
                sh "echo Je suis là ${car}"
                }
            }
        stage('Show Release') {
            steps {
                sh "cat /etc/os-release"
            }
        }
        stage('Initialisation') {
            steps {
                sh "make clean"
                sh "make venv" 
                sh "make install"
            }
        }
        stage('Build docker image') {
            steps {
                sh "docker ps -a" 
                sh "docker build -t default_image ."
            }
        }
        stage('Test docker image') {
            steps {
                sh "docker run default_image -p 8000:8000 --name default_container"
            }
        }
        stage('Cleanup ') {
            steps {
                sh "docker container stop default_container"
            }
        }
    }     
}
