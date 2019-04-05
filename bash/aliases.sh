# Realod Config
alias reload='source ~/.bash_profile'
alias dots='code ~/.dotfiles'
alias today='code ~/Dropbox/today.md' 
alias notes='cd ~/Dropbox/Coding/todayilearned && code ~/Dropbox/Coding/todayilearned'

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

alias mlv="make_list_videos"

# Go PAth Commander?
# I am so terrible with pans-naming
# https://en.wikipedia.org/wiki/Hopak
gopac(){

    if [[ -z "${1}" ]]; then
        printf "Help: gopak\n\n"
        printf "\tgopac          : %s\n"     "Show help"
        printf "\tgopac %s        : %s\n" '?' "Show \$GOPATH variable"
        printf "\tgopac %s        : %s\n" '-' "Restore previous \$GOPATH variable"
        printf "\tgopac %s  : %s\n" 'cd $dir' "cd to \$GOPATH/src/github/\$dir"
        printf "\tgopac %s : %s\n" 'set $dir' "set new \$GOPATH directory"
        printf "\n"

        return
    fi

    # SHOW $GOPATH variable
    if [[ "${1}" == "?" ]]; then
        if [[ ! -z "${GOPATH}" ]]; then
            printf "\t\$GOPATH:%s\n\n" "${GOPATH}"
             return 0
        else
            printf "\t\$GOPATH not set\n\n"
            return 1
        fi

    fi

    # CD into SRC directory
    # tests gopak cd gopherdata/gophernotes
    if [[ "${1}" == "cd" ]]; then
        if [[ -z "${2}" ]]; then
            printf "Command isn't clear: \`gopak cd where\`?\n"

            printf "\t\`where\` suppose to ba package name\n\n"
            return 1
        fi
        cd  "$(printf '%s/src/github.com/%s' "${GOPATH}" "${2}" )"
        return $?
    fi

     # RESTORE $GOPATH variable
    if [[ "${1}" == "-" ]]; then
        printf "Restoring old \$GOPATH:\n\n" "${OLD_PATH}"
        if [[ ! -z "${OLD_GOPATH}" ]]; then
            gopak set "${OLD_GOPATH}"
            return $?
        else
            printf "\t\$OLD_GOPATH variable is empty\n\n"
            return 1
        fi
    fi

    if [[ "${1}" == "set" ]]; then
        NEW_GOPATH="${2}"
        if [[ -z "${NEW_GOPATH}" ]] || [[ ! -d "${NEW_GOPATH}" ]] ; then
            NEW_GOPATH=$(pwd)
        fi

         # updating old path
        OLD_GOPATH=$GOPATH

        if [[ $NEW_GOPATH == $OLD_GOPATH ]]; then

            printf "No Changes:\n"
            printf "OLD \$GOPATH=%s\n" $NEW_GOPATH
            return 1
        fi

        export GOPATH="$NEW_GOPATH"
        printf "NEW \$GOPATH=%s\n" $NEW_GOPATH
        printf "OLD \$GOPATH=%s\n" $OLD_GOPATH

    fi
}




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

# Creates RAM disk of 8gb (default value) with a name ram (default value)
# usage ramdisk 8
# usage ramdisk 10 ramka_na_stinky
ram(){
    diskutil erasevolume HFS+ "${2:-ram}" $(hdiutil attach -nomount ram://$((2*1000*1000*${1:-8})))
    open "/Volumes/${2:-ram}"
}
