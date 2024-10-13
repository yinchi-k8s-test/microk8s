# Submit an Argo workflow that prints 'hello world'

script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"

argo submit hello-world.yaml -n argo -w --log

popd
