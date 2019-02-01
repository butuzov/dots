_pip_completion() {
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip3

# Setting PATH for Python 3.6 - 3.6 used for tensorflow on "bigmac"
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
