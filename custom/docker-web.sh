
# Start/Stop LEMP in Docker Compose
# used while webdev
web() {

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
