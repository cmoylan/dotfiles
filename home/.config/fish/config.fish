# Fish shell configuration and customizations
# version: 1.0
# updated: 2/13/20


# Load fishmarks (http://github.com/techwizrd/fishmarks)
. $HOME/.fishmarks/marks.fish

# chruby
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

# google cloud
# source /usr/local/src/google-cloud-sdk/path.fish.inc


<<<<<<< HEAD
# add roswell executables
#set PATH ~/.roswell/bin $PATH
||||||| merged common ancestors
# add roswell executables
set PATH ~/.roswell/bin $PATH
=======
# ----- PATH ----- #
set default_path /usr/bin /usr/sbin /bin /sbin
set custom_path $HOME/bin $HOME/.emacs.d/bin $HOME/.roswell/bin $PATH
set homebrew /usr/local/bin /usr/local/sbin
set -gx PATH $homebrew $custom_path $default_path $PATH
>>>>>>> ecc52c4e86f21758e37e60bab1361e16d5b8f6cf


# ----- Golang ----- #
set -gx GOROOT (brew --prefix golang)/libexec
set -gx GOPATH $HOME/Programs
#set -gx PATH $GOROOT/bin $GOPATH/bin $PATH


# ----- Aliases ----- #
alias vim "nvim"
alias vi "nvim"
alias nf "new_function"
alias gt "gittool"


# ----- Plugins ----- #
eval (python -m virtualfish)
eval (direnv hook fish)
