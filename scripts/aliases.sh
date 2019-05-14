# Realod Config
DROPBOX="$(cat ~/.dropbox/info.json | jq .personal.path | sed -e 's/"//g' )"

alias .dots='code ~/.dotfiles'
alias today='code ${DROPBOX}/today.md'
alias notes='code ${DROPBOX}/Coding/todayilearned'

alias dropbox="cd $DROPBOX"
alias dp=dropbox

# chrome
alias chrome="open -a'/Applications/Google Chrome.app' ${1}"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

update() {
    brew update; brew upgrade; brew cleanup;
    python3 -m pip install --upgrade pip
    python3 -m pip install --upgrade pip -q -r ~/.dotfiles/requirments.txt
    npm install npm -g; npm update -g;
}


# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias desktop="cd ~/Desktop"

# Time and Date
#   Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. <crtl+d> to breack." && date && time cat && date'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig | grep inet | grep -v inet6 | awk '{print $2}'"

# Lookup
alias diga="dig +nocmd "$1" any +multiline +noall +answer"

# Always enable colored `grep` output
alias grep='grep --color=auto '

# Enable aliases to be sudo’ed
alias sudo='sudo '


# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
