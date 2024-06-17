pipeline {
    agent any 
    
    stages{
        stage("Clone Code"){
            steps {
                echo "Cloning the code"
                git url:"https://github.com/alexgithubber09/Django-Jenkins-Docker.git", branch: "main"
            }
        }
        stage("Build"){
            steps {
                echo "Building the image"
                sh "docker build -t django-app ."
            }
        }
        /*
        stage("Push to Docker Hub"){
            steps {
                echo "Pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                sh "docker tag django-app ${env.dockerHubUser}/django-app:latest"
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker push ${env.dockerHubUser}/django-app:latest"
                }
            }
        }
        */
        stage("Deploy"){
            steps {
                echo "Deploying the container"
                sh "docker compose down -v && docker compose up -d"
                
            }
        }

        stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@192.168.43.187 compose up -d"
 
            }
        }
    }
}
