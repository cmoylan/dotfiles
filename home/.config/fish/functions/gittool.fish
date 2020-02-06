function gittool --d "git utilities"
    git branch | grep -v "master" | grep -v "save"
    read -l -P "Branches to be deleted. Proceed? (y/n) > " proceed

    if test $proceed = 'y'
      git checkout master
      git branch | grep -v "master" | grep -v "save" | xargs git branch -D
    else
      echo "operation cancelled"
    end
end
