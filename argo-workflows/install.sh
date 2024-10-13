helm repo add argo https://argoproj.github.io/argo-helm
helm install argo-workflows argo/argo-workflows --version 0.42.5 \
    -f values.yaml -n argo --create-namespace --wait
