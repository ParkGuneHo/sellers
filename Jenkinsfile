pipeline {

  environment {
    registry = "ParkGuneHo/sellers"
    dockerImage = ""
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        echo "Checkout Source START"
        git 'https://github.com/ParkGuneHo/sellers.git'
        echo "Checkout Source END"
      }
    }

    stage('Build image') {
      steps{
        script {
          echo "Build image START $BUILD_NUMBER"
          dockerImage = docker.build("chump1/sellers:tomcat-$BUILD_NUMBER")
          echo "Build image END"
        }
      }
    }

    stage('Push Image') {
      environment {
               registryCredential = 'dockerhub'
           }
      steps{
        script {
          echo "Push Image START"
          docker.withRegistry( "https://registry.hub.docker.com", registryCredential ) {
            dockerImage.push()
          }
          echo "Push Image END"
        }
      }
    }

    stage('Deploy App') {
      steps {
        script {
          echo "Deploy App START"
          kubernetesDeploy(configs: "deployment-v2.yaml", kubeconfigId: "mykubeconfig")
          echo "Deploy App END"
        }
      }
    }

  }

}
