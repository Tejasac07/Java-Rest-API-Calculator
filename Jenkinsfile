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
                    dockerImage = sh 'docker build -t tejasac07/calculator1:$BUILD_NUMBER .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'docker_hub_login', variable: 'docker_hub_login')]) {
                        sh 'docker login -u tejasac07 -p ${docker_hub_login}'
                    }
                    sh 'docker image push tejasac07/calculator1:$BUILD_NUMBER'
                    sh 'docker image push tejasac07/calculator1:latest'
                }
            }
        }
    }
}
