#!/bin/bash
docker build -t kdop/back-app:0.0.1 .
docker push kdop/back-app:0.0.1
docker run --rm -p 5002:5002 --name=back-app kdop/back-app:0.0.1