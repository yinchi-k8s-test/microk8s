script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"

chmod +x scripts/*
cp scripts/* ~/bin

popd
