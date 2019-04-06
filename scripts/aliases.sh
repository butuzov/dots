# Realod Config
alias reload='source ~/.bash_profile'
alias dots='code ~/.dotfiles'
alias today='code ~/Dropbox/today.md'
alias notes='code ~/Dropbox/Coding/todayilearned'

# chrome
alias chrome="open -a'/Applications/Google Chrome.app' ${1}"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

alias linux="cd ~/Desktop/CentOS_7 && vagrant up && vagrant ssh"

# alias update='sudo softwareupdate -i -a;  sudo gem update --system; sudo gem update; sudo gem cleanup'
alias update='brew update; brew upgrade; brew cleanup;npm install npm -g; npm update -g;'
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

# Always enable colored `grep` output
alias grep='grep --color=auto '

# Enable aliases to be sudo’ed
alias sudo='sudo '
