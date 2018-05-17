#!/usr/bin/env bash

source /opt/kerl/{{ otp_version }}/activate
export PATH=$PATH:{{ elixir_path }}/bin
cd {{ rabbitmq_destination }}
make
