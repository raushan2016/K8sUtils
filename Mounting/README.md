# Mounting

kubectl logs -c model-init model-mount-deployment-f9fdd456-rrlsp

kubectl logs -c model-init -p model-mount-deployment-f9fdd456-rrlsp

POD=$(kubectl get pod -l app=model-mount -o jsonpath="{.items[0].metadata.name}")
while [ true ]; do date; kubectl logs $POD -c model-init; sleep 1; done