## Overview

This is a development environment of RabbitMQ server 

## License

All modules are licensed under [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt).

## Usage

Build Docker image

* Build docker image

```git clone https://github.com/asomov/rabbitmq-server-dev.git```

```cd rabbitmq-server-dev```

```docker build -t rabbitmq-server-dev .```

* Run docker container

```docker run -it rabbitmq-server-dev bash```

## Problem

Run ```make``` in the container:

```# make```

```** (ArgumentError) argument error
       (stdlib) erl_anno.erl:322: :erl_anno.set(:file, 'nofile', -1)
       (stdlib) erl_parse.yrl:1558: anonymous fn/3 in :erl_parse.map_anno/2
       (stdlib) erl_parse.yrl:1670: :erl_parse.modify_anno1/3
       (stdlib) erl_parse.yrl:1693: :erl_parse.modify_anno1/3
       (stdlib) erl_parse.yrl:1694: :erl_parse.modify_anno1/3
       (stdlib) erl_parse.yrl:1672: :erl_parse.modify_anno1/3
       (stdlib) erl_parse.yrl:1693: :erl_parse.modify_anno1/3
       (stdlib) erl_parse.yrl:1672: :erl_parse.modify_anno1/3
```

The whole error [is here](https://gist.github.com/asomov/8094aa2758e5b611b88b3abfffd8d6ab)

Any help is appriciated...



