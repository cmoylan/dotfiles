function funcs
  set starting_dir (pwd)

  cd ~/.config/fish/functions

  set listing (ls -x)
  string join \n $listing

  read -l -P 'Enter the function name to edit (without .fish) ' choice
  funced $choice

  cd $starting_dir
end
