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
        sh 'cd /JtProject && mvn clean package'
      }
    }
}
}
