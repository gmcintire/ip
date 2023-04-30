#!/bin/sh
docker build -t ip:1 .
docker tag ip:1 gmcintire/ip:1
docker push gmcintire/ip:1
kubectl rollout restart deploy/ip-deployment -n ip
