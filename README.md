#My dotfiles.

Works on *nix, optimized for OS X.

Managed using [Stow](http://www.gnu.org/software/stow/), so you can pick and
choose which programs to install.


---
##Philosophy

Initially I tried entirely automating the entire install process, but quickly
found it wasn't worth the maintenance. Starting from scratch happens so rarely
for me that each time I was fiddling with the bootstrap scripts to work around
a random issue (often due to a new version of OSX).

Instead, it's simpler to install stuff by hand, and manage only the
configuration files (dotfiles) in this repo.


---
##Install steps on a clean OSX machine:

1. `git clone git@github.com:jeffwidman/dotfiles.git ~/.dotfiles`
  - If cloning to a server without a Github-connected SSH key use 'https' instead:
      `git clone https://github.com/jeffwidman/dotfiles.git ~/.dotfiles`

2. Install desired binaries using your favorite package manager.
  - If on OSX, install [Homebrew](http://brew.sh/)
  - `brew bundle` [is deprecated](https://github.com/Homebrew/homebrew/issues/32952), so just manually run the Homebrew commands listed in `~/.dotfiles/homebrew/Brewfile`
  - For Ruby, install using [RVM](http://rvm.io/) instead of Homebrew. Much easier to manage gemsets, ruby versions, etc.
  - Make sure Stow gets installed, we'll use this later to symlink the dotfiles.

3. Make ZSH the default shell.  
  1. `$ $EDITOR /etc/shells`
  2. Append the path to zsh - Homebrew sticks it in `/usr/local/bin/zsh`
  3. Save and exit
  4. `$ chsh -s /usr/local/bin/zsh`

4. Install Prezto:
  - Install [my fork](https://github.com/jeffwidman/prezto) because it includes a plugin for [Atom](http://atom.io).

  `git clone --recursive git@github.com:jeffwidman/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"`

  - The default prezto instructions say to symlink the default config files.
    **Don't do this**; instead use Stow to symlink your own config files.
  - To update Prezto: `git pull && git submodule update --init --recursive`

5. Now use `stow` to symlink the various config files:
  - `$ cd ~/.dotfiles`
  - `$ stow PACKAGE_NAME` will symlink all the files inside of the package_name's folder into the user's home folder.
  - Stow thoughtfully raises an error if the symlink destination already exists. For example, installing ZSH creates a default `~/.zshrc` and `~/.zshlogin`. Just delete these default files before stowing your customized versions.
  - If you are on an OS with a different path, such as to the fonts folder, then specify the full path
  - More info:
     - http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
     - http://taihen.org/managing-dotfiles-with-gnu-stow/
     - http://kianmeng.org/blog/2014/03/08/using-gnu-stow-to-manage-your-dotfiles/
  - Several config files aren't `stow`able--review the list below

---
##List of config files

 - Atom - Settings are stowable, but packages purposefully excluded. Use `$ apm stars --install` to install all packages I've [starred](https://atom.io/users/jeffwidman/stars) on [atom.io/packages](https://atom.io/packages).
 - bash
 - fonts - if you're not on OSX, you'll likely need to specify a different path when stowing
 - git
 - homebrew - not stowable
 - OS X Hosts GUI - not stowable, install from https://github.com/specialunderwear/Hosts.prefpane
 - iTerm2
 - neovim - I prefer over Vim for the simple reason they accepted one of my patches ;)
 - osx
 - python - not stowable.
 - ruby
 - screen
 - tmux - #TODO
 - vim - for when Neovim isn't available
 - vimify - `.inputrc` and `.editrc` make vim commands work in many interactive
    shells, for example the mysql and postgres shells
 - zsh - includes prezto config files


---
##Misc Notes:

For themes, check out the [Base16 template system](https://github.com/chriskempson/base16). It includes templates for
theming many different apps.

Colorschemes that I like:
 - monokai
 - solarized
 - railscasts

Fonts that I like:
 - Ubuntu Monospace including powerline fix
 - Adobe Source Code (look for powerline fix)


---
##TODO:

 - add https://github.com/skwp/dotfiles/blob/master/ctags/ctags to make ctags parse ruby and js better
 - how to use ctags http://scholarslab.org/research-and-development/code-spelunking-with-ctags-and-vim/

 - Improve my vimrc and nvimrc - vim plugins:
   - vim-markdown Markdown syntax highlighting for Vim
   - syntastic (pylint, pep8, pyflakes linters)
   - youcompleteme
   - tasklist
   - taglist (and ctags) (tagbar as alternative?)
   - nerdtree
   - powerline
   - minibuffexplorer
   - the_silver_searcher (vs ctrlp?)

 - add ipython (replaces python interpreter)

 - add powerline - used in vim, [zsh](http://powerline.readthedocs.org/en/latest/usage/shell-prompts.html), ipython, and tmux

 - gitignore add:
    - https://github.com/github/gitignore/blob/master/Global/Vagrant.gitignore
    - https://github.com/github/gitignore/blob/master/Global/VirtualEnv.gitignore
    - https://github.com/github/gitignore/blob/master/Global/vim.gitignore


---
## Thanks

 - [@dave-tucker](https://github.com/dave-tucker/dotfiles) - Initial inspiration, although I totally rebooted my dotfiles several times since then
 - [@chriskempson](https://github.com/chriskempson/base16) - for base16
 - [@sorin-ionescu](https://github.com/sorin-ionescu/prezto) - for prezto
 - [@skwp](https://github.com/skwp/dotfiles) - another inspiration dotfiles repo
 - [@mathiasbyens](https://github.com/mathiasbynens/dotfiles) - for his awesome osx customization script

---
## License

Copyright 2014 Jeff Widman
Licensed under the MIT License
