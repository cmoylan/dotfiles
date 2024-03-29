# Set some globals
export EDITOR='vim'
export LESS='-FX'

# Borrowed from http://jeff.robbins.ws/reference/my-zshrc-file
#Color table from: http://www.understudy.net/custom.html
#fg_black=$'\e[0;30m'
#fg_red=$'\e[0;31m'
#fg_green=$'\e[0;32m'
#fg_brown=$'\e[0;33m'
#fg_blue=$'\e[0;34m'
#fg_purple=$'\e[0;35m'
#fg_cyan=$'\e[0;36m'
#fg_lgray=$'\e[0;37m'
#fg_dgray=$'\e[1;30m'
#fg_lred=$'\e[1;31m'
#fg_lgreen=$'\e[1;32m'
#fg_yellow=$'\e[1;33m'
#fg_lblue=$'\e[1;34m'
#fg_pink=$'\e[1;35m'
#fg_lcyan=$'\e[1;36m'
#fg_white=$'\e[1;37m'
##Text Background Colors
#bg_red=$'\e[0;41m'
#bg_green=$'\e[0;42m'
#bg_brown=$'\e[0;43m'
#bg_blue=$'\e[0;44m'
#bg_purple=$'\e[0;45m'
#bg_cyan=$'\e[0;46m'
#bg_gray=$'\e[0;47m'
##Attributes
#at_normal=$'\e[0m'
#at_bold=$'\e[1m'
#at_italics=$'\e[3m'
#at_underl=$'\e[4m'
#at_boldoff=$'\e[22m'
#at_italicsoff=$'\e[23m'
#at_underloff=$'\e[24m'

#PROMPT="
#${fg_green}%n@${at_underl}%m${at_underloff}${fg_white}[${fg_cyan}%~${fg_white}]
#[${fg_green}%T${fg_white}]:${at_normal}"

#Set the auto completion on
autoload -U compinit
compinit

#Lets set some options
setopt correctall
setopt autocd
setopt auto_resume

## Enables the extgended globbing features
setopt extendedglob

#Set some ZSH styles
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# History
HISTFILE=~/.zsh-histfile
HISTSIZE=1000
SAVEHIST=1000

#Aliases
##ls, the common ones I use a lot shortened for rapid fire usage
alias ls='ls' #I like color, -G
#alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable

# Ignore autocorrect on a few commands
alias git="nocorrect git"

##cd, because typing the backslash is ALOT of work!!
alias .='cd ../'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'

# alias random commands that I use a lot
alias f='fg'
alias v='vim'

# add come COLOR to grep
alias grep='GREP_COLOR="1;37;41" LANG=C grep --color=auto'

# Include directory bookmarks if they exist
[[ -s "$HOME/.zsh/bookmark.sh" ]] && source "$HOME/.zsh/bookmark.sh"

# Include system specific settings if they exist
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# for tmux: export 256color
# [ -n "$TMUX" ] && export TERM=screen-256color
# but it doesn't work, so i'm resorting to this:
alias tmux='tmux -2'

# import local zsh customizations, if present
zrcl="$HOME/.zshrc.local"
[[ ! -a $zrcl ]] || source $zrcl

# add $HOME/path to $PATH, if present
[[ -s "$HOME/bin" ]] && export PATH=$PATH:$HOME/bin
[[ -s "$HOME/.cargo/bin" ]] && export PATH=$PATH:$HOME/.cargo/bin

alias dc="docker-compose"
alias be="bundle exec"

#fish

if [ -f /Users/chrismoylan/.docker/init-zsh.sh ]; then
  source /Users/chrismoylan/.docker/init-zsh.sh || true # Added by Docker Desktop
fi
