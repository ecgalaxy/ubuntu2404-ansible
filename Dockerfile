FROM geerlingguy/docker-ubuntu2404-ansible:latest
LABEL maintainer="DIGIT-ECGALAXY@ec.europa.eu"

ENV ANSIBLE_USER=ansible SUDO_GROUP=sudo DEPLOY_GROUP=deployer

RUN set -xe && \
  groupadd -r ${ANSIBLE_USER} && \
  groupadd -r ${DEPLOY_GROUP} && \
  useradd -m -g ${ANSIBLE_USER} ${ANSIBLE_USER} && \
  usermod -aG ${SUDO_GROUP} ${ANSIBLE_USER} && \
  usermod -aG ${DEPLOY_GROUP} ${ANSIBLE_USER} && \
  sed -i "/^%${SUDO_GROUP}/s/ALL\$/NOPASSWD:ALL/g" /etc/sudoers && \
  chown -R ${ANSIBLE_USER}:${ANSIBLE_USER} /home/${ANSIBLE_USER}
