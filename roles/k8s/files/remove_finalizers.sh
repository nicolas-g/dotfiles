#!/bin/bash

# Swap pod for any resource you need to iterate over. (ie daemonset, deployment)
K8S_RESOURCE="app"
NAME_OF_BAD_FINALIZER="resources-finalizer.argocd.argoproj.io"

kubectl get ${K8S_RESOURCE} --all-namespaces | tail -n+2 | awk '{print $1 " " $2}' | xargs -L1 bash -c "kubectl patch -n \$0 ${K8S_RESOURCE}/\$1 --type=merge -p \$(kubectl get -n \$0 ${K8S_RESOURCE}/\$1 -o json | jq -Mcr '.metadata.finalizers // [] | {metadata:{finalizers:map(select(. != \"${NAME_OF_BAD_FINALIZER}\"))}}')"
