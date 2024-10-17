script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"

helm upgrade -i --wait --timeout 1m --render-subchart-notes \
    -n default ds-mongodb . -f values.yaml

popd
