pipeline {
    agent any

    parameters {
        booleanParam(name: 'DOCKER_STOP', defaultValue: false, description: 'Stop Deploy ?')
    }

    stages {
        // stage ('clean docker') {
        //     steps {
        //         echo "[Tut-O-Pedia_Docker_Database] DOCKER CLEANUP"
        //         sh 'docker system prune -a --volumes -f'                
        //     }
        // }

        stage('compose') {
            when {
                expression {
                    ! params.DOCKER_STOP
                }
            }
            steps {
                sh 'docker compose up -d --wait'
            }
        }

        stage ('stop docker') {
            when {
                expression {
                    params.DOCKER_STOP
                }
            }
            steps {
                echo "[Tut-O-Pedia_Docker_Database] DOCKER STOP"
                sh 'docker compose down --remove-orphans -v'
                sh 'docker compose ps'
            }
        }
    }
}