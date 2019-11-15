# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=10000000
export HISTFILESIZE=20000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ============= start additional  yk part =============
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/tensorrt/lib:$LD_LIBRARY_PATH
export CUDA_INSTALL_DIR=/usr/local/cuda
export CUDNN_INSTALL_DIR=/usr/local/cuda

export PATH=/usr/include/vtk:$PATH
export LD_LIBRARY_PATH=/usr/include/vtk:$LD_LIBRARY_PATH
export C_INCLUDE_PATH=/usr/include/vtk:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=/usr/include/vtk:$CPLUS_INCLUDE_PATH
#after make pycaffe:
export PYTHONPATH=$PYTHONPATH:/usr/lib/caffe/python

# ============= end additional  yk part =============


# ============= start additional  our part =============
export PYTHONPATH=$PYTHONPATH:$HOME/local/lib/python2.6/site-packages/
export SVN_EDITOR=emacs
export PATH=/usr/local/bin:$PATH
umask 002
PS1='[\h]$ '
BASE=$(dirname $BASH_SOURCE)
#echo "----.basrc: BASE="$BASE
# set up a smarter shell prompt
if [ $TERM = 'dumb' ]; then
    PS1="--\u@\h-------------------------------------------\t--\n[\w]\$ "
else
    if [ $TERM = 'screen' ]; then
        bright=';1'
        titlesc='\033k\033\\'
    else
        bright=''
        titlesc=''
    fi

    
    # choose a colour from the ps1colors file based on the hostname
    hostcolor=$(
    if [ -f $BASE/.ps1colors ]; then
        cat $BASE/.ps1colors | while read usergrep color; do
        if (echo $USER --short | grep -q $usergrep); then 
            echo $color
            break
        fi
        done
    # else
        # echo "32"
    fi
    )
    if [ -z $hostcolor ]; then hostcolor=32; fi

    
    PS1="\[\e[${hostcolor}${bright}m\]--\u@\h-------------------------------------------\t--\[\e[0m\]\n\[\e[${hostcolor}${bright}m${titlesc}\][\w]\$\[\e[0m\] "
fi
export PS1


# rebind Ctrl+p and Crtl+n to search history based on command line rather than just browse through history
bind "\C-p":history-search-backward
bind "\C-n":history-search-forward
bind "set completion-ignore-case on"

# ============= end additional  our part =============

#export WORKON_HOME=$HOME/.virtualenvs
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
#source /usr/local/bin/virtualenvwrapper.sh

#export ftp_proxy=127.0.0.1:1080
#export http_proxy=127.0.0.1:1080
#export https_proxy=127.0.0.1:1080


# ============= start rm2mv =============
#alias rm=trash

#alias rl='ls ~/.trash'

#alias ur=undelfile
#undelfile()
#{
#  mv -i ~/.trash/$@ ./
#}
#trash()
#{
#  mv $@ ~/.trash/
#}
#cleartrash()
#{  
#    read -p "clear sure?[Input 'y' or 'Y' to confirm. && Input 'n' to cancel.]" confirm   
#    [ $confirm == 'y' ] || [ $confirm == 'Y' ]  && /bin/rm -rf ~/.trash/*   
#} 
# ============= end rm2mv =============

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda activate wradlib
# <<< conda initialize <<<

alias lsnum="python -c 'import os; print(len(os.listdir()))'"
alias imgshape="filename(){ python -c 'import cv2; print(cv2.imread('$1').shape);';};filename"

# ============ start change title ============
function set-title() {
	  if [[ -z "$ORIG" ]]; then
		      ORIG=$PS1
		        fi
			  TITLE="\[\e]2;$*\a\]"
			    PS1=${ORIG}${TITLE}
		    }
# ============= end change title =============
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
