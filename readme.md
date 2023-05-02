<div align="center">
<h1>My <code>~/.config</code> <i>aka</i> my dotfiles</h1>
<p>
    <img src="docs/vim.jpg" alt="Lunarvim configuration">
</p>
<p>
    <a href="/pulse">
        <img alt="Last commit" src="https://img.shields.io/github/last-commit/wint3rmute/dotfiles?color=C3E88D&style=for-the-badge"/>
    </a>
    <a href="/">
        <img alt="Last commit" src="https://img.shields.io/github/repo-size/Wint3rmute/dotfiles?color=FF5370&style=for-the-badge"/>
    </a>
</p>
</div>


This repository hosts:

- My [configuration](#configuration)
- [Themes](#theme) I'm using
- [Automated deployment playbooks](#deployment) via [Ansible](https://www.ansible.com/)

## Configuration

| Distro | Arch Linux |
| :-- | :-- |
| Terminal | Kitty |
| Shell | Nushell |
| Editor | LunarVim |
| Window manager | Leftwm |
| Compositor | Picom |
| Prompt | Starship |
| Launcher | Rofi |
| Notifications | Dunst |
| PDF viewer | Zathura |
| System monitor | Btop |

## Theme

The repository contains a unified color theme for:

- GTK applications
- Kitty
- LunarVim (minor tweaks to
  [material.nvim](https://github.com/marko-cerovac/material.nvim) at runtime)
- Telegram
- Gitk

My color schema is based on those themes:

- [Material VS Code Theme](https://github.com/equinusocio/vsc-material-theme)
- [Material Theme for Jetbrains editors](https://github.com/ChrisRM/material-theme-jetbrains)

### Principles

- Easy on the eyes (subjective)
- Same background for every window
- Same background for every popup window
- One accent color for UI accents and other specific elements

### How it looks?

![Music](docs/music.jpg)

![Random stuff](docs/random.jpg)

![Popups](docs/popups.jpg)

### Colors
#### Background

- Background: `#263238`
- Popup Background: `#37474F`

#### Accents

- Standard accent: `#82AAFF`
- Optional accent: `#89DDFF`

#### Other colors

[I am using mostly those from here](https://github.com/equinusocio/vsc-material-theme)

- Red:    `#FF5370`
- Orange: `#F78C6C`
- Yellow: `#FFCB6B`
- Green:  `#C3E88D`
- Purple: `#C792EA`
- Brown:  `#C17E70`
- Pink:   `#F07178`
- Violet: `#BB80B3`

## Deployment

### ❗ Warning ❗

before you attempt to install anything from this repository, **back up your
`~/.config` and `~/.themes` folders as they might get deleted**.

**I've tested playbook on Arch Linux only**, feel free to use it on another
distribution **at your own risk**.


```bash
pacman -Syu ansible

git clone https://github.com/Wint3rmute/dotfiles.git ~/.config
cd ~/.config
# Apply the configuration
ansible-playbook ./playbook.yml --ask-become-pass  

# Select material-theme as you GTK theme
lxappearance

# Install LunarVim (not yet automated)
firefox https://www.lunarvim.org/docs/installation
```
