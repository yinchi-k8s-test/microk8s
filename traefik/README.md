# Traefik

This directory contains files for setting up Traefik using the Kubernetes Gateway API (see [official blog post](https://traefik.io/blog/getting-started-with-kubernetes-gateway-api-and-traefik/)).

To install traefik, source the `install.sh` script.  This will create the `traefik-gateway` Gateway in the `traefik` namespace along with all related Kubernetes resources.

> [!NOTE]
> Currently, only HTTP is enabled, using NodePort `30000` by default.  The Traefik dashboard itself is exposed at `http://localhost:30001/dashboard/`.
