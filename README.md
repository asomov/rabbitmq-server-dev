## Overview

This is a development environment of RabbitMQ server 

## License

All modules are licensed under [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt).

## Build

Build Docker image

* Build docker image

```git clone https://github.com/asomov/rabbitmq-server-dev.git```

```cd rabbitmq-server-dev```

```docker build -t rabbitmq-server-dev .```

* Run docker container

```docker run -it rabbitmq-server-dev bash```

## Usage

- change the code
- run the tests
- contribute a patch

Running Tests is described in [CONTRIBUTING](https://github.com/rabbitmq/rabbitmq-server/blob/master/CONTRIBUTING.md#running-tests)

```make tests```

My Intel i7 with 4 cores runs the whole test suite approx. 2 hours

## TODO

- describe how to share volume with host 
- [rmq-collect-env](https://github.com/rabbitmq/support-tools/blob/master/scripts/rabbitmq-collect-env)



