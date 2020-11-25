node {
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Build Image') {
        docker.build "${JOB_NAME}:${BUILD_NUMBER}"
    }

    stage('Push Image to Repository'){
        withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]){
            docker.Push('latest')
        }
    }
}