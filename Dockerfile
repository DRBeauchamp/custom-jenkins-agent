FROM jenkins/inbound-agent:4.6-1
  # switch to root for installations
USER root
RUN apt-get update && apt-get install -y gettext-base apt-transport-https ca-certificates curl gnupg lsb-release
  # install awscli2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip && ./aws/install
  # install kubectl:
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl
  # install docker:
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN apt-get update && apt-get install -y docker.io
  # install helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh
  # switch back to jenkins user
USER jenkins
RUN which envsubst
RUN which kubectl
RUN which aws
RUN aws --version
RUN which helm
RUN helm version
