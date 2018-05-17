#!/usr/bin/env bash

source /opt/kerl/{{ otp_version }}/activate
cd {{ elixir_path }}
make
