alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# k8s
alias helm='microk8s helm'

alias k='kubecolor'
. <(k completion bash)
. <(helm completion bash)
complete -o default -F __start_kubectl k

alias dashboard='k describe secret -n kube-system microk8s-dashboard-token'
ns() {
    kubecolor config set-context --current --namespace=$@
}

alias pods='k get po'
alias svcs='k get svc'
alias secrets='k get secret --force-colors=auto | grep -v "sh.helm"'

# Python (uv)

autopep8() {
    uv run autopep8 -vir --max-line-length 100 `git root`
}

isort() {
    uv run isort -v -l 100 `git root`
}

pylint() {
    uv run pylint `git root` --rcfile=`git root`/.pylintrc
}
