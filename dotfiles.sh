#!/bin/bash


#
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Help text
show_usage() {
  echo "Usage:"
}

# Create symlinks from home directory to files
symlink_files() {
  echo "symlinking..."

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

# Parse command line args
for arg in "$@"
do
  case "$arg" in
    "s" | "symlink" ) symlink_files;;
    * )
      echo "EROR: Invalid argument."
      echo ""
      show_usage
    ;;
  esac
done
