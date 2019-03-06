# Realod Config
alias reload='source ~/.bash_profile'
alias edit='code ~/.dotfiles'
alias notes='code ~/Users/butuzov/Desktop/today.md'
alias facts='code ~/Users/butuzov/Desktop/facts.md'
alias today="cd ~/Dropbox/Dev-Projects/todayilearned && code ~/Dropbox/Dev-Projects/todayilearned"


# chrome
alias chrome="open -a'/Applications/Google Chrome.app' ${1}"
alias linux="cd ~/Desktop/centos && vagrant up && vagrant ssh"


# Jupyter with Go kernel
alias nbgo="docker rmsc && chrome http://localhost:8889 && docker run -it --name jupyter-go -p 8889:8888 -v $(pwd):/notebooks gopherdata/gophernotes:latest-ds sh -c \"jupyter notebook --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.notebook_dir=/notebooks\" "

# Regular Jupyter started with
alias nbpy=". ~/Desktop/Py3.7/bin/activate && jupyter notebook"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias home="cd ~"
alias desktop="cd ~/Desktop"

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

# calculate video langht of the video course
vl(){
    echo ${1}
    SEC=$(find . -name "*mp4" -print0 | xargs -0 -I {} sh -c 'ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "{}"' | awk '{ sum += $1; } END { print sum; }' "$@" );
    printf "Total Time of course is : %s\n" $(convertsecs $SEC)
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
