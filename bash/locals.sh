# Video compressing
alias video='cd /Volumes/Developer/Video-Library/Videos'
alias vc='video && go run converter.go -directory=__converting'

# Spinup wp-dev env
alias web='/Volumes/Developer/WordPress/.settings/commander.sh $1 $(pwd)'

# alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'
alias update='brew update; brew upgrade; brew cleanup;'
