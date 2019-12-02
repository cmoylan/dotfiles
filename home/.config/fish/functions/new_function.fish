function new_function
  cd ~/.config/fish/functions
  cp new_function.fish $argv.fish
  vi $argv.fish
end
