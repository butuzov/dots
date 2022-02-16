# TODO: sort, cleanup.

# Realod Config
if [[ -f ~/.dropbox/info.json ]]; then
    DROPBOX="$(cat ~/.dropbox/info.json | jq .personal.path | sed -e 's/"//g' )"
fi

alias .dots='code ~/.dotfiles'
alias docs='cd $DROPBOX/Projects/todayilearned && jupyter'
alias today='code $DROPBOX/today.md'
alias pg='cd $DROPBOX/Projects/todayilearned/sandbox-pg && task up'

alias awssso="aws sso login"

alias dropbox="cd $DROPBOX"
alias dp=dropbox

# chrome
alias chrome="open -a'/Applications/Google Chrome.app' $@"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"


alias chrome="open -a /Applications/Google\ Chrome.app"
google(){
    if [ $(echo $1 | egrep "^-[cfs]$") ]; then
        local opt="$1"
        shift
    fi
    local url="https://www.google.com/search?q=${*// /+}"
    local app="/Applications"
    local c="${app}/Google Chrome.app"
    local f="${app}/Firefox.app"
    local s="${app}/Safari.app"
    case ${opt} in
        "-c")   open "${url}" -a "$c";;
        "-f")   open "${url}" -a "$f";;
        "-s")   open "${url}" -a "$s";;
        *)      open "${url}";;
    esac
}


# Lookup
alias diga="dig +nocmd "$1" any +multiline +noall +answer"


# Enable aliases to be sudo’ed
alias sudo='sudo '



# Navigation
alias desk="cd ~/Desktop"


# Time and Date
#  Get week number
alias week='date +%V'
# Stopwatch
alias timer='echo "Timer started. <crtl+d> to breck." && date && time cat && date'


# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

alias focuson="defaults write com.apple.dock single-app -bool true && killall Finder"
alias focusoff="defaults write com.apple.dock single-app -bool false && killall Finder"


# misc
alias shrug='echo "¯\_(ツ)_/¯"'

# extensions
alias grep='grep --color=auto '


# All Bew Updates
alias brew_update_all="brew bundle --file=Brewfile"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig | grep inet | grep -v inet6 | awk '{print $2}'"


