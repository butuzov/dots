
docker_compose_subcmd() {
    if [ -z "$1" ]; then
        $(which docker-compose) help
    else
        case "$1" in
            # mac issue require us to run it as .
            *)   $(which docker-compose) "$@"
        esac
    fi
}

alias dc="docker_compose_subcmd"
