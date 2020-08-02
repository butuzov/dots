# Reload Config
alias reload="exec ${SHELL} -l"


# completion
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] &&  . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

[[ -f "$(brew --prefix)/etc/bash_completion" ]] && . "$(brew --prefix)/etc/bash_completion"

# Local bin directory
GNUTILS=( "gnu-tar" "gnu-sed" "coreutils" "gnu-indent" "findutils" "grep")
for CMD in "${GNUTILS[@]}"  ; do
  BIN_DIR=$(printf /usr/local/opt/%s/libexec/gnubin $CMD )
  if [[ $PATH != *$BIN_DIR* ]]; then
    export PATH="$BIN_DIR:$PATH"
  fi
done

if [[ $PATH != *$DOTS_PATH/bin* ]]; then
    export PATH="$DOTS_PATH/bin:$PATH"
fi

if [[ $PATH != *$HOME/bin* ]]; then
    export PATH="$HOME/bin:$PATH"
fi


alias brew_update_all="brew bundle --file=Brewfile"

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
if [[ $PATH != *$GOPATH* ]]; then
    export PATH="${GOPATH}/bin:${PATH}"
fi
if [[ $PATH != *$GOROOT* ]]; then
    export PATH="${GOROOT}/bin:${PATH}"
fi

# Node
export PATH="/usr/local/opt/node@12/bin:$PATH"

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

# homebrew required vars
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

# promp moved to bottom so we can actuially use installed tools.
source "${DOTS_PATH}/.prompt"
