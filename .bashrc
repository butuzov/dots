export TERM="xterm-color"

# How it looks
GREEN="\[\e[102;30m\]"
WHITE="\[\e[107;30m\]"
YELLO="\[\e[1;33m\]"
RESET="\[\e[0m\]"

export PS1="${RESET}${WHITE} $ \u@\h ${GREEN} \w ${RESET} \n${YELLO} > ${RESET}";
export SUDO_PS1="${RESET}${WHITE} # \u@\h ${GREEN} \w ${RESET} \n${YELLO} > ${RESET}";

export CLICOLOR=1l
export LSCOLORS=ExFxBxDxCxegedabagacad

export LC_CTYPE="UTF-8"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Bash usage
source "${DOTS_PATH}/bash/aliases.sh"            # General Aliases File
source "${DOTS_PATH}/bash/funcs.sh"              # Functions
source "${DOTS_PATH}/bash/locals.sh"             # Local Commands

# Development

source "${DOTS_PATH}/programming/php.sh"         # PHP 7.1
source "${DOTS_PATH}/programming/python.sh"      # Python 3.6
source "${DOTS_PATH}/programming/go.sh"          # Go
source "${DOTS_PATH}/programming/cuda.sh"        # Cuda



