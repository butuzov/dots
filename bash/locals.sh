# Video compressing
alias video='cd /Volumes/Developer/Video-Library/Videos'
alias vc='video && go run converter.go -directory=__converting'

# Spinup wp-dev env
alias web='/Volumes/Developer/WordPress/.settings/commander.sh $1 $(pwd)'

alias d_rm='docker ps -q -f "status=exited" | xargs -L1 docker rm'
alias d_rmi='docker images -q -f "dangling=true" | xargs -L1 docker rmi'
