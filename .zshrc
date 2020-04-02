source ~/.antigen/antigen.zsh


eval $(thefuck --alias) 

export PATH="/home/wint3rmute/code/scripts:$PATH"
export PATH="/home/wint3rmute/.local/bin:$PATH"

# Man colors
export LESS_TERMCAP_mb=$'\e[1;36m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;32m'

alias vim=nvim

# AK2

asm() {
	[ -z $1 ] && echo No input provided && return 

	src=$1
	name="${src%%.*}"
	
	as $src -o $name.o && ld $name.o -o $name
}

asmr() {
	src=$1
	asm $1 && echo Running $name && ./$name
}

sshh () {
	result=255

	while true 
	do
		ssh $*
		result=$?
		[ $result = 0 -o $result = 130 ] && return 0

		echo Result $result
		sleep 1
	done
}

# Python workflow
setupvenv() {

	[[ $1 = '-h' || $1 == '--help' ]] &&
		echo Usage: setupvenv [ FOLDER_NAME ] [ PYTHON_EXEC ] &&
		echo
		echo FOLDER_NAME the folder in which the venv will be created
		echo PYTHON_EXEC the version of python to use, eg. python3, python2, python3.5

		return


	rm -rf venv;
	virtualenv venv;
	. venv/bin/activate;
	pip install -r requirements.txt;
}
alias venv=". venv/bin/activate"

# Moar speed
alias s=sudo
alias v=vim
alias c="code ."

alias ss="sudo systemctl status"
alias se="sudo systemctl enable"
alias sd="sudo systemctl disable"
alias sss="sudo systemctl start"
alias se="sudo systemctl stop"


# Misc utils
install () {
	pikaur -S $* --noconfirm --noedit
}

alias upgrade="pikaur -Syyu --noconfirm --noedit"

removecontainers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}

armageddon() {
    removecontainers
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
}

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting


#antigen bundle /home/wint3rmute/.antigen/customrussell/oh-my-zsh/themes customrussell.zsh-theme --no-local-clone
antigen bundle /home/wint3rmute/.antigen/customrussell/ customrussell.zsh-theme --no-local-clone
# Load the theme.
# antigen theme robbyrussell
antigen theme customrussell
# Tell Antigen that you're done.
antigen apply
