#/bin/bash

while getopts "avh" arg
do 
    case $arg in 
        a)
            # screen tmux zsh
            FLIST=".screenrc .tmux.conf .zshrc"
            echo "also apply $FLIST"
            for i in $FLIST; do
            	if [ -f ~/${i} ]; then
            	    rm ~/${i}
            	fi
            	ln -s ${PWD}/${i} ~/${i}
            done
            ;&
        v)
            # vim 
            # check Vundle
            if [ ! -d ~/.vim ]; then
                mkdir -p ~/.vim/bundle
            fi

            if [ ! -d ~/.vim/bundle ]; then
                mkdir ~/.vim/bundle
            fi

            if [ ! -d ~/.vim/bundle/Vundle.Vim ]; then
                git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.Vim
            else
                echo "Vundle exist"
            fi

            # replace vimrc
            if [ -f ~/.vim/vimrc ]; then
                mv ~/.vim/vimrc ~/.vim/vimrc_bak
                echo "old vimrc renamed as _bak"
            fi
            ln -s ${PWD}/vimrc ~/.vim/vimrc
            ;;
        h)
            echo "./install.sh -v to apply vim config ONLY"
            echo "./install.sh -a to apply all config "
            ;;
        ?)
            echo "error arg"
            ;;
    esac
done

echo "./install.sh -h show uaage"
