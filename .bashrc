# Set noclobber for >
set -o noclobber

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# Don't write bash history
HISTFILESIZE=0

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm) color_prompt=yes;;
    xterm-color) color_prompt=yes;;
    rxvt-unicode-256color) color_prompt=yes;;
    rxvt-256color) color_prompt=yes;;
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
xterm*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -h'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
#fi

# some more ls aliases
alias ls='ls -N'
alias ll='ls -alFh'
alias la='ls -A'
alias lc='ls --color=never'
alias l='ls -CF'

# some more aliases
#alias rm='srm -fllvI'
alias rm='rm -I'
alias srm='srm -v'
alias rsync='rsync --progress -P'
alias clean='/root/clean'
alias c='clear'
alias r='reset'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim -p'
alias vim='vim -p'

#alias mplayer='mplayer -af scaletempo'
# MPV is much better than mplayer
alias mplayer='mpv -af scaletempo'
alias mplayer-51='mpv -af scaletempo --ao=alsa:device=surround51'
alias wired='netcfg -a && (netcfg wired || netcfg wired)&&exit'

alias livestreamer='livestreamer --yes-run-as-root --player=mpv'

#alias mount='mount -o sync'

COLORFGBG="default;default"

genpasswd() 
{
	local l=$1
	[ "$l" == "" ] && l=20
	tr -dc A-Za-z0-9 < /dev/urandom | head -c ${l} | xargs
}

##PATH for cabal
PATH=$PATH:/root/.cabal/bin
export EDITOR="vim"

set -o vi

export PATH=/root/.bin/:$PATH
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

stty ixany
stty stop undef
stty start undef

eval $(dircolors -b ~/.dir_colors)
