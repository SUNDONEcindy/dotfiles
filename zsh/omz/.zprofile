eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

eval "$(direnv hook zsh)"
eval "$(pyenv init --path)"
eval "$(rbenv init - zsh)"
