pipeline{
    agent any
    stages {

        stage("Testing JDK"){
            steps {
                sh "java -version"
            }
        }
        stage("Chekout Git"){
            steps {
                //echo "Pulling"
                git 'https://github.com/Salma-Jedidi/kaddem'
            }
        }
        stage('MVN COMPILE') {
            steps{
                sh 'mvn compile'
        }
    }
        stage("Testing Maven"){
            steps {
                sh "mvn -version"
            }
        }
        stage("NEXUS") {
            steps {
                sh "nexus"
            }
        }

    }
}