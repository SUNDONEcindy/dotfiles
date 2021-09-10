#!/bin/bash
# run this if we don't have stow to manually create symlinks in $HOME

# ensure the XDG_CONFIG target directory exists
mkdir -p ${HOME}/.config

# bash

# chunkwm

# doom
ln -sv $(readlink -f doom/.config/doom) ${HOME}/.config/

# fish

# flake8
if ! command -v flake8 &> /dev/null
then
    echo "flake8 could not be found. skipping"
else
    ln -s $(readlink -f flake8/.config/flake8) ${HOME}/.config/
fi

# git
if ! command -v git &> /dev/null
then
    echo "git could not be found. skipping"
else
    ln -sv $(readlink -f git/.gitconfig) ${HOME}/
    ln -sv $(readlink -f git/.gitignore_global) ${HOME}/
fi

# htop
if ! command -v htop &> /dev/null
then
    echo "htop could not be found. skipping"
else
    ln -sv $(readlink -f htop/.config/htop) ${HOME}/.config/
fi

# i3

# ipython

# khd

# kitty

# ptpython
if ! command -v ptpython &> /dev/null
then
    echo "ptpython could not be found. skipping"
else
    mkdir -p ${HOME}/.ptypython
    ln -sv $(readlink -f ptpython/.ptpython/config.py) ${HOME}/.ptypython/
fi

# pudb
if ! command -v pudb &> /dev/null
then
    echo "pudb could not be found. skipping"
else
    ln -sv $(readlink -f pudb/.config/pudb) ${HOME}/.config/
fi

# pydocstyle
if ! command -v pydocstyle &> /dev/null
then
    echo "pydocstyle could not be found. skipping"
else
    ln -sv $(readlink -f pydocstyle/.pydocstylerc) ${HOME}/
fi

# pylint
if ! command -v pylint &> /dev/null
then
    echo "pylint could not be found. skipping"
else
    ln -sv $(readlink -f pylint/.plintrc) ${HOME}/
fi

# spacemacs
# ln -sv $(readlink -f spacemacs/.spacemacs) ${HOME}/
# ln -sv $(readlink -f spacemacs/.spacemacs.env) ${HOME}/

# ssh
mkdir -p ${HOME}/.ssh
chmod 600 ${HOME}/.ssh
ln -sv $(readlink -f ssh/.ssh/config) ${HOME}/.ssh/

# starship
ln -sv $(readlink -f starship/.config/starship.toml) ${HOME}/.config/

# stow

# tmux
if ! command -v tmux &> /dev/null
then
    echo "tmux could not be found. skipping"
else
    ln -sv $(readlink -f tmux/.tmux.conf) ${HOME}/
    ln -sv $(readlink -f tmux/.tmux.conf.local) ${HOME}/
fi

# vim

# vimify (shell editing)
# ln -sv $(readlink -f vimify/.editrc) ${HOME}/
# ln -sv $(readlink -f vimify/.inputrc) ${HOME}/

# zsh
ln -sv $(readlink -f zsh/.zlogin) ${HOME}/
ln -sv $(readlink -f zsh/.zpreztorc) ${HOME}/
ln -sv $(readlink -f zsh/.zprofile) ${HOME}/
ln -sv $(readlink -f zsh/.zshenv) ${HOME}/
ln -sv $(readlink -f zsh/.zshrc) ${HOME}/
