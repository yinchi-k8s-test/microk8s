script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"

helm install argo-workflows ./chart \
    -f chart/values.yaml -n argo --create-namespace --wait

popd
