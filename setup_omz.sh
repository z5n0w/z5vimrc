#/bin/bash

# on-my-zsh
type omz
if [ $? = 1 ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
# powerlevel10k
type p10k
if [ $? = 1 ]; then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# over write config
echo "config on-my-zsh with z5n0w's config"
FLIST=".zshrc .p10k.zsh"
for i in $FLIST; do
	if [ -f ~/${i} ]; then
		rm ~/${i}
	fi
	ln -s ${PWD}/${i} ~/${i}
done

exit 0
