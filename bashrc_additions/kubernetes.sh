#!/bin/bash

# enable tab completion
source <(kubectl completion bash)

# https://unix.stackexchange.com/questions/25327/watch-command-alias-expansion
alias watch='watch '
alias k='kubectl'

# allow tab completion for k alias
# https://kubernetes.io/docs/reference/kubectl/cheatsheet/#bash
complete -o default -F __start_kubectl k

# function to jump between namespaces
function ksn() {
	kubectl config set-context --current --namespace=$1
}

# some simple aliases for often used kubectl commands
alias kgp='kubectl get pods'
alias kgs='kubectl get service'
alias kgi='kubectl get ingress'
alias kgsts='kubectl get sts'
alias kgd='kubectl get deployments'