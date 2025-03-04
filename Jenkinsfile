pipeline {
  agent {label 'myagent'}
  tools{
       jdk 'Java17'
       maven 'Maven3'
  }

  environment {
        SONAR_TOKEN = credentials('jenkins-sonarqube-token')  // Reference Jenkins credential
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
       sh '''
              cd JtProject \
              mvn clean verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar \
              -Dsonar.organization=gani1990 \
              -Dsonar.projectKey=gani1990_e-commerce-ms \
              -Dsonar.host.url=https://sonarcloud.io \
              -Dsonar.login=$SONAR_TOKEN 
       '''
          }
      
    }                         
  
}
}
