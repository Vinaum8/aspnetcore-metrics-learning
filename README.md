 # ASP NET CORE APPLICATION COM MÉTRICAS E PIPELINE COM JENKINS
Este repositório foi criado para demonstrar os estudos desenvolvidos utilizando as seguintes tecnologias:
- Docker
- Docker-compose
- LGTM Stack
- Open Telemetry
- Nginx
- Jenkins
- .Net 8.0
- Loki
- Tempo
- Grafana

# Objetivo

O objetivo é ter o contato prático com todas as tecnologias citadas acima através do estudo de documentações originais, artigos da comunidade e vídeos no youtube.

-> Grafana Loki officially supports a Docker plugin that will read logs from Docker containers and ship them to Loki: [Docker driver client](https://grafana.com/docs/loki/latest/send-data/docker-driver/)


## Requisitos

* Docker
* Docker-Compose

No arquivo `run.sh` tem o script de instalação, caso necessário.

# Step by Step for the Repository

1. Clonar o repositório: 
``` 
git clone https://github.com/Vinaum8/aspnetcore-metrics-app.git
```

2. Execute the file: ` run.sh `
7.  Iniciar a execução de todos os containers 
```
$ docker-compose up
```

Obs: Para acessar os containers criados, precisamos acessar o NGINX (nosso ingress) na porta 80 e vamos necessitar definir os registros DNS em nossa máquina local para testes. O arquivo `run.sh` faz isso para nós.

Caso você não execute em sua máquina local, você pode configurar conforme necessário.

## Need help?
mail to: vinaumpt@gmail.com or DM ME https://www.linkedin.com/in/vinisf/