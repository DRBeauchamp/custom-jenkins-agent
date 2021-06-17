# Customised Jenkins agent

Based on the `jenkins/inbound-agent:4.6-1` image which was being pulled by the [Jenkins Helm chart](https://github.com/jenkinsci/helm-charts/tree/main/charts/jenkins) but customised by Dockerfile to include `curl`, `envsubst`, `awscli2`, `kubectl`, `docker` and `helm` necessary for my Jenkins build pipeline.

### Built with:
```
docker build -t drbeauchamp/custom-jenkins-agent .
docker push drbeauchamp/custom-jenkins-agent:latest
```

### To use:
```
docker pull drbeauchamp/custom-jenkins-agent:latest
```

This container image is publicly available on [dockerhub here](https://hub.docker.com/repository/docker/drbeauchamp/custom-jenkins-agent).
