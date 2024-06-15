pipeline {
    agent any
    tools {
        maven 'maven-3.9.7'
    }
    
    stages{
        stage ('Checkout from github') {
            steps{
                echo "User selected branch is ${params.branchName.split('/').last()}"
                git branch: "${params.branchName.split('/').last()}", credentialsId: 'git_hub_cred', url: 'https://github.com/Tejasac07/Java-Rest-API-Calculator.git'
                sh 'ls -ltr'
            }
        }
        stage ('Build package') {
            steps{
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com/', 'docker') {
                        def dockerImage = docker.build("my-image:${env_BUILD_ID}")
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
