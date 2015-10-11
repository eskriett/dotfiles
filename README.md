     __   _ ___  ___  _  _    ___  __
    |  \ / \_ _|| __|| || |  | __|/ _|
    | o | o ) | | _| | || |_ | _| \_ \
    |__/ \_/|_| |_|  |_||___||___||__/

## About

These are my [dotfiles](http://dotfiles.github.io/). When you spend a large
majority of your time in front of a computer having well maintained
configuration files is essential and can drastically increase your
productivity (and help maintain your sanity).

I manage my dotfiles using GNU Stow, a symlink farm manager, which makes it
incredibly easy to setup the programs you require on any machine. When you work
on multiple machines having a tool which can handle the creation of symlinks in
a few simple steps is great as it saves loads of time and removes the hassle of
manually maintaining symlinks.

## Installation

To symlink the dotfiles simply use:
```
cd dotfiles
stow --target ~ -R git vim tmux
```

To install the plugins for vim using Vundle run:
```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

## Suggestions

I strive to make my configuration files easy to understand. If you think there
is potential to make them clearer, or if I have used an outdated method for
changing a setting, then please open an issue or submit a pull request.
