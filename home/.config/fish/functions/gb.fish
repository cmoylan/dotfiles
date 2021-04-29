function gb 
  set listing (git branch)
  string join \n $listing

  read -l -P 'Enter the branch name to use ' choice
  git checkout $choice
end
