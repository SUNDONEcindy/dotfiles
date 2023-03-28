# If you come from bash you might have to change your $PATH.
# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  # NOTE: ensure MHPCC ssh and kerberos take precedent
  # pyenv does weird stuff that silently overrides this if it comes first in $PATH
  /usr/local/krb5/bin
  /usr/local/ossh/bin

  # NOTE: must come after kerberos and kerberized-ssh paths
  $(pyenv root)/shims
  /usr/local/{bin,sbin}
  $path
)

# preprend some paths, if they exist
for d in ${HOME}/.emacs.d/bin \
  ${HOME}/.fzf/bin \
  ${HOME}/.poetry/bin \
  ${HOME}/local/miniconda3/bin \
  ${HOME}/local/bin; do

  if [[ -d ${d} ]]; then
    path=(
      ${d}
      $path
    )
  fi
done

if [[ -d ${HOME}/modulefile ]]; then
  module use ${HOME}/modulefile
fi


# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
#export ZSH="/work1/home/jdfarin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=${HOME}/dotfiles/zsh//omz/custom

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git 
	colored-man-pages
	colorize
	docker
	docker-compose
	jsontools
  ripgrep
	zsh-autosuggestions
	zsh-syntax-highlighting
	fzf
	fzf-tab)

source $ZSH/oh-my-zsh.sh

# User configuration
setopt share_history
setopt histignorealldups
export HISTSIZE=100000
# export MANPATH="/usr/local/man:$MANPATH"
export MANPATH="/usr/local/krb5/man:$MANPATH"

# export BAT_THEME=Dracula
export BAT_THEME=base16-256

export LESSOPEN="| $(which lesspipe.sh) %s" LESS_ADVANCED_PREPROCESSOR=1

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

# use colorized less and cat (cless and ccat, respectively)
export ZSH_COLORIZE_STYLE='monokai'
# alias less=cless
# alias cat=ccat

# fzf-tab stuff
export FZF_DEFAULT_OPTS='--height 100% --layout=reverse --border'
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# needed because we pass '--border'
zstyle ':fzf-tab:*' fzf-pad 4


# make linuxbrew use newer git and curl
#export HOMEBREW_NO_ENV_FILTERING=1
# export HOMEBREW_GIT_PATH=${HOME}/local/bin/git
#export HOMEBREW_CURL_PATH=${HOME}/local/bin/curl
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# setup starship prompt
eval $(starship init zsh)

# and make brew work
if [[ -d /opt/homebrew/bin ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/tervist/.pyenv/versions/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/tervist/.pyenv/versions/mambaforge/etc/profile.d/conda.sh" ]; then
#         . "/Users/tervist/.pyenv/versions/mambaforge/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/tervist/.pyenv/versions/mambaforge/bin:$PATH"
#     fi
# fi
# unset __conda_setup

# if [ -f "/Users/tervist/.pyenv/versions/mambaforge/etc/profile.d/mamba.sh" ]; then
#     . "/Users/tervist/.pyenv/versions/mambaforge/etc/profile.d/mamba.sh"
# fi
# <<< conda initialize <<<

