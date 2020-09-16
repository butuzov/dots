
ctx() {
    case "$1" in
        "git")    git_ctx  ;;
        "kube")   kube_ctx  ;;

        # mac issue require us to run it as .
        *)   echo "Context not found";
    esac
}

########################## Kubernetes
export KUBE_CONTEXT=~/.kubernetes
kube_ctx(){

  [ -f "${KUBE_CONTEXT}" ] && unlink "${KUBE_CONTEXT}" || touch "${KUBE_CONTEXT}" ;

  if [[ ! -f "${KUBE_CONTEXT}" ]]; then
    RES="KubeCtx is off"
  else
    RES="KubeCtx is on"
  fi

  echo $RES
}

kube_ctx_check(){

    if [[ ! -f "${KUBE_CONTEXT}" ]]; then
        return 0;
    fi

    CURRENT_CTX=$(kubectl config view | grep [c]urrent-context | awk '{print $2}' | sed 's/\"//g')
    if [[ ! -z $CURRENT_CTX ]]; then
        CURRENT_NS=$(kubectl config view --minify --output 'jsonpath={..namespace}')
    else
        return 0;
    fi

    if [[ ! -z $CURRENT_NS ]]; then
        printf " ⎈ %s@%s " "$CURRENT_CTX" "$CURRENT_NS"
    else
        printf " ⎈ %s " "$CURRENT_CTX"
    fi
}

########################## Git
export GIT_CONTEXT=~/.gitcontext
git_ctx(){

  [ -f "${GIT_CONTEXT}" ] && unlink "${GIT_CONTEXT}" || touch "${GIT_CONTEXT}" ;
  if [[ ! -f "${GIT_CONTEXT}" ]]; then
    RES="GitCtx is off"
  else
    RES="GitCtx is on"
  fi

  echo $RES
}


git_ctx_check(){

    if [[ ! -f "${GIT_CONTEXT}" ]]; then
        return 0;
    fi

    BRANCH=$(git branch --no-color 2>/dev/null | cut -d' ' -f 2 | xargs )

    if [[ -z $BRANCH ]]; then
        return 0;
    fi

    printf "  %s " "$BRANCH"
}
