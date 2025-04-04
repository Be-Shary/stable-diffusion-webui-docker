#!/bin/bash

cd /home/automatic/stable-diffusion-webui/
./webui.sh --listen --api --use-cpu all --precision full --no-half --skip-torch-cuda-test --enable-insecure-extension-access > /home/automatic/webui.log
