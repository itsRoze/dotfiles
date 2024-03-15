# My Dotfiles

<img width="1680" alt="image" src="https://github.com/itsRoze/dotfiles/blob/main/.github/images/screenshot.png">
This directory contains the dotfiles for my system.

## Requirements

Ensure you have the following installed

- git
- zsh
- tmux
- stow

## Installation

Checkout the dotfiles repo in your $HOME directory using git

```sh
git clone git@github.com:itsRoze/dotfiles.git
cd dotfiles
```

Then use stow

```sh
stow .
```

You can see this is working by running `ls -lah` in your $HOME directory

```sh
ls -lah
```

You should see something like:

```sh
lrwxr-xr-x@   15 roze  4 Mar 12:29  .zshrc -> dotfiles/.zshrc
```

If you already have the files in your $HOME director, you can overwrite your dotfiles

```sh
stow --adopt .
```
