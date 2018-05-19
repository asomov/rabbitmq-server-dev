## Overview

This is a development environment of RabbitMQ 

## License

All modules are licensed under [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt).

## Build

Build Docker image

* Build docker image

```git clone https://github.com/asomov/rabbitmq-server-dev.git```

```cd rabbitmq-server-dev```

Use default Erlang OTP version 20.3 and elixir 1.6.5:

```docker build -t rabbitmq-server-dev .```

Use any available Erlang OTP version (RabbitMQ 3.6.15+ requires Erlang 19.3+), or elixir version:

```docker build --build-arg OTP_VERSION=19.3 --build-arg ELIXIR_VERSION=1.6.5 -t rabbitmq-server-dev .```

You might give the image another name to distinguish from other versions.

(It takes more than 20 minutes to build the image, most of the time takes the Erlang build)


* Run docker container

```docker run -it rabbitmq-server-dev```

## Usage

The source code for all the projects is checked out under ```/projects/rabbitmq-public-umbrella/deps```

You can share the source code with the container as a docker volume, change the source and run code/tests inside the container,
which has all the dependencies and utilities installed.

The instructions how to run/tests the projects can be found on [Rabbit Public Umbrella](https://github.com/rabbitmq/rabbitmq-public-umbrella)

Running Tests is also described in [CONTRIBUTING](https://github.com/rabbitmq/rabbitmq-server/blob/master/CONTRIBUTING.md#running-tests):

```make tests```

(Intel i7 with 4 cores runs the whole test suite for RabbitMQ server for approx. 2 hours)

## TODO

- describe how to share source volume with host 
- configure branch ?



