#/bin/bash

# using vim-plug as plugin manager
for i in "bundle" "autoload";do
	if [ ! -d ~/.vim/${i} ]; then 
		mkdir -p ~/.vim/${i} 
	fi
done
if [ -d ~/.vim/bundle/vim-plug ]; then 
	rm -r ~/.vim/bundle/vim-plug 
fi 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# replace ori vimrc 
if [ -f ~/.vim/vimrc ]; then
	mv ~/.vim/vimrc ~/.vim/vimrc_$(data)
	echo "old vimrc renamed as _bak"
fi
ln -s ${PWD}/vimrc ~/.vim/vimrc

exit 0
