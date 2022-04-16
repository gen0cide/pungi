# ------------------------------------------------------------------------------
export rvmsudo_secure_path=1
export EDITOR='nano'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# ------------------------------------------------------------------------------
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# ------------------------------------------------------------------------------
NO_COLOUR="\[\033[0m\]"
RED="\[\033[00;31m\]"
GREEN="\[\033[00;32m\]"
YELLOW="\[\033[00;33m\]"
BLUE="\[\033[00;34m\]"
MAGENTA="\[\033[00;35m\]"
PURPLE="\[\033[00;35m\]"
CYAN="\[\033[00;36m\]"
LIGHTGRAY="\[\033[00;37m\]"
LRED="\[\033[01;31m\]"
LGREEN="\[\033[01;32m\]"
LYELLOW="\[\033[01;33m\]"
LBLUE="\[\033[01;34m\]"
LMAGENTA="\[\033[01;35m\]"
LPURPLE="\[\033[01;35m\]"
LCYAN="\[\033[01;36m\]"
WHITE="\[\033[01;37m\]"
# ------------------------------------------------------------------------------
PS1="$LRED\t $LYELLOW\h$NO_COLOUR/$GREEN\u $WHITE@\W$NO_COLOUR <$LCYAN\$(rvm-prompt v g)$NO_COLOUR>$YELLOW\$(parse_git_branch)$NO_COLOUR \\$ "
# ------------------------------------------------------------------------------
