# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="fino"
DISABLE_AUTO_UPDATE="true"
plugins=(git ant battery archlinux svn copyfile copydir debian gnu-utils history python command-not-found mvn)
source $ZSH/oh-my-zsh.sh

## prevent from putting duplicate line in the history
setopt HIST_IGNORE_DUPS

TOKEN_FILE="~/Github/token/homebrew_token.zsh"
[[ -e $TOKEN_FILE ]] && source $TOKEN_FILE

## emacs 
alias et='emacsclient -t "$@" -a ""'
alias ex='emacsclient -nc "$@" -a ""'
alias em='emacs -nw'

### alias
alias grep=egrep
alias grep='grep --color=always -n '
alias 'ps?'='ps ax | grep '
alias 'h?'='history|grep '
alias "wcc"="awk -F'|' '{print NF; exit}'"

### colorfule manpage
export LESS_TERMCAP_mb=$'\E[05;34m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;34m' # begin bold
export LESS_TERMCAP_me=$'\E[0m'     # end mode
export LESS_TERMCAP_se=$'\E[0m'     # end standout-mode
export LESS_TERMCAP_so=$'\E[44;33m' # begin standout-mode
export LESS_TERMCAP_ue=$'\E[0m'     # end underline
export LESS_TERMCAP_us=$'\E[04;33m' # begin underline

### editor
export EDITOR=vim

## java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=$JAVA_HOME/lib:./:$CLASSPATH
export TPATH=$SOFT/Jar

# OPAM configuration
. /Users/yayu/.opam/opam-init/init.zsh >/dev/null 2>/dev/null || true

# functions
extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2) tar xjf $1 ;;
      *.tar.gz) tar xzf $1 ;;
      *.bz2) bunzip2 $1 ;;
      *.rar) unrar e $1 ;;
      *.gz) gunzip $1 ;;
      *.tar) tar xf $1 ;;
      *.tbz2) tar xjf $1 ;;
      *.tgz) tar xzf $1 ;;
      *.zip) unzip $1 ;;
      *.Z) uncompress $1 ;;
      *.7z) 7z x $1 ;;
      *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function mcd() {
  mkdir -p "$1" && cd "$1"
}

# go back x directories
b() {
  str=""
  count=0
  while [ "$count" -lt "$1" ]; do
    str=$str"../"
    let count=count+1
  done
  cd $str
}

# alias
## recursive  directory listing.
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

## show hidden files only
alias l.='ls -d .* --color=auto'
## List files in human readable format with color and without implied directories
alias l='ls -lAh --color'
## List all folders
alias lf='ls -Gl | grep ^d'   #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones

setopt extended_glob

test -e ~/.rvm/scripts/rvm && source ~/.rvm/scripts/rvm
test -e /usr/local/bin/aliyun_zsh_complete.sh && source /usr/local/bin/aliyun_zsh_complete.sh

export GH=$GOPATH/src/github.com

### syntax-highlight
SH_FILE=/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if [ -f "$SH_FILE" ]; then
  source $SH_FILE
fi

### git
alias gad="git add --all ."
alias gpom="git push origin master"
alias gcom="git commit -am "
alias gu='git add --all . && git commit -am "Update" && git push origin'
alias gm1='git commit -am "1"'
alias glf='git --no-pager log --decorate=short --pretty=oneline -n1'

alias dp="pip install -i https://pypi.douban.com/simple/ "

## new comand
alias cat="ccat"
alias ls="exa"
alias ll="ls --git --long"
alias fuck='$(thefuck $(fc -ln -1))'

test -f ~/.private_zsh_env && source ~/.private_zsh_env

