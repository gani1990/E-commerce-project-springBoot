pipeline {
  agent {label 'myagent'}
  tools{
       jdk 'Java17'
       maven 'Maven3'
  }

  environment {
        SONAR_TOKEN = credentials('jenkins-sonarqube-token')  // Reference Jenkins credential
        APP_NAME = "E-commerce-MS"
            RELEASE = "1.0.0"
            DOCKER_USER = "gani1990"
            DOCKER_PASS = 'dockerhub'
            IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
            IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"   
	        //JENKINS_API_TOKEN = credentials("JENKINS_API_TOKEN")
    }

stages{
    stage("Cleanup Workspace"){
    steps{
      cleanWs()
          }
      }


 stage("Checkout from SCM"){
      steps{
      git branch: 'master', credentialsId: 'github', url: 'https://github.com/gani1990/E-commerce-project-springBoot/'
       }
    }

 stage("Build Application"){
      steps{
        sh 'cd JtProject && mvn clean package'
      }
    }
stage("Test Application"){
      steps{
       
        sh 'cd JtProject && mvn test'
      }
}

  stage("SonarQube Analysis"){
      steps{

        script{
          withSonarQubeEnv('SonarCloud'){
       sh '''
              cd JtProject \
              mvn clean verify sonar:sonar \
              -Dsonar.qualitygate.wait=true \
              -Dsonar.organization=gani1990 \
              -Dsonar.projectKey=gani1990_e-commerce-ms \
              -Dsonar.host.url=https://sonarcloud.io \
              -Dsonar.login=$SONAR_TOKEN 
       '''
          }
        }
          }
      
    }        

  stage("Build & Push Docker Image") {
            steps {
                script {
                    docker.withRegistry('',DOCKER_PASS) {
                        docker_image = docker.build "${IMAGE_NAME}"
                    }

                    docker.withRegistry('',DOCKER_PASS) {
                        docker_image.push("${IMAGE_TAG}")
                        docker_image.push('latest')
                    }
                }
          }

  
}
}
