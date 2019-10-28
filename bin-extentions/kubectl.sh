# kubernetes related functionality

alias k=kubectl
complete -F __start_kubectl k
. <(kubectl completion bash)

alias h=helm
complete -F __start_helm h
. <(helm completion bash)
