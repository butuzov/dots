# adds additional two commands
# - `docker rmif` # (removes stoped containers)
# - `docker rmsc` # (removes failed builds)
docker_subcmd() {
    if [ -z "$1" ]; then
        docker help
    else
        case "$1" in
            # removes all containers
            "rma")      docker images -qa  | xargs -L1 docker rmi;;

            # removes stoped containers
            "rmsc")     docker ps -q -f "status=exited" | xargs -L1 docker rm;;

            # removes failed builds
            "rmif")     docker images -q -f "dangling=true" | xargs -L1 docker rmi ;;

            # mac issue require us to run it as .
            *)   $(which docker) "$@"
        esac
    fi
}
alias docker="docker_subcmd"
