STOW = stow
STOWFLAGS =
STOWVERBOSE = 0

STOW-CMD = $(STOW) --target $(HOME) -v $(STOWVERBOSE) $(STOWFLAGS)
STOW-INSTALL = $(STOW-CMD) -R
STOW-UNINSTALL = $(STOW-CMD) -D

# Specify the dotfiles stow should symlink
BASEPKGS = fish git vim

# Programs to install
BASEPROGS = stow fish vim tig curl git tmux

# List fictional targets
.PHONY: yum apt install clean

yum:
	sudo yum update
	sudo yum install $(BASEPROGS)
	make install

apt:
	sudo apt-get update
	sudo apt-get install $(BASEPROGS)
	make install

install:
	# Install dot files
	$(STOW-INSTALL) $(BASEPKGS)

	# Install Vundle
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

clean:
	$(STOW-UNINSTALL) $(BASEPKGS)
