node {
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Build Image') {
        docker.build "${JOB_NAME}:${BUILD_NUMBER}"
    }

     stage('Push Docker Image'){
     withCredentials([string(credentialsId: 'DockerHubPassword', variable: 'dockerHubPwd')]) {
        sh "docker login -u 13072347 -p ${dockerHubPwd}"
     }
     sh 'docker push 13072347/prometheustest:latest'
   }
}