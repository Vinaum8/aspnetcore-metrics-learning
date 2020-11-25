node {
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Build Image') {
        docker.build "${JOB_NAME}:${BUILD_NUMBER}"
    }

    stage('Push Image to Repository'){
        withCredentials([usernamePassword(credentialsId: 'DockerHubPwd', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
            docker.Push('latest')
        }
    }
}