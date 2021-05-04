

kubectl_cmd() {

  if  [ -z $1 ]; then
    return
  fi

  if  [ ! -z $1 ] && [ -f ~/.kube/$1 ]; then
    export KUBECONFIG="$(echo ~/.kube/$1)"
    echo "Context Set - ${KUBECONFIG}\n"
    return
  fi

  case "$1" in
    # show pods
    "ls") kubectl get pods ${@:2} ;;
    # show available configs
    "clusters") find ~/.kube -maxdepth 1 -type f -ls;;
    # kuse ns dev-platform-dev
    "ns")
      ctx=$(kubectl config view | grep [c]urrent-context | awk '{print $2}' | sed 's/\"//g')
       kubectl config set-context "$ctx" --namespace $2
    ;;
    # kube commands
    *)
        kubectl $@
    ;;
  esac

}

alias kuse=kubectl_cmd
kubectl_cmd $@
