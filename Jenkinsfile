node {
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm

    /* stage ('Build Image') {
        sh "docker build -t prometheustest:v${BUILD_NUMBER} ."
    } */

    stage('Build Image') {
        docker.build "prometheustest:${env.BUILD_TAG}"
    }
}
}