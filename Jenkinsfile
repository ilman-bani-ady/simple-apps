pipeline {
    agent {label 'server1-ill' }

    tools {nodejs 'nodejs-18'  }


    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', credentialsId: 'c378c52d-3785-4de7-8481-32e8ccca469a', url: 'https://github.com/ilman-bani-ady/simple-apps.git'
            }
        }
        stage('Build') {
            steps {
                sh '''cd apps
                npm install'''
            }
        }
        stage('Testing') {
            steps {
                sh '''cd apps
                npm test
                npm run test:coverage'''
            }
        }
        stage('Code Review') {
            steps {
            sh '''cd apps
            sonar-scanner \\
            -Dsonar.projectKey=simple-apps \\
            -Dsonar.sources=. \\
            -Dsonar.host.url=http://172.23.10.40:9000 \\
            -Dsonar.login=sqp_f92886fdab7328a4e6659d1c115078cd1a744408'''
            }
        }
        stage('Deploy compose') {
            steps {
                sh '''
                docker compose build
                docker compose down --volume
                docker compose up -d
                '''
            }
        }
    }
}