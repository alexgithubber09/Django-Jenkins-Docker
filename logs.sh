#!/bin/bash

mkdir -p /opt/app
docker logs -f django 2>> /opt/app/application.log
