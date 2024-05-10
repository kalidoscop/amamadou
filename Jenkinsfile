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

        stage('Unit Test') {
            steps {
                sh "make test"
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
                sh "docker run -d -p 5000:8000 --name default_container default_image"
                sh "make test url"
            }
        }

                
        stage('Cleanup ') {
            steps {
                sh "docker container stop default_container"
                sh "docker container rm default_container"
            }
        }

    }     
}
