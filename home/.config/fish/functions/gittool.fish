function gittool -a cmd opts -d "git utilities"
  if test (count $cmd) -gt 0
    switch "$cmd"
      case bc
        git-branch-clean
      case bs
        git-branch-save $opts
      case '*'
        echo "unknown command: " $cmd
    end
  else
    _show-help-and-prompt
  end
end


function _show-help-and-prompt
  echo "Available commands:"
  echo "branch clean - bc"
  echo "branch save  - bs"
  read -l -P "Enter a command and arguments: " command
  echo "got command: " $command
  gittool (string split ' ' $command)
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
  set -l branches (git branch)
  set -l save_name (string join '' $branch '__save') 

  if string match -q -r (string join '' $branch '__save$') $branches
    git branch -m $save_name $branch
  else
    git branch -m $branch $save_name
  end
end
