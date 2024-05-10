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
                sh "echo $env.BRANCH_NAME"
                sh "printenv"
                sh "docker build -t $env.BRANCH_NAME/default_image ."
            }
        }


        stage('Test docker image') { 
            steps {
                sh "docker run -d -p 5000:8000 --name default_container $env.BRANCH_NAME/default_image"
                sh "make test-url"
            }
        }

                
        stage('Cleanup ') {
            steps {
                sh "docker container stop default_container"
                sh "docker container rm default_container" 
            }
        }

        stage("Push image to Docker Hub"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'DOCKER_CREDS', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]){
                    sh """
                    docker login  --username $USERNAME --password $PASSWORD
                    docker push ${BRANCH_NAME}/default_image
                    """
                }
            }
        }
    }     
}
