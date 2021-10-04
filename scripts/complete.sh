

# completion
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && \
  . "/usr/local/etc/profile.d/bash_completion.sh"


[[ -f "$(brew --prefix)/etc/bash_completion" ]] && \
  . "$(brew --prefix)/etc/bash_completion"

