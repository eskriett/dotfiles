STOW = stow
STOWFLAGS =
STOWVERBOSE = 0

STOW-CMD = $(STOW) --target $(HOME) -v $(STOWVERBOSE) $(STOWFLAGS)
STOW-INSTALL = $(STOW-CMD) -R
STOW-UNINSTALL = $(STOW-CMD) -D

BASEPKGS = fish git vim

.PHONY: install clean

install:
	$(STOW-INSTALL) $(BASEPKGS)

prereq-install:
	sudo apt-get update
	sudo apt-get install stow
	sudo apt-get install vim
	sudo apt-get install tig
	sudo apt-get install curl
	sudo apt-get install git
	
	# Install dot files
	$(STOW-INSTALL) $(BASEPKGS)
	
	# Install Vundle
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

clean:
	$(STOW-UNINSTALL) $(BASEPKGS)
