pipeline {
    agent any

    environment {
        BROWSERSTACK_USERNAME = credentials('bekarysmyrzakul_t7ThIs') // Jenkins credentials ID
        BROWSERSTACK_ACCESS_KEY = credentials('gyfyCcnLaawMWejMQZHW')
    }

    stages {
        stage('Patch browserstack.yml') {
            steps {
                script {
                    // Считываем оригинальный yml
                    def original = readFile 'browserstack.yml'

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
                sh 'robot tests/'  // или твоя команда запуска
            }
        }
    }
}
