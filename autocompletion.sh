#!/usr/bin/env bash
# auto completion for all kind of tools

autocompletion_folder="$(brew --prefix)/etc/bash_completion.d"

curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose -o "${autocompletion_folder}/docker-compose"
curl -L https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker -o "${autocompletion_folder}/mydocker"

minikube completion bash > "${autocompletion_folder}/minikube_completion"
kubectl completion bash > "${autocompletion_folder}/kubectl"
