# Video compressing
alias video='cd /Volumes/Developer/Video-Library/Videos'
alias vc='video && go run converter.go -directory=__converting'

# Spinup wp-dev env
alias web='/Volumes/Developer/WordPress/.settings/commander.sh $1 $(pwd)'

# alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'
alias update='brew update; brew upgrade; brew cleanup;'

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
