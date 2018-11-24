
# Start/Stop LEMP in Docker Compose
# used while webdev

lemp() {

    # DOCKER_COMPOSE_FILE can be exported later.

    case "$1" in
        # Start Environment
        "start") docker-compose -f $DOCKER_COMPOSE_FILE \
                    --project-directory $(dirname $DOCKER_COMPOSE_FILE) up -d;;

        # Stop Environment
        "stop") docker-compose -f $DOCKER_COMPOSE_FILE \
                    --project-directory $(dirname $DOCKER_COMPOSE_FILE) down;;

        *) echo "You can 'web stop' or 'web start' only";;
    esac

}
alias web="lemp"
