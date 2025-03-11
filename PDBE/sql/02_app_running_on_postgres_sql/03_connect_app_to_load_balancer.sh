#!/bin/bash

# Task 3: Connect the GKE application to an external load balancer

# Set error handling
set -e

# Create a load balancer to make your GKE application accessible from the web
echo "Creating load balancer for the application..."
kubectl expose deployment gmemegen \
    --type "LoadBalancer" \
    --port 80 --target-port 8080

# Get the external IP of the load balancer
echo "Waiting for load balancer to be assigned an external IP..."

# Function to check if external IP is available
check_external_ip() {
    kubectl get service gmemegen -o jsonpath='{.status.loadBalancer.ingress[0].ip}' 2>/dev/null
}

# Wait for external IP to be assigned (timeout after 5 minutes)
timeout=300
interval=10
elapsed=0

until [ -n "$(check_external_ip)" ] || [ $elapsed -ge $timeout ]; do
    echo "Waiting for external IP... ($elapsed/$timeout seconds)"
    sleep $interval
    elapsed=$((elapsed + interval))
done

if [ $elapsed -ge $timeout ]; then
    echo "Timed out waiting for external IP. Please check manually with 'kubectl get service gmemegen'."
    exit 1
fi

# Get and display the external IP
export LOAD_BALANCER_IP=$(kubectl get svc gmemegen \
-o=jsonpath='{.status.loadBalancer.ingress[0].ip}' -n default)

echo "\nLoad Balancer successfully created!"
echo "gMemegen application is accessible at: http://$LOAD_BALANCER_IP"
echo "\nCreate a meme by visiting the URL, selecting an image, and entering text."
echo "View app logs with: kubectl logs \$(kubectl get pods -o name | head -1) gmemegen | grep \"INFO\""
