#!/bin/bash


# Determine which directory the dotfiles occupy
DIR="$( cd "$( dirname "$0" )" && pwd )"


# Help text
show_usage() {
  echo 'COMMANDS:'
  echo '  s - symlink files into HOME'
  echo '  h - display this message'
}


# Create symlinks from home directory to files
symlink_files() {
  for x in $(ls -A $DIR/home)
  do
    # see if symlink already exists in $HOME
    if [ -e $HOME/$x ]
    then
      echo 'skipping ' $x ' because it exists'
    else
      echo 'symlinking ' $x
      ln -s $DIR/home/$x $HOME/$x
    fi
  done
}


# Show usage and exit if no arguments were passed
if [ ! -n "$1" ]
then
  show_usage
  exit 1
fi


# Parse command line args
for arg in "$@"
do
  case "$arg" in
    "s" | "symlink" ) symlink_files;;
    "h" | "help"    ) show_usage;;
    * )
      echo "Error: Invalid argument."
      echo ""
      show_usage
    ;;
  esac
done
