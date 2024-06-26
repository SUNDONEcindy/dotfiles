#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

umask 022

### Pip (Python) ###
# pip should only run if there is a virtualenv currently activated
# prevents accidentally installing packages without a virtualenv
# export PIP_REQUIRE_VIRTUALENV=true
# create syspip workaround
syspip2(){
  PIP_REQUIRE_VIRTUALENV="" pip2 "$@"
}
syspip3(){
  PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}


### iTerm2 shell integration ###
# https://iterm2.com/documentation-shell-integration.html
# For safety, first verify that the file actually exists and that this is an
# OSX box in case I accidentally stow'd the file from my dotfiles on a different platform
if [[ -s "$HOME/.iterm2_shell_integration.zsh" && "$OSTYPE" = darwin* ]]; then
  source "$HOME/.iterm2_shell_integration.zsh"
fi


### Use Base16 templating system to theme shell colors ###
# if [[ -s "$HOME/.config/base16-shell/base16-ocean.dark.sh" ]]; then
#   source "$HOME/.config/base16-shell/base16-ocean.dark.sh"
# fi


### Extra ZSH options ###
# If querying the user before executing `rm *' or `rm
# path/*', first wait ten seconds and ignore anything typed
# in that time. This avoids the problem of reflexively
# answering `yes' to the query when one didn't really mean
# it.
setopt RM_STAR_WAIT

# starship prompt for maximum PS1 goodness!
eval "$(starship init zsh)"

### fzf location, if it's installed in ~/local/bin
# for some reason this doesn't work if it's in ~/.zshenv
if [[ -s "${HOME}/local/bin/fzf" ]]; then
  export FZF_BASE="${HOME}/local/bin"
fi
### fzf configuration
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

if [[ -d "${HOME}/modulefiles" ]]; then
  module use ${HOME}/modulefiles
  module load slurm
fi
