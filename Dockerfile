FROM jenkins/inbound-agent:4.6-1
# switch to root for installations
USER root
RUN apt-get update && apt-get install -y awscli gettext-base apt-transport-https ca-certificates curl gnupg lsb-release
# install kubectl:
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl
# install docker:
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN apt-get update && apt-get install -y docker.io
# switch back to jenkins user
USER jenkins
RUN which envsubst
RUN which aws
RUN which kubectl
RUN which docker
RUN docker -v
