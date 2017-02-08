#!/bin/bash
# Script name: env_setup.sh
# Author: Ligm
# Purpose: When reinstall the OS, use this script to set up the enviornment.
# Note: Need use root to run.

# The user must be root
if (( $UID != 0 ))
then
    echo "Must use root to run this script!"
    exit 1
fi

# Prepare the git repo directory
repo_path=/export/ligm/my_git_repo
mkdir -p $repo_path

if (( $? != 0 ))
then
    echo "Can't create repo dir successfully!"
    exit 1
fi

cd $repo_path

# Get the config files from the gitHub.
git clone git@github.com:sdtimothy8/systemConfig.git

if (( $? != 0 ))
then
    echo "Can't clone the dir from Github uccessfully, please check it!"
    exit 2
fi

git clone git@github.com:sdtimothy8/shell_learning.git

# Set the bashrc
bash_config_path=$repo_path/systemConfig/shell_settings

if [ -e /root/.bashrc ]
then
    rm -rf /root/.bashrc
fi

if [ -e /home/ligm/.bashrc ]
then
    rm -rf /home/ligm/.bashrc
fi

ln -s $bash_config_path/bashrc /root/.bashrc
ln -s $bash_config_path/bashrc /home/ligm/.bashrc
source /root/.bashrc

# Set the vimrc
vim_config_path=$repo_path/systemConfig/vim_settings
if [ -e /root/.vimrc ]
then
    rm -rf /root/.vimrc
fi

ln -s $vim_config_path/vimrc /root/.vimrc
ln -s $vim_config_path/vim /root/.vim

# Set the solarized them for vim
if [ -e /root/.dir_colors ]
then
    rm -rf /root/.dir_colors
fi

ln -s $vim_config_pah/vim/bundle/dircolors-solarized/dircolors.256dark /roor/.dir_colors

# Install plugin Vundle for vim
echo "#########################"
echo "Begin Install the vim plugin Vundle:"
vundle_path=$vim_config_path/vim/bundle
cd $vundle_path
git clone git@github.com:sdtimothy8/Vundle.vim.git
vim +PluginInstall +qall

