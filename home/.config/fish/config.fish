
# Load fishmarks (http://github.com/techwizrd/fishmarks)
. $HOME/.fishmarks/marks.fish

# Set up aliases
alias vim "nvim"
alias vi "nvim"

# chruby
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

# google cloud
# source /usr/local/src/google-cloud-sdk/path.fish.inc

# add executables in ~/bin
set PATH ~/bin $PATH
# add doom util to path
set PATH ~/.emacs.d/bin $PATH
# add go stuff
set PATH $GOPATH/bin $PATH

eval (python -m virtualfish)

alias nf "new_function"
