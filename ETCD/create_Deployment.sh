#!/bin/bash

for i in {1..100}
    do
      echo "creating deployment hello-kubernetes$i "
      name=hello-kubernetes$i
      sed "s/hello-kubernetes1/${name}/g" ./nginx-app.yaml > nginx-app-temp.yaml
      kubectl apply -f ./nginx-app-temp.yaml -n foo1

    done