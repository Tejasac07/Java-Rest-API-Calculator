pipeline {
    agent any
    tools {
        maven 'maven-3.9.7'
    }
    
    stages{
        stage ('Checkout from github') {
            steps{
                echo "User selected branch is ${params.branchName.split('/').last()}"
                git branch: "${params.branchName.split('/').last()}", credentialsId: 'github', url: 'https://github.com/Tejasac07/Java-Rest-API-Calculator.git'
                sh 'ls -ltr'
            }
        }

        stage ('Hello world') {
            steps{
                sh 'Hello'
            }
        }
        
    }
}
