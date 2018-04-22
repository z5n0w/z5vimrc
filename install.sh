#/bin/bash

while getopts "av" arg
do 
    case $arg in 
        a)
            # screen tmux zsh
            FLIST=".screenrc .tmux.conf .zshrc"
            echo "using z5n0w's $FLIST"
            for i in $FLIST; do
            	if [ -f ~/${i} ]; then
            	    rm ~/${i}
            	fi
            	ln -s ${PWD}/${i} ~/${i}
            done
            ;&
        v)
            # vim 
            # using vim-plug as plugin manager
            for i in "bundle" "autoload";do
                if [ ! -d ~/.vim/${i} ]; then 
                    mkdir -p ~/.vim/${i} 
                fi
            done
            if [ -d ~/.vim/bundle/vim-plug ]; then 
                rm -r ~/.vim/bundle/vim-plug 
            fi 
            git clone https://github.com/junegunn/vim-plug.git ~/.vim/bundle/vim-plug 
            ln -s ~/.vim/bundle/vim-plug/plug.vim ~/.vim/autoload/ 
            # replace ori vimrc 
            if [ -f ~/.vim/vimrc ]; then
                mv ~/.vim/vimrc ~/.vim/vimrc_bak
                echo "old vimrc renamed as _bak"
            fi
            ln -s ${PWD}/vimrc ~/.vim/vimrc
            ;;
        ?)
            echo "./install.sh -v to apply vim config ONLY"
            echo "./install.sh -a to apply all config "
            ;;
    esac
done
