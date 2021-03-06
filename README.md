## Overview

This is a development environment of RabbitMQ.
This image allows to build and run all the components without installing any Erlang utilities.
(including Erlang itself). Only docker is required :-)

## License

All code is licensed under [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt).

## Build the image

Build Docker image (the dependencies are based on https://www.rabbitmq.com/build-server.html#prerequisites)

* Build docker image

```git clone https://github.com/asomov/rabbitmq-server-dev.git```

```cd rabbitmq-server-dev```

Use default Erlang OTP version 22.0 and elixir 1.8.1:

```docker build -t rabbitmq-server-dev .```

Use any available Erlang OTP version (RabbitMQ 3.6.15+ requires Erlang 19.3+), or elixir version:

```docker build --build-arg OTP_VERSION=20.3 --build-arg ELIXIR_VERSION=1.8.0 -t rabbitmq-server-dev .```

You might give the image another name to distinguish from other versions.

(It takes more than 20 minutes to build the image, most of the time takes the Erlang build)


## Run the container

* Run the docker container and develop inside it. 

```docker run --rm -it --name rabbitmq-server-dev rabbitmq-server-dev```


## Run the container and map the source from the host to container

Check out a project and use volume to map it into the container.
(there is no way to map data from container to host)

For instance, if the current folder is the source of rabbitmq-server, then the
following command will replace the source from the container with the source from the host. 

```
docker run --rm -it      \
     -v `pwd`:/projects/rabbitmq-public-umbrella/deps/rabbit \
     --name rabbitmq-server-dev \
     rabbitmq-server-dev
```
This way is much simpler to use git or other tools.

This is the way to share the Maven repository with the host

```docker run --rm -it -v /home/somov/.m2/repository/:/root/.m2/repository/ --name rabbitmq-server-dev rabbitmq-server-dev```

* This may help to avoid creating files with root privileges by docker:

```--user `id -u`:`id -g` ```


## Usage

The instructions how to run/tests the projects can be found on [Rabbit Public Umbrella](https://github.com/rabbitmq/rabbitmq-public-umbrella)

Running Tests is also described in [CONTRIBUTING](https://github.com/rabbitmq/rabbitmq-server/blob/master/CONTRIBUTING.md#running-tests):

```make tests```

(Intel i7 with 4 cores runs the whole test suite for RabbitMQ server for approx. 2 hours)



## Run Java client tests

https://github.com/rabbitmq/rabbitmq-java-client/blob/master/RUNNING_TESTS.md

```
cd deps/rabbitmq_java_client
./mvnw -Ddeps.dir=$(pwd)/.. verify -Dit.test=ConnectionRecovery
```

## Info

https://www.rabbitmq.com/plugin-development.html
https://github.com/docker-library/rabbitmq/blob/653e7496aa1196e2b55587440d86ad8c9a323008/3.8-rc/ubuntu/Dockerfile
https://github.com/rabbitmq/rabbitmq-public-umbrella
