pipeline {
  agent {label 'myagent'}
  tools{
       jdk 'Java17'
       maven 'Maven3'
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
          withSonarQubeEnv(credentialsId: 'jenkins-sonarqube-token'){
         sh "mvn sonar:sonar"
          }
      }
    }                         
  }  
  
}
}
