#!/bin/bash

mkdir -p /opt/app
docker logs -f django > /opt/app/application.log
