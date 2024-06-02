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
                    app = docker.build("tejasac07/calculator")
                    app.inside {
                        sh 'echo $(curl localhost:5000)'
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_key') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
    }
}
