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
     def dockerRun = 'docker compose up -d --force-recreate net-application'
     sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no ubuntu@140.238.187.247 ${dockerRun}"
     }
   }
}


git clone https://github.com/Vinaum8/aspnetcore-metrics-app.git

cd aspnetcore-metrics-app/container/

mkdir grafana
mkdir jenkins
mkdir jenkins/jenkins_home/

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo chown -R :root prometheus/
sudo chown -R :root nginx/
sudo chown -R :root jenkins/
sudo chmod 770 jenkins/jenkins_home/
sudo chown -R :root grafana/