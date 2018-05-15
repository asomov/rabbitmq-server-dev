FROM geerlingguy/docker-ubuntu1604-ansible
MAINTAINER Andrey <public.somov@gmail.com>

ADD build-dev /ansible/build-dev

WORKDIR /ansible/build-dev

RUN ansible-playbook rabbitmq-dev.yaml -c local


