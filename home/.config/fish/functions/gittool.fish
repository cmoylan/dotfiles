function gittool -a cmd -d "git utilities"
  if test (count $cmd) -gt 0
    switch "$cmd"
      case bc
        git-branch-clean
      case bs
        if not isatty
          while read -l arg
            set argv $argv $arg
          end
        end
        echo $argv
    end

  else
    echo "Available commands:"
    echo "branch clean - bc"
    echo "branch save  - bs"
    read -l -P "Enter a command and arguments: " command
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
