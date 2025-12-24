#!/bin/bash

docker build -t hls_config-service_build --file DockerfileBuild .

docker run --rm -v .:/home/maven/project -v maven_cache_hls_config-service:/home/maven/.m2 hls_config-service_build
