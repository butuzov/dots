jupyter_subcmd() {

    if [[ -z "$VIRTUAL_ENV" ]]; then
       source  "$(dirname "$(dirname  "${JUPYTER_CONFIG_DIR}")")/bin/activate"
    fi

    if [ -z "$1" ]; then
        $(which jupyter) notebook
    fi
}
alias jupyter="jupyter_subcmd"
