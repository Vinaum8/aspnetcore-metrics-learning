node {
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Build Image') {
        docker.build "13072347/${JOB_NAME}:latest"
    }

    stage('Push Docker Image'){
     withCredentials([string(credentialsId: 'DockerHubPassword', variable: 'dockerHubPwd')]) {
        sh "docker login -u 13072347 -p ${dockerHubPwd}"
    }
    sh "docker push 13072347/${JOB_NAME}:latest"
   }

   stage('Run Container on Server'){
     def dockerRun = 'docker-compose --file aspnetcore-metrics-app/container/docker-compose.yaml up -d --force-recreate net-application'
     sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no ubuntu@40.87.6.132 ${dockerRun}"
     }
   }

   stage ('Email Notification'){
      mail bcc: '', body: 'Pipeline executada com sucesso.', cc: '', from: '', replyTo: '', subject: 'Jenkins - Build', to: 'vinaumpt@gmail.com'
   }
}