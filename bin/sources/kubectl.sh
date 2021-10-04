alias kuse=kubectl
alias k=kubectl
. <(kubectl completion bash)
complete -F __start_kubectl kuse
complete -F __start_kubectl k
