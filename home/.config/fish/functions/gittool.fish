function gittool -a cmd opts -d "git utilities"
  if test (count $cmd) -gt 0
    switch "$cmd"
      case bc
        git-branch-clean
      case bs
        echo $opts
        echo "in here"
        git-branch-save $opts
    end

  else
    echo "Available commands:"
    echo "branch clean - bc"
    echo "branch save  - bs"
    read -l -P "Enter a command and arguments: " command
    echo "entered command:"
    echo $command
    gittool $command
  end
end


function git-branch-clean --d "clean old git branches"
    git branch | grep -v "master" | grep -v "save"
    read -l -P "Branches to be deleted. Proceed? (y/n) > " proceed

    if test $proceed = 'y'
      git checkout master
      git branch | grep -v "master" | grep -v "save" | xargs git branch -D
    else
      echo "operation cancelled"
    end
end

function git-branch-save -a branch --d "add --save onto the branch name"
echo "got branch"
echo $branch
  # TODO: should be reversable now
#git branch -m $branch $branch--save
  if string match -r '\-\-save$' $branch
    echo 'matches'
  else
  echo 'does not match'
  end
end
