node {
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm

    stage name: "Build Image",  body: {
        sh "docker build -t prometheustest:${ENV.BUILD_TAG} ."
    }
}
}