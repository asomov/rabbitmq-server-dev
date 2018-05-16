FROM geerlingguy/docker-ubuntu1604-ansible
MAINTAINER Andrey <public.somov@gmail.com>
# Set the locale
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

ADD build-dev /ansible/build-dev
WORKDIR /ansible/build-dev
RUN ansible-playbook rabbitmq-dev.yaml -c local


