/* pipeline{
        agent {
        label 'agentubuntu'
    }

    environment {
        NEXUS_CREDENTIALS = credentials('nexusconf')
        SONAR_CREDENTIALS = credentials('sonarconf')
        DOCKER_CREDENTIALS = credentials('dockerconf')
        NEXUS_URL = 'http://192.168.33.10:8081/'
        
    }
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
                stage('Build and Package') {
            steps {
                script {
                    // Exécute la commande 'mvn package' pour construire le projet
                    sh 'mvn package'
                }
            }
        }  
stage('Build Docker Image Backend') {
    steps {
        script {

            sh "docker build -t salmajedidi/docker ."
        }
    }
}
stage('Push Docker Image to Docker ') {
    steps {
        withCredentials([usernamePassword(credentialsId: 'dockerconf', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
            script {
                // Log in to Docker Hub using Docker Hub credentials
                sh "docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD"


                // Push the Docker image to Docker Hub
                sh "docker push salmajedidi/docker"
            }
        }
    }
}
stage('Verify Docker Compose Installation') {
    steps {
        sh 'docker compose version'
    }
}

     stage('Start Docker Compose') {
            steps {
                script {
                    // Navigate to the directory where your docker-compose.yml is located
                 
                        // Use the docker-compose command to start the containers
                        sh 'docker compose up -d'
                    }
                }
            }
              stage('check Docker Compose') {
            steps {
                script {
                    // Navigate to the directory where your docker-compose.yml is located
                 
                        // Use the docker-compose command to start the containers
                        sh 'docker compose ps'
                    }
                }
            }
      stage('Test JUnit + Mockito') {
        steps {
            sh 'mvn test'
             }
    }     
       stage('SonarQube') {
            steps {
                sh 'mvn sonar:sonar -Dsonar.login=admin -Dsonar.password=sonar -Dmaven.test.skip=true';

            }
        }

    stage('Deploy to Nexus') {
     steps {
        script {
            // Déployer l'artefact sur Nexus
            sh "mvn deploy -DskipTests"

            // Supprimer l'ancienne version de l'artefact dans Nexus s'il existe déjà
            sh "curl -v -u ${NEXUS_CREDENTIALS_USR}:${NEXUS_CREDENTIALS_PSW} -X DELETE ${NEXUS_URL}/repository/maven-releases/tn/esprit/KaddemProject/1.0/KaddemProject-1.0.jar"

            // Réimporter la nouvelle version de l'artefact dans Nexus
            sh "curl -v -u ${NEXUS_CREDENTIALS_USR}:${NEXUS_CREDENTIALS_PSW} --upload-file target/KaddemProject-1.0.jar ${NEXUS_URL}/repository/maven-releases/tn/esprit/KaddemProject/1.0/KaddemProject-1.0.jar"
        }
    }
}

    }
}*/
pipeline {
    agent {
        label 'agentubuntu'
    }

    environment {
        NEXUS_CREDENTIALS = credentials('nexusconf')
        SONAR_CREDENTIALS = credentials('sonarconf')
        DOCKER_CREDENTIALS = credentials('dockerconf')
        NEXUS_URL = 'http://192.168.33.10:8081/'
        
    }

    tools {
        maven 'M2_HOME'
    }

    stages {
        stage ('GIT') {
            steps {
                echo "Getting Project from Git"
                git branch: "salmaNew",
                    url: "https://github.com/Salma-Jedidi/kaddem"
            }
        }

        stage('MVN Clean') {
            steps {
                sh 'mvn clean'
            }
        }

        stage('MVN Compile') {
            steps {
                sh 'mvn compile'
            }
        }
        stage('Build and Package') {
            steps {
                script {
                    // Exécute la commande 'mvn package' pour construire le projet
                    sh 'mvn package'
                }
            }
        }  
stage('Build Docker Image Backend') {
    steps {
        script {

            sh "docker build -t salmajedidi/docker ."
        }
    }
}
stage('Push Docker Image to Docker ') {
    steps {
        withCredentials([usernamePassword(credentialsId: 'dockerconf', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
            script {
                // Log in to Docker Hub using Docker Hub credentials
                sh "docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD"


                // Push the Docker image to Docker Hub
                sh "docker push salmajedidi/docker"
            }
        }
    }
}
stage('Verify Docker Compose Installation') {
    steps {
        sh 'docker compose version'
    }
}

     stage('Start Docker Compose') {
            steps {
                script {
                    // Navigate to the directory where your docker-compose.yml is located
                 
                        // Use the docker-compose command to start the containers
                        sh 'docker compose up -d'
                    }
                }
            }
              stage('check Docker Compose') {
            steps {
                script {
                    // Navigate to the directory where your docker-compose.yml is located
                 
                        // Use the docker-compose command to start the containers
                        sh 'docker compose ps'
                    }
                }
            }
  
    stage('Deploy to Nexus') {
     steps {
        script {
            // Déployer l'artefact sur Nexus
            sh "mvn deploy -DskipTests"

            // Supprimer l'ancienne version de l'artefact dans Nexus s'il existe déjà
            sh "curl -v -u ${NEXUS_CREDENTIALS_USR}:${NEXUS_CREDENTIALS_PSW} -X DELETE ${NEXUS_URL}/repository/maven-releases/tn/esprit/KaddemProject/1.0/KaddemProject-1.0.jar"

            // Réimporter la nouvelle version de l'artefact dans Nexus
            sh "curl -v -u ${NEXUS_CREDENTIALS_USR}:${NEXUS_CREDENTIALS_PSW} --upload-file target/KaddemProject-1.0.jar ${NEXUS_URL}/repository/maven-releases/tn/esprit/KaddemProject/1.0/KaddemProject-1.0.jar"
        }
    }
}


    }
}


