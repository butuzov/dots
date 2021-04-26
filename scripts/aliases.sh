# Realod Config
if [[ -f ~/.dropbox/info.json ]]; then
    DROPBOX="$(cat ~/.dropbox/info.json | jq .personal.path | sed -e 's/"//g' )"
fi

alias .dots='code ~/.dotfiles'

alias today='code ~/Desktop/notes/'
alias daily='code ~/Desktop/notes/'

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

update() {
    brew update; brew upgrade; brew cleanup;
    python3 -m pip install --upgrade pip
    python3 -m pip install --upgrade pip -q -r ~/.dotfiles/requirments.txt
    npm install npm -g; npm update -g;
}




# Lookup
alias diga="dig +nocmd "$1" any +multiline +noall +answer"


# Enable aliases to be sudo’ed
alias sudo='sudo '


