pipeline {
    agent any
    
    environment {
        BROWSERSTACK_USERNAME = credentials('BROWSERSTACK_USERNAME') // Jenkins credentials ID
        BROWSERSTACK_ACCESS_KEY = credentials('BROWSERSTACK_ACCESS_KEY')
    }

    stages {
        stage('Patch browserstack.yml') {
            steps {
                script {
                    // Считываем оригинальный yml
                    def original = readFile 'robot-browserstack/browserstack.yml'

                    // Заменяем userName и accessKey
                    def updated = original
                        .replaceFirst(/userName: .*/, "userName: ${env.BROWSERSTACK_USERNAME}")
                        .replaceFirst(/accessKey: .*/, "accessKey: ${env.BROWSERSTACK_ACCESS_KEY}")

                    // Перезаписываем файл
                    writeFile file: 'browserstack.yml', text: updated
                }
            }
        }

        stage('Run Robot Tests') {
            steps {
                browserstack(credentialsId: '135faf14-91fb-460c-bfc0-9d2cc1528ad8') {
                    script {
                        // Изменяем рабочую директорию перед выполнением команд
                        dir('robot-browserstack') {
                            // Создаем виртуальное окружение
                            sh 'python3 -m venv env'
                            sh 'source env/bin/activate && pip3 install -r requirements.txt'
                            sh '''
                                source env/bin/activate
                                "env/bin/browserstack-sdk" robot ./tests/test.robot
                            '''
                        }
                    }
                }
            }
        }
    }
}
