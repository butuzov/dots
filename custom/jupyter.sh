jupyter_subcmd() {

    if [[ -z "$VIRTUAL_ENV" ]]; then
       source  "$(dirname "$(dirname  "${JUPYTER_CONFIG_DIR}")")/bin/activate"
    fi

    if [ -z "$1" ]; then
        $(which jupyter) notebook
    else
        case "$1" in
            # removes failed builds
            "pip")   pip install numpy sympy pandas statsmodels matplotlib;;

            # mac issue require us to run it as .
            *)   $(which jupyter) "$@"
        esac
    fi
}
alias jupyter="jupyter_subcmd"
