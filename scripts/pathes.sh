

# Local bin directory
GNUTILS=( "gnu-sed" "coreutils" "gnu-indent" "findutils" "grep")
for CMD in "${GNUTILS[@]}"  ; do
  BIN_DIR=$(printf /usr/local/opt/%s/libexec/gnubin $CMD )
  if [[ $PATH != *$BIN_DIR* ]]; then
    export PATH="$BIN_DIR:$PATH"
  fi
done

if [[ $PATH != *$DOTS_PATH/bin* ]]; then
    export PATH="$DOTS_PATH/bin:$PATH"
fi

if [[ $PATH != *$DOTS_PATH/bin-scripts* ]]; then
    export PATH="$DOTS_PATH/bin-scripts:$PATH"
fi



if [[ $PATH != *$HOME/bin* ]]; then
    export PATH="$HOME/bin:$PATH"
fi


# Added to remove personal (sub projects to be hardcoded)
if [[ -d "${DOTS_PATH}/bin-extentions" ]]; then
    for script in $(find "${DOTS_PATH}/bin-extentions" -type f -name "*.sh")
    do source $script
    done
fi



# homebrew required vars
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
