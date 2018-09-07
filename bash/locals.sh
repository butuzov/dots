# Video compressing
alias video='cd /Volumes/Developer/Tutorials'
alias vc='video && go run converter.go -directory=__converting'

# Start/Stop LEMP in Docker Compose
web_lemp() {
    case "$1" in
        # Start Environment
        "start") docker-compose -f $DOCKER_COMPOSE_FILE up -d;;

        # Stop Environment
        "stop") docker-compose -f $DOCKER_COMPOSE_FILE down;;

        *) echo "You can 'web stop' or 'web start' only";;
    esac
}
alias web="web_lemp"


# alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'
alias update='brew update; brew upgrade; brew cleanup;'

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
