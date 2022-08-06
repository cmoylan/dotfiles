function funced
  set -l dir (pwd)
  cd ~/.config/fish/functions
  vi $argv.fish
  cd $dir
end
