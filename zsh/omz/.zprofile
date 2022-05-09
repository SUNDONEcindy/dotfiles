eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

eval "$(pyenv init --path)"
eval "$(rbenv init - zsh)"
