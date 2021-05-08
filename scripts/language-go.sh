# # Go

# gvm

export GOPROXY="https://proxy.golang.org,direct" #this should already be the default
export GONOSUMDB=""
export GONOPROXY=""
export GOPRIVATE=""


[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"



# default go
export GOPATH="$HOME/.gvm/pkgsets/go1.16.4/global"
export GOROOT="$HOME/.gvm/gos/go1.16.4"
