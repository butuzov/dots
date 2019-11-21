# kubernetes related functionality

alias k=kubectl
. <(kubectl completion bash)
complete -F __start_kubectl k


alias h=helm
complete -F __start_helm h
. <(helm completion bash)
