# # Go
export GOPATH="${HOME}/go"
export GOROOT="/usr/local/opt/go/libexec"

if [[ $PATH != *$GOPATH* ]]; then
    export PATH="${GOPATH}/bin:${PATH}"
fi

if [[ $PATH != *$GOROOT* ]]; then
    export PATH="${GOROOT}/bin:${PATH}"
fi


export GOPROXY="https://proxy.golang.org,direct" #this should already be the default
export GONOSUMDB="bitbucket.org/sixtgoorange,github.com/sixt"
export GONOPROXY="bitbucket.org/sixtgoorange,github.com/sixt"
export GOPRIVATE="bitbucket.org/sixtgoorange,github.com/sixt"
