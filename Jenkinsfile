node {
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Sonarqube - Testing'){
      
    }

    stage('Build Image') {
        docker.build "$YOUR_USER/${JOB_NAME}:latest"
    }

    stage('Push Docker Image'){
     withCredentials([string(credentialsId: 'DockerHubPassword', variable: 'dockerHubPwd')]) {
        sh "docker login -u $YOUR_USER -p ${dockerHubPwd}"
    }
    sh "docker push $YOUR_USER/${JOB_NAME}:latest"
   }

   stage('Run Container on Server'){
     def dockerRun = 'docker-compose --file aspnetcore-metrics-app/docker-compose.yaml up -d --force-recreate net-application'
     sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no $REMOTE_USER@$IP_ADDRES_SERVER ${dockerRun}"
     }
   }

   stage ('Email Notification'){
      mail bcc: '', body: 'PIPELINE SUCCESS!', cc: '', from: '', replyTo: '', subject: 'Jenkins - Build', to: 'YOUR_EMAIL_TO_NOTIFICATION'
   }
}
