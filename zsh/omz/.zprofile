# make brew work
if [[ -d /opt/homebrew/bin ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# eval "$(direnv hook zsh)"
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"

# eval "$(pyenv virtualenv-init -)"
# pyenv-virtualenv installs a precmd hook which can be terribly slow
# This fixes it to only run when you cd
# eval "$(rbenv init - zsh)"
export BAT_THEME=Dracula
