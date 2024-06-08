if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

source ~/.config/antigen.zsh

eval "$(starship init zsh)"

path+=('/home/wint3rmute/.local/bin')
path+=('/home/wint3rmute/.cargo/bin')
path+=('/home/wint3rmute/code/scripts')

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

unalias ll
unalias la
alias ls="eza --icons"
alias ll="eza -l --icons"
alias la="eza -a --icons"
alias psh="poetry shell"
alias pin="poetry install"
# alias "docker-compose"="sl"

eval $(thefuck --alias)
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
export EDITOR=nvim

eval "$(zoxide init zsh --cmd cd)"
