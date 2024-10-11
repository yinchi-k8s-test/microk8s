script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"

kubecolor create secret generic ds-mariadb \
    --from-env-file secret.env

popd
