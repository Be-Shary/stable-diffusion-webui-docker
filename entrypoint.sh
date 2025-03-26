#!/bin/bash

cd /home/automatic/
./webui.sh --listen --api --use-cpu all --precision full --no-half --skip-torch-cuda-test > webui.log
