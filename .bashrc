export TERM="xterm-color"

# How it looks
GREEN="\[\e[102;30m\]"
WHITE="\[\e[107;30m\]"
YELLO="\[\e[1;33m\]"
RESET="\[\e[0m\]"

echo -e "\033]6;1;bg;red;brightness;40\a" > /dev/null
echo -e "\033]6;1;bg;green;brightness;40\a" > /dev/null
echo -e "\033]6;1;bg;blue;brightness;40\a" > /dev/null

export PS1="${RESET}${WHITE} $ \u@\h ${GREEN} \w ${RESET} \n${YELLO} > ${RESET}";
export SUDO_PS1="${RESET}${WHITE} # \u@\h ${GREEN} \w ${RESET} \n${YELLO} > ${RESET}";

export CLICOLOR=1l
export LSCOLORS=ExFxBxDxCxegedabagacad

export LC_CTYPE="UTF-8"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Custom Functionality
# Added to remove personal (sub projects to be hardcoded)
if [[ -d "${DOTS_PATH}/custom" ]]; then
    for script in $(find "${DOTS_PATH}/custom" -type f -name "*.sh")
    do source $script
    done
fi

# Bash usage
source "${DOTS_PATH}/bash/helpers.sh"            # Functions (Helpers)
source "${DOTS_PATH}/bash/funcs.sh"              # Functions
source "${DOTS_PATH}/bash/aliases.sh"            # General Aliases File
source "${DOTS_PATH}/bash/locals.sh"             # Local Commands
source "${DOTS_PATH}/bash/coreutils.sh"          # Local Commands

# Tools
source "${DOTS_PATH}/bash/docker.sh"             # Docker Commands

# Local bin directory
export PATH="${DOTS_PATH}/bin:${PATH}"

# Home
export PATH="${HOME}/bin:${PATH}"

# Development
source "${DOTS_PATH}/programming/php.sh"         # PHP 7.2.5
source "${DOTS_PATH}/programming/go.sh"          # Go
source "${DOTS_PATH}/programming/python.sh"      # Python
source "${DOTS_PATH}/programming/go.sh"          # Groovy
source "${DOTS_PATH}/programming/cuda.sh"        # CUDA




