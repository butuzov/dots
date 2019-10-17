export TERM="xterm-color"

# How it looks
GREEN="\[\e[102;30m\]"
WHITE="\[\e[107;30m\]"
YELLO="\[\e[1;33m\]"
RESET="\[\e[0m\]"

echo -e "\033]6;1;bg;red;brightness;40\a" > /dev/null
echo -e "\033]6;1;bg;green;brightness;40\a" > /dev/null
echo -e "\033]6;1;bg;blue;brightness;40\a" > /dev/null

# export PS1="${RESET}${WHITE} $ \u@\h ${GREEN} \w ${RESET} \n${YELLO} > ${RESET}";
export PS1="${RESET}${WHITE} $ \u ${GREEN} \w ${RESET} \n${YELLO} > ${RESET}";
export SUDO_PS1="${RESET}${WHITE} # \u@\h ${GREEN} \w ${RESET} \n${YELLO} > ${RESET}";

export CLICOLOR=1l
export LSCOLORS=ExFxBxDxCxegedabagacad

export LC_CTYPE="UTF-8"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Realod Config
alias reload="exec ${SHELL} -l"

# completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Local bin directory
PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}" # coreutils
PATH="${DOTS_PATH}/bin:${PATH}"                        # .dots/bin
PATH="${HOME}/bin:${PATH}"                             # ~/bin/


# Custom Functionality
# Added to remove personal (sub projects to be hardcoded)
if [[ -d "${DOTS_PATH}/bin-extentions" ]]; then
    for script in $(find "${DOTS_PATH}/bin-extentions" -type f -name "*.sh")
    do source $script
    done
fi

# used aliases
source "${DOTS_PATH}/scripts/aliases.sh"               # General Aliases File
source "${DOTS_PATH}/scripts/python.sh"                # Python

# ---- Google Cloud ----------------------------------------------
GCLOUD_SDK="/usr/local/Caskroom/google-cloud-sdk"
source "${GCLOUD_SDK}/latest/google-cloud-sdk/path.bash.inc"
source "${GCLOUD_SDK}/latest/google-cloud-sdk/completion.bash.inc"

alias gcp="open https://console.cloud.google.com/"


# Go
export GOPATH="${HOME}/go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="${GOPATH}/bin:${GOROOT}/bin:${PATH}"

# CUDA
if [[ -d "/usr/local/cuda" ]]; then
    export CUDA_PATH="/usr/local/cuda"
    export CUDA_HOME="${CUDA_PATH}"
    export DYLD_LIBRARY_PATH="${CUDA_PATH}/lib:${CUDA_PATH}/extras/CUPTI/lib:${DYLD_LIBRARY_PATH}"
    export LD_LIBRARY_PATH=$DYLD_LIBRARY_PATH
    export PATH="${DYLD_LIBRARY_PATH}:${CUDA_PATH}/bin:${PATH}"
    export CPATH="${CUDA_PATH}/include/"
    export CGO_LDFLAGS="/usr/local/cuda/lib/libcuda.dylib ${CUDA_PATH}/lib/libcudart.dylib ${CUDA_PATH}/lib/libcublas.dylib ${CUDA_PATH}/lib/libcurand.dylib"
fi

# GNU Sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
