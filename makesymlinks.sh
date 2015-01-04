#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles
############################

# dotfiles directory
dir=$HOME/code/dotfiles

# old dotfiles backup directory
olddir=$HOME/code/dotfiles_old

# list of files/folders to symlink in homedir
files=".zshrc .gitconfig .screenrc .tmux.conf .hgrc .bashrc .profile"    
dirs=".emacs.d .pip .oh-my-zsh"


install_dotfiles () {
    # create dotfiles_old in homedir
    echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
    mkdir -p $olddir
    echo "done"
    
    # change to the dotfiles directory
    echo -n "Changing to the $dir directory ..."
    cd $dir
    echo "done"

    # move any existing dotfiles in homedir to dotfiles_old directory,
    # then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files

    for file in $files; do
        echo "Moving $file to $olddir"
        mv ~/$file $olddir
        echo "Symlinking $file in home directory."
        ln -s $dir/$file ~/$file
    done

    for d in $dirs; do
        echo "Moving any existing dotfiles from ~ to $olddir"
        mv ~/$d $olddir
        echo "Copying $dir/$d to ~/"
        cp -r $dir/$d ~/
    done

}

install_zsh () {
    # Test to see if zshell is installed.  If it is:
    echo "Installing oh-my-zsh..."    
    if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
        # Clone oh-my-zsh repository from GitHub only if it isn't already present
        if [[ ! -d $dir/.oh-my-zsh/ ]]; then
            git clone http://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh
        fi
        # copy custom oh-my-zsh files
        if [ ! -f ~/.oh-my-zsh/themes/dfdeshom.zsh-theme  ]; then
            echo "Downloading and installing custom 'dfdeshom' theme.."
            wget -q https://raw.githubusercontent.com/dfdeshom/oh-my-zsh-dfdeshom/master/dfdeshom.zsh-theme
            mv dfdeshom.zsh-theme .oh-my-zsh/themes/
        fi 

        # Set the default shell to zsh if it isn't currently set to zsh
        if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
            chsh -s $(which zsh)
        fi
    else
        # If zsh isn't installed, get the platform of the current machine
        platform=$(uname);
        # If the platform is Linux, try an apt-get to install zsh and then recurse
        if [[ $platform == 'Linux' ]]; then
            sudo apt-get install zsh
            install_zsh
        # If the platform is OS X, tell the user to install zsh :)
        elif [[ $platform == 'Darwin' ]]; then
            echo "Please install zsh, then re-run this script!"
            exit
        fi
    fi
    echo 'Done configuring zsh'
}

install_zsh
install_dotfiles
