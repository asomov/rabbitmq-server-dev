## Overview

This is a development environment of RabbitMQ.
This image allows to build and run all the components without installing any Erlang utilities.
(including Erlang itself). Only docker is required :-)

## License

All code is licensed under [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt).

## Build the image

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


## Run the container

* Run the docker container and develop inside it. 

```docker run --rm -it rabbitmq-server-dev```


## Run the container and map the source from the host to container

Check out a project and use volume to map it into the container.

For instance, if the current folder is the source of rabbitmq-server, then the
following command will replace the source from the container with the source from the host. 

```docker run --rm -it      \
     -v `pwd`:/projects/rabbitmq-public-umbrella/deps/rabbit \
     rabbitmq-server-dev
```
This way is much simpler to use git or other tools.

* This may help to avoid creating files with root provileges by docker:

```--user `id -u`:`id -g````


## Usage

The instructions how to run/tests the projects can be found on [Rabbit Public Umbrella](https://github.com/rabbitmq/rabbitmq-public-umbrella)

Running Tests is also described in [CONTRIBUTING](https://github.com/rabbitmq/rabbitmq-server/blob/master/CONTRIBUTING.md#running-tests):

```make tests```

(Intel i7 with 4 cores runs the whole test suite for RabbitMQ server for approx. 2 hours)




