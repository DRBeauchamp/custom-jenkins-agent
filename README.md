# Customised Jenkins agent 

Based on the `jenkins/inbound-agent:4.6-1` image which was being pulled by the jenkins helm chart but customised by Dockerfile to include `envsubst`, `awscli`, `kubectl` and `docker` commands necessaryfor my jenkins pipelines.

```
docker build -t drbeauchamp/custom-jenkins-agent .
docker push drbeauchamp/custom-jenkins-agent:latest
```

To use:
```
docker pull drbeauchamp/custom-jenkins-agent:latest
```
