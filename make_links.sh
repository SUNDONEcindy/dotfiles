#!/bin/bash

# run this if we don't have stow to manually create symlinks in $HOME

# bash

# chunkwm

# doom

# flake8
ln -s $(readlink -f flake8/.config/flake8) ${HOME}/.config/

# git
ln -sv $(readlink -f git/.gitconfig) ${HOME}/
ln -sv $(readlink -f git/.gitignore_global) ${HOME}/

# htop
mkdir -p ${HOME}/.config/htop
ln -sv $(readlink -f htop/.config/htop/htoprc) ${HOME}/.config/htop/

# khd

# kitty

# ptpython
mkdir -p ${HOME}/.ptypython
ln -sv $(readlink -f ptpython/.ptpython/config.py) ${HOME}/.ptypython/

# pudb
mkdir -p ${HOME}/.config/pudb
ln -sv $(readlink -f pudb/.config/pudb/pudb.cfg) ${HOME}/.config/pudb/

# pydocstyle
ln -sv $(readlink -f pydocstyle/.pydocstylerc) ${HOME}/

# pylint
ln -sv $(readlink -f pylint/.plintrc) ${HOME}/

# spacemacs
ln -sv $(readlink -f spacemacs/.spacemacs) ${HOME}/
ln -sv $(readlink -f spacemacs/.spacemacs.env) ${HOME}/

# ssh
mkdir -p ${HOME}/.ssh
chmod 600 ${HOME}/.ssh
ln -sv $(readlink -f ssh/.ssh/config) ${HOME}/.ssh/

# tmux
ln -sv $(readlink -f tmux/.tmux.conf) ${HOME}/
ln -sv $(readlink -f tmux/.tmux.conf.local) ${HOME}/

# vim

# vimify
ln -sv $(readlink -f vimify/.editrc) ${HOME}/
ln -sv $(readlink -f vimify/.inputrc) ${HOME}/

# zsh
ln -sv $(readlink -f zsh/.zlogin) ${HOME}/
ln -sv $(readlink -f zsh/.zpreztorc) ${HOME}/
ln -sv $(readlink -f zsh/.zprofile) ${HOME}/
ln -sv $(readlink -f zsh/.zshenv) ${HOME}/
ln -sv $(readlink -f zsh/.zshrc) ${HOME}/
