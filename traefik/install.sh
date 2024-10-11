script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"

helm repo add traefik https://traefik.github.io/charts
helm repo update
helm upgrade -i -n traefik --create-namespace --wait --timeout 1m \
    traefik traefik/traefik -f values.yaml

popd
