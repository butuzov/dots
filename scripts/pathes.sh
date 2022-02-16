

# Local bin directory
GNUTILS=( "gnu-sed" "coreutils" "gnu-indent" "findutils" "grep")
for CMD in "${GNUTILS[@]}"  ; do
  BIN_DIR=$(printf /opt/homebrew/opt/%s/libexec/gnubin $CMD )
  if [[ $PATH != *$BIN_DIR* ]]; then
    export PATH="$BIN_DIR:$PATH"
  fi
done

if [[ $PATH != *$DOTS_PATH/bin* ]]; then
    export PATH="$DOTS_PATH/bin:$PATH"
fi

if [[ $PATH != *$DOTS_PATH/bin/scripts* ]]; then
    export PATH="$DOTS_PATH/bin/scripts:$PATH"
fi


if [[ $PATH != *$HOME/bin* ]]; then
    export PATH="$HOME/bin:$PATH"
fi


# Added to remove personal (sub projects to be hardcoded)
if [[ -d "${DOTS_PATH}/bin/sources" ]]; then
    for script in $(find "${DOTS_PATH}/bin/sources" -type f -name "*.sh")
      do source $script
    done
fi

if [[ -d "${DOTS_PATH}/bin/extensions" ]]; then
    for script in $(find "${DOTS_PATH}/bin/extensions" -type f -name "*.sh")
      do source $script
    done
fi



# homebrew required vars
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
