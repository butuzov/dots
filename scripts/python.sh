#!/usr/bin/env bash

# ----- Python Development ---------------------------------------


pip_completion() {
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
        COMP_CWORD=$COMP_CWORD PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F pip_completion pip

pip_cleanup() {
    # Performas pip cleanup (w/o or w/i venv)
    pip list | awk 'NR>2 {print $1}' | \
        grep -Ev "pip|setuptools|wheel" | \
        xargs -I {} sh -c "pip uninstall {} -y"
}

# removes found pyc files.
alias rmpyc='find . -type f -name "*.pyc" -exec rm -r {} \;'

# Python

# Do not Write pyc files, not optimized but safe for shared
# computers to run same code.
export PYTHONDONTWRITEBYTECODE=true

# Loading python version.
for version in  3.{4,5,6,7,8}; do
  PY_PATH="/Library/Frameworks/Python.framework/Versions/${version}/bin"
  if [[ -d $PY_PATH ]] && [[ $PATH != "*$PY_PATH*" ]]; then
    PATH="${PY_PATH}:${PATH}"
  fi
done
export PATH


# Ansible related.
export ANSIBLE_NOCOWS=1
