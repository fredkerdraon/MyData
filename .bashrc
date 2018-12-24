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
HISTSIZE=1000
HISTFILESIZE=2000

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
export JAVA_HOME="$HOME/Documents/Java/jdk1.7.0_79"
export PATH="~/Downloads/gradle-3.2.1/bin:$JAVA_HOME/bin:$PATH"
export ANT_OPTS="-Xms16384m -Xmx20480m"
export GRADLE_OPTS="-Xms16384m -Xmx20480m"
export JAVA_OPTS="-Xms16384m -Xmx20480m"
export RES="$HOME/Workspaces/MyFirstWindow"
export RES_HOME="$HOME/Workspaces/"
#alias netbeans='~/netbeans-8.1/bin/netbeans --jdkhome ~/Documents/Java/jdk1.7.0_79/ --laf javax.swing.plaf.metal.MetalLookAndFeel --fontsize 10 -J-Xms16384m -J-Xmx20480m'
alias netbeans='~/netbeans-8.1/bin/netbeans --jdkhome ~/Documents/Java/jdk1.7.0_79/ --laf com.sun.java.swing.plaf.windows.WindowsLookAndFeel --fontsize 10 -J-Xms16384m -J-Xmx20480m'
alias cdev='cd $RES'
alias cdat='cd $RES_HOME/MyData/'
alias csprint='cd $RES_HOME/Lswa/sprint'
alias ctrunk='cd $RES_HOME/Lswa/trunk'
alias cpatch='cd $RES_HOME/Lswa/patch'
alias cbdd='cd $RES_HOME/Lswa/trunk/bdd/scripts_lab4/01_v1'
alias capache='cd $HOME/Document/Workspace/apache-tomcat-8.0.27/conf'
alias cnet='cd $HOME/netbeans-8.1'
alias netbeans-patch='~/netbeans-8.1/bin/netbeans --jdkhome ~/Documents/Java/jdk1.7.0_79/ --laf javax.swing.plaf.metal.MetalLookAndFeel --fontsize 10 -J-Xmx20480m -J-Xms16384m --userdir ~\.netbeans_patch'
alias netstat='netstat -ltunp'
alias ctom='cd /home/frederic/Document/Workspace/apache-tomcat-7.0.72/conf'
alias gradle='gradle build.dev'
alias gradleper='gradle build.dev -PforceCompilePersistance=true'
alias cdown='cd /media/sf_Downloads'

alias cres="cd $RES"
alias clat="cd $RES/Latex"
alias all="cd $RES/;./build-all"
alias cdev="cd $RES/MyFirstWindow/"
#alias gitconf="git config --global user.email fredkerdraon@hotmail.com;git config --global user.name fredkerdraon"
#alias gitpull="cd ~/Documents/researchwork/MyFirstWindows/;git pull https://github.com/fredkerdraon/MyFirstWindows"
#alias gitclone="git clone https://github.com/fredkerdraon/MyFirstWindow"
#alias gitpush="git push https://github.com/fredkerdraon/MyFirstWindow"
#alias gitcommit="git remote commit -m "Modif2"  https://github.com/fredkerdraon/MyFirstWindow"
alias findalias="find . -type f -name "*.php" -exec grep -il 'pattern' {} \;"
alias garbage="jcmd 3894 GC.run"
alias checksum="md5sum"
alias route-apo="sudo ip route add 192.168.1.0/24 via 192.168.254.209 dev enp0s17"
alias decrypt="openssl des3 -d < yourfile.txt.des3 > yourfile.txt.decrypted"
alias encrypt="openssl des3 < youfile.txt > yourfile.txt.des3"
alias blend="blender -b Camera5.blend -f 250"
alias conv="convert -trim TimeTable.pdf -resize 500% -quality 100 -sharpen 0x1.0 TimeTable.jpg"

#source .profile

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/frederic/.sdkman"
export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
[[ -s "/home/frederic/.sdkman/bin/sdkman-init.sh" ]] && source "/home/frederic/.sdkman/bin/sdkman-init.sh"
