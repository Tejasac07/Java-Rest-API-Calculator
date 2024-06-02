pipeline {
    agent any
    tools {
        maven 'maven-3.9.7'
    }
    
    stages{
        stage ('Checkout from github') {
            steps{
                git branch: 'master', credentialsId: 'git_hub_cred', url: 'https://github.com/Tejasac07/Java-Rest-API-Calculator.git'
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
                    sh 'docker image build -t tejasac07/calculator .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'docker_hub_login', variable: 'docker_hub_login')]) {
                        sh 'docker login -u tejasac07 -p ${docker_hub_login}'
                    }
                    sh 'docker image push tejasac07/calculator'
                }
            }
        }
    }
}
