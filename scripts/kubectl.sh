

kubectl_subcmd() {
  if  [ -z $1 ]; then
    return
  fi

  if  [ ! -z $1 ] && [ -e ~/.kube/$1 ]; then
    export KUBECONFIG="$(echo ~/.kube/$1)"
    return
  fi

  case "$1" in
    "ls") kubectl get pods ;;

    *)
      ctx=$(kubectl config view | grep [c]urrent-context | awk '{print $2}' | sed 's/\"//g')
       kubectl config set-context "$ctx" --namespace $1
    ;;
  esac

}

alias kuse=kubectl_subcmd
