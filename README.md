 # ASP NET CORE APPLICATION COM MÉTRICAS E PIPELINE COM JENKINS
Este repositório foi criado para demonstrar os estudos desenvolvidos utilizando as seguintes tecnologias:
- docker
- docker-compose
- prometheus
- grafana
- nginx
- jenkins
- .net 5.0

# Objetivo

O objetivo é ter o contato prático com todas as tecnologias citadas acima através do estudo de documentações originais, artigos da comunidade e vídeos no youtube.

# Step by Step for the Repository

1. Clonar o repositório: 
``` 
git clone https://github.com/Vinaum8/aspnetcore-metrics-app.git
```

2. Execute the file: ` run.sh `
   
3. Instalar o Docker;
    * ` curl -fsSL https://get.docker.com -o get-docker.sh `
    * ` sudo sh get-docker.sh `
    * ` sudo usermod -aG docker your-user `
4. Baixar e instalar o docker-compose:     
    * ` sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose `
5. Dar permissão de execução ao binário baixado: 
    * ` sudo chmod +x /usr/local/bin/docker-compose `
6.  Dar permissão de acesso ao socket daemon do Docker
    * ` sudo chmod 770 -R /var/run/ `
7.  Iniciar a execução de todos os containers 
```
$ cd container
$ docker-compose up
```

Obs: Para acessar os containers criados, precisamos acessar o NGINX (nosso ingress) na porta 80 e vamos necessitar definir os registros DNS em nossa máquina local para testes.

No meu caso, o IP Público aparece na interface da Oracle Cloud, então abri o arquivo /etc/hosts/ e adicionei alguns registros DNS para referenciar os **server_name** localizados no arquivo /container/nginx/nginx.conf deste repositório.

Adicionei as seguintes linhas no arquivo /etc/hosts:
* "IP" net-test.com
* "IP" grafana-test.com
* "IP" prometheus-test.com
* "IP" jenkins-test.com

Onde "IP", era o IP do HOST sem aspas