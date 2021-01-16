alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."


# All Bew Updates
alias brew_update_all="brew bundle --file=Brewfile"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig | grep inet | grep -v inet6 | awk '{print $2}'"



# Navigation
alias desk="cd ~/Desktop"


# Time and Date
#   Get week number
alias week='date +%V'
# Stopwatch
alias timer='echo "Timer started. <crtl+d> to breack." && date && time cat && date'


# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

alias focuson="defaults write com.apple.dock single-app -bool true && killall Finder"
alias focusoff="defaults write com.apple.dock single-app -bool false && killall Finder"


# misc
alias shrug='echo "¯\_(ツ)_/¯"'
alias udemy='printf "https://www.udemy.com/api-2.0/courses/%d/public-curriculum-sections\n" $1'
alias vmp='cd "/Library/Preferences/VMware Fusion/"'

# extensions
alias grep='grep --color=auto '


# scrape
alias isgziped="curl -sH 'Accept-encoding: gzip' $1"
