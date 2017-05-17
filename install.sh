#/bin/bash

if [ ! -d ~/.vim ]; then
    mkdir -p ~/.vim/bundle
    cp ./vimrc ~/.vim/vimrc
    cp -r ./Vundle.Vim ~/.vim/bundle/
else if [ -f ~/.vim/vimrc ]; then
        mv ~/.vim/vimrc ~/.vim/vimrc_bak
        echo "You old vimrc renameed as vimrc_bak"
        cp ./vimrc ~/.vim/vimrc
    else
        cp ./vimrc ~/.vim/vimrc
    fi
else if [ ! -d ~/.vim/bundle ]; then
        mkdir -p ~/.vim/bundle
        cp -r ./Vundle.Vim ~/.vim/bundle/
    else
        cp -r ./Vundle.Vim ~/.vim/bundle/
    fi
fi

