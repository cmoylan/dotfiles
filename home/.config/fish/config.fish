# Fish shell configuration and customizations
# version: 1.1
# updated: 7/12/20
# required packages: nvim, fortune, cowsay


# Load fishmarks (http://github.com/techwizrd/fishmarks)
. $HOME/.fishmarks/marks.fish


# google cloud
# source /usr/local/src/google-cloud-sdk/path.fish.inc


# ----- PATH ----- #
set default_path /usr/bin /usr/sbin /bin /sbin


# ----- Aliases ----- #
#alias vim "nvim"
#alias vi "nvim"
alias nf "new_function"
alias gt "gittool"


# ----- Plugins ----- #
#eval (direnv hook fish)

# chruby
#source /usr/local/share/chruby/chruby.fish
#source /usr/local/share/chruby/auto.fish


# ----- OS-specific ----- #
switch (uname)
    case Linux
        set custom_paths $HOME/bin $HOME/.emacs.d/bin $PATH
        set -gx PATH $custom_paths $default_path $PATH
    case Darwin
        set homebrew /usr/local/bin /usr/local/sbin
        set custom_paths $HOME/bin $HOME/bin/ziglang
        set -gx PATH $custom_paths $homebrew $default_path $PATH
end


# ----- Work things ----- #
set -x PRINTAVO_DEV_LOCALHOST "printavo-dev.com"
set -x DISABLE_SPRING true

function nvm
  bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent

rbenv init - | source

if test -e /Users/chrismoylan/.docker/init-fish.sh
  source /Users/chrismoylan/.docker/init-fish.sh || true # Added by Docker Desktop
end
