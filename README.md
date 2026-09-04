# My Dotfiles

<img width="1680" alt="image" src="https://github.com/itsRoze/dotfiles/blob/main/.github/images/screenshot.png">
This directory contains the dotfiles for my system.

## Requirements

Ensure you have the following installed

- git
- zsh
- herdr
- stow

## Desktop stack

- **AeroSpace** manages nine persistent workspaces and tiled windows.
- **AeroKit** maps three-finger horizontal swipes to AeroSpace workspaces with a workspace HUD.
- **SketchyBar** shows AeroSpace workspace state and the apps on each workspace.
- **JankyBorders** draws an Everforest focus border.
- **Ghostty** is the primary terminal; Kitty remains installed as a fallback.
- **Raycast** remains the launcher and command palette.

### AeroSpace shortcuts

| Shortcut | Action |
| --- | --- |
| `Option + H/J/K/L` | Focus left/down/up/right |
| `Option + Shift + H/J/K/L` | Move the focused window |
| `Option + 1…9` | Switch workspace |
| `Option + Shift + 1…9` | Move the focused window to a workspace |
| `Option + /` | Toggle tile orientation |
| `Option + ,` | Toggle accordion orientation |
| `Option + M` | Toggle fullscreen |
| `Option + Shift + Space` | Toggle floating/tiling |
| `Option + -/=` | Resize the focused window |
| `Option + Tab` | Switch to the previous workspace |
| `Option + Shift + ;` | Enter service mode (`Esc` reloads config) |

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
