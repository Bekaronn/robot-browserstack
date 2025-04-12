pipeline {
    agent any

    environment {
        BROWSERSTACK_USERNAME = 'bekarysmyrzakul_t7ThIs' // Jenkins credentials ID
        BROWSERSTACK_ACCESS_KEY = 'gyfyCcnLaawMWejMQZHW'
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
                script {
                    // Изменяем рабочую директорию перед выполнением команд
                    dir('browserstack-sdk') {
                        // Создаем виртуальное окружение
                        sh 'python3 -m venv env'
                        sh 'source env/bin/activate && pip3 install -r requirements.txt'
                        sh 'browserstack-sdk robot ./tests/test.robot'
                    }
                }
            }
        }
    }
}
