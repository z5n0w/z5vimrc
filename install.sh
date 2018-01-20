#/bin/bash

#check Vundle
if [ ! -d ~/.vim ]; then
    mkdir -p ~/.vim/bundle
fi

if [ ! -d ~/.vim/bundle ]; then
    mkdir ~/.vim/bundle
fi

if [ ! -d ~/.vim/bundle/Vundle.Vim ]; then
    cp -r $(PWD)/Vundle.Vim ~/.vim/bundle/
fi

#replace vimrc
if [ -f ~/.vim/vimrc ]; then
    mv ~/.vim/vimrc ~/.vim/vimrc_bak
    echo "You old vimrc renamed as _bak"
fi
ln -s $(PWD)/vimrc ~/.vim/vimrc

#screen & tmux
FLIST=".screenrc .tmux.conf"
for i in $FLIST; do
if [ -f ~/${i} ]; then
    rm ~/${i}
fi
ln -s $(PWD)/${i} ~/${i}
done
