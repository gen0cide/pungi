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
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
GRAY="\[\033[1;30m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"
NO_COLOUR="\[\033[0m\]"
# ------------------------------------------------------------------------------
PS1="$YELLOW\h$NO_COLOUR/$GREEN\u $NO_COLOUR@\W <$CYAN\$(rvm-prompt v g)$NO_COLOUR>$YELLOW\$(parse_git_branch)$NO_COLOUR \$ "
# ------------------------------------------------------------------------------