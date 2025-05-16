pipeline {
    agent any
    environment {
        SPOTIFY_API_KEY = credentials('SPOTIFY_API_KEY')
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/chandrukonnur/terraform-spotify', branch: 'main'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -var="spotify_api_key=$SPOTIFY_API_KEY" -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
        stage('Show Outputs') {
            steps {
                sh 'terraform output'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
        success {
            echo 'Terraform automation for Spotify playlists completed successfully!'
        }
        failure {
            echo 'Terraform automation failed. Check the logs for details.'
        }
    }
}