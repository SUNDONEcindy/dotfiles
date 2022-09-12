eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# eval "$(direnv hook zsh)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(rbenv init - zsh)"
