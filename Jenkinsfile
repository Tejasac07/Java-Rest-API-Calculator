pipeline {
    agent any
    tools {
        maven 'maven-3.9.9'
    }
    
    stages{
        stage ('Checkout from github') {
            steps{
                //echo "User selected branch is ${params.branchName.split('/').last()}"
                //checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: '1b026942-3046-4763-aea3-5368e6725959', url: 'https://github.com/Tejasac07/Java-Rest-API-Calculator']])
                git branch: "${params.branchName.split('/').last()}", credentialsId: 'ee9e79d4-796b-432f-b777-c4598ae0f8b3', url: 'https://github.com/Tejasac07/Java-Rest-API-Calculator.git'
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
