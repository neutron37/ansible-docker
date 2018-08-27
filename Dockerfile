FROM ubuntu:18.04
WORKDIR /root
RUN apt-get update
RUN apt-get install -y build-essential git

### Official Ansible install
## https://docs.ansible.com/ansible/2.4/intro_installation.html#latest-releases-via-apt-ubuntu
RUN apt-get install -y software-properties-common
ARG ansible_ppa
RUN apt-add-repository $ansible_ppa
RUN apt-get update
ARG ansible_version
RUN apt-get install -y ansible=$ansible_version
### End Ansible install
