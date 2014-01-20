#!/bin/bash


# Help text
show_usage() {
  echo "Usage:"
}

# Create symlinks from home directory to files
symlink_files() {
  echo "symlinking..."
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
