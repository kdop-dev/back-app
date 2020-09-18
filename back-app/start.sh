#!/bin/bash
docker build -t kdop/back-app:0.0.2 .
docker push kdop/back-app:0.0.2
docker run --rm -p 5000:5000 --name=back-app kdop/back-app:0.0.2