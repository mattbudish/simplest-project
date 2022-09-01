# Simplest Project

A simple C++ API behind an API gateway. The purpose of this project is to provied a boilerplate for more useful C++ APIs to be built on.

## Prerequisites
### Local Only
- Git
- NodeJS and NPM
- CMake
- G++

### Docker deployment
- Docker
- Docker Compose

### Kubernetes deploymnet
- Everything from Docker deployment plus...
- Access to a Docker registry
- Access to a Kubernetes cluster with Traefik reverse proxy with Cert Manager configured

## Instructions to deploy to Kubernetes
1. `cd gateway/gateway && npm install`
2. `cd ../.. && docker-compose build`
3. Push container images to your Docker registry
4. Define Docker images with your registry URLs in the deployment manifests under the k8s subdirectory
5. Define URL to your cluster in ingress route manifest under the k8s subdirectory and register it on your DNS server or hosts file
5. `kubectl apply -f k8s/`