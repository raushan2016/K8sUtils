#!/bin/bash

for i in {1..2}
    do
      echo "creating deployment hello-kubernetes$i "
      name=hello-kubernetes$i
      sed "s/hello-kubernetes/${name}/g" ./nginx-app.yaml > nginx-app-temp.yaml
      kubectl apply -f ./nginx-app-temp.yaml

    done