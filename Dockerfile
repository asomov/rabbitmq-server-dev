FROM ubuntu:16.04
LABEL maintainer="public.somov@gmail.com"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
   locales wget curl less vim git build-essential automake autoconf \
   xmlto libxml2-dev libxslt1-dev python-dev \
   openssl libssl-dev libncurses5-dev

# Set the locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

ARG OTP_VERSION
ENV OTP_VERSION ${OTP_VERSION:-20.3}

# install rebar
ADD https://github.com/rebar/rebar/wiki/rebar /bin/rebar
RUN chmod +x /bin/rebar

# install Kerl
ADD https://raw.githubusercontent.com/kerl/kerl/master/kerl /bin/kerl
RUN chmod +x /bin/kerl

# build Erlang
ENV KERL_CONFIGURE_OPTIONS --with-ssl=/usr/include/openssl --without-javac --enable-shared-zlib --enable-dynamic-ssl-lib --enable-hipe --enable-smp-support --enable-threads --enable-kernel-poll
RUN /bin/kerl build $OTP_VERSION $OTP_VERSION

# install Erlang
RUN /bin/kerl install $OTP_VERSION /opt/kerl/$OTP_VERSION

# activate erlang for bash
RUN echo ". /opt/kerl/$OTP_VERSION/activate" >> /etc/bash.bashrc

# download and build elixir
ARG ELIXIR_VERSION
ENV ELIXIR_VERSION ${ELIXIR_VERSION:-1.6.5}
ADD https://github.com/elixir-lang/elixir/archive/v${ELIXIR_VERSION}.tar.gz /opt/elixir-v${ELIXIR_VERSION}.tar.gz
WORKDIR /opt
RUN tar xzf elixir-v${ELIXIR_VERSION}.tar.gz
COPY build-elixir.sh /opt/elixir-$ELIXIR_VERSION/build-elixir.sh
RUN chmod +x /opt/elixir-$ELIXIR_VERSION/build-elixir.sh
WORKDIR /opt/elixir-$ELIXIR_VERSION
RUN ./build-elixir.sh
ENV PATH $PATH:/opt/elixir-${ELIXIR_VERSION}/bin

# checkout all the projects using https://github.com/rabbitmq/rabbitmq-public-umbrella
RUN mkdir /projects
WORKDIR /projects
RUN git clone https://github.com/rabbitmq/rabbitmq-public-umbrella.git
WORKDIR /projects/rabbitmq-public-umbrella
COPY build-umbrella.sh /projects/rabbitmq-public-umbrella/
RUN chmod +x /projects/rabbitmq-public-umbrella/build-umbrella.sh
RUN ./build-umbrella.sh

WORKDIR /projects/rabbitmq-public-umbrella/deps

CMD ["bash"]



