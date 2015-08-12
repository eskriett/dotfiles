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

To install both the dotfiles and my frequently used command line utilities simply use:
```
cd dotfiles
make
```

Alternatively, if you only wish to setup links for specific configuration files,
e.g. vim then you can use:
```
cd dotfiles
stow vim
```

## Uninstallation

To remove the dotfiles, you can simply run:

```
cd dotfiles
make clean
```
