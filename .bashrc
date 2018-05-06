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

alias reload='source ~/.bash_profile'

# shortcats for tools
alias ls='ls -liAh'
alias ps='ps aux'
alias grep='grep --color=auto'

alias video_dir='cd /Volumes/Developer/Video-Library/Videos'
alias video_convert='go run converter.go -directory=__converting'

# Python
export PYTHONPATH="/Library/Frameworks/Python.framework/Versions/3.6"
export PATH="${PATH}:${PYTHONPATH}/bin"

# Go
export GOPATH="$HOME/go"
export PATH="${PATH}:${GOPATH}/bin"

# Cuda
export CUDA_PATH="/Developer/NVIDIA/CUDA-9.1"
export DYLD_LIBRARY_PATH="$CUDA_PATH/lib":$DYLD_LIBRARY_PATH
export PATH="$PATH:$CUDA_PATH/bin"
export CPATH="$CUDA_PATH/include/"
export CGO_LDFLAGS="/usr/local/cuda/lib/libcuda.dylib $CUDA_PATH/lib/libcudart.dylib $CUDA_PATH/lib/libcublas.dylib $CUDA_PATH/lib/libcurand.dylib"

# PHP (no need atm)

# User space commands
alias conf-dl="youtube-dl -o '%(playlist_index)s %(title)s.%(ext)s' $1"
alias youtube-mp3="youtube-dl --extract-audio --audio-format mp3 $1"

# set up wp dev env
alias web='/Volumes/Developer/WordPress/.settings/commander.sh $1 $(pwd)'
