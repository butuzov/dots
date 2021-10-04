export TERM="xterm-color"
export CLICOLOR=1l
export LSCOLORS=ExFxBxDxCxegedabagacad

# How it looks
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
WHITE="\[\e[107;30m\]"
BG_GREEN="\[\e[102;30m\]"
BG_BLUE="\[\e[104;30m\]"
BG_YELLOW="\[\e[103;30m\]"
YELLO="\[\e[1;33m\]"
RESET="\[\e[0m\]"

export LC_CTYPE="UTF-8"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# iterm related
echo -e "\033]6;1;bg;red;brightness;60\a"   > /dev/null
echo -e "\033]6;1;bg;green;brightness;40\a" > /dev/null
echo -e "\033]6;1;bg;blue;brightness;40\a"  > /dev/null

# Reload Config
alias reload="exec ${SHELL} -l"


source "${DOTS_PATH}/scripts/pathes.sh"                # Pathes
source "${DOTS_PATH}/scripts/prompt.sh"                # Propt customization


PS1="${RESET}"
PS1+="${WHITE} $ \u ${RESET}"
PS1+="${BG_BLUE}\$(kube_ctx_check)${RESET}"
PS1+="${BG_GREEN} \w ${RESET}"
PS1+="${BG_YELLOW}\$(git_ctx_check)${RESET}"
PS1+="\n${YELLO} > ${RESET}"
export PS1=$PS1
export SUDO_PS1="${RESET}${WHITE} # \u@\h ${GREEN} \w ${RESET} \n${YELLO} > ${RESET}";


# the rest of sources
source "${DOTS_PATH}/scripts/complete.sh"             # auto complete/bash complete

source "${DOTS_PATH}/scripts/aliases.sh"               # General Aliases File

source "${DOTS_PATH}/scripts/language-python.sh"                # Python
source "${DOTS_PATH}/scripts/language-go.sh"                    # Go
source "${DOTS_PATH}/scripts/language-php.sh"                   # PHP
source "${DOTS_PATH}/scripts/language-node.sh"                  # Node


# fuck year! https://news.ycombinator.com/item?id=26946093
shuf -n 1 ~/unsoliced.txt | cowsay -f small






