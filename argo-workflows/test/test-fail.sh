# Submits an Argo workflow that fails

script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"

argo submit fail.yaml -n argo -w --log

popd
