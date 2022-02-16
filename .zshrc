
# Reload Config
alias reload="clear && exec ${SHELL} -l"



export TERM="xterm-color"
export CLICOLOR=1l
export LSCOLORS=ExFxBxDxCxegedabagacad

source "${DOTS_PATH}/scripts/pathes.sh"                # Pathes
# source "${DOTS_PATH}/scripts/prompt.sh"              # Propt customization

source "${DOTS_PATH}/scripts/aliases.sh"               # General Aliases File
source "${DOTS_PATH}/scripts/autocomplete.sh"          # Autocomplete


source "${DOTS_PATH}/scripts/language-python.sh"                # Python
source "${DOTS_PATH}/scripts/language-go.sh"                    # Go



# fuck year! https://news.ycombinator.com/item?id=26946093
shuf -n 1 ~/unsoliced.txt | cowsay -f small
