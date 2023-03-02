function gittool -a cmd opts -d "git utilities"
    if test (count $cmd) -gt 0
        switch "$cmd"
            case bc
              git_tool branch-clean
            case bs
              echo "FIXME port to rust"
            case bn
              git_tool branch
            case rb
              git_tool rebase
            case fp
              echo "FIXME port to rust"
            case lb
              echo "FIXME port to rust"
            case ca
              git_tool commit-ammend
            case pm 
              git_tool pull-master
            case res
              git_tool reset
            case t 
              echo "no command given"
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
    echo "branch new   - bn"
    echo "rebase       - rb"
    echo "force push   - fp"
    echo "reset        - res"
    echo "pull master  - pm"
    read -l -P "Enter a command and arguments: " command
    echo "got command: " $command
    gittool (string split ' ' $command)
end


#function gittool-branch-clean --d "clean old git branches"
#    git branch | grep -v master | grep -v save
#    read -l -P "Branches to be deleted. Proceed? (y/n) > " proceed
#
#    if test $proceed = y
#        git checkout master
#        git branch | grep -v master | grep -v save | xargs git branch -D
#    else
#        echo "operation cancelled"
#    end
#end
#
#
#function gittool-branch-save -a branch --d "add __save onto the branch name"
#    set -l branches (git branch)
#    set -l save_name (string join '' $branch '__save')
#
#    if string match -q -r (string join '' $branch '__save$') $branches
#        git branch -m $save_name $branch
#    else
#        git branch -m $branch $save_name
#    end
#end
#
#
#function gittool-branch-create -a ticket -d "create a branch with the correct work format"
#    if test -z $ticket
#        read -P "Enter ticket number > " ticket
#    end
#    set -l ticket (string trim (string replace -a '#' '' $ticket))
#
#    read -l -P "Enter a short description > " raw_description
#    set -l description (string trim (string replace -a ' ' _ $raw_description))
#
#    set -l branch_name (string join '' "chris/" $ticket "-" $description)
#
#    git stash save (string join ' ' "GitTool - stashed to create:" $branch_name)
#    git checkout master
#    git pull
#    git checkout -b $branch_name
#
#    set -l cmd  "(work/log-ticket \"$ticket\" \"$raw_description\")"
#    emacsclient -q --eval $cmd
#end
#
#function gittool-force-push 
#  set -l branch_name (git branch --show-current)
#  if test $branch_name = "master"
#    echo 'no'
#    return
#  end
#  if test $branch_name = "release"
#    echo 'no'
#    return
#  end
#
#  git push -f origin $branch_name
#end
#
#function gittool-rebase -d "rebase current branch against master"
#    set -l branch_name (git branch --show-current)
#    set -l stash_name (string join ' ' "stashed for rebase" $branch_name)
#    #echo $stash_name
#    git stash save $stash_name
#    git checkout master
#    git pull origin master
#    git checkout $branch_name
#    git rebase master
#    # FIXME only do this if something was stashed, maybe with git status -s
#    git stash pop
#    #bdb
#end
#
#function gittool-last-branch -d "switch to the last non-master branch used"
#    echo "write me"
#end
#
#function gittool-commit-amend -d "commit the staged changes to the current commit"
#    git commit --amend
#end
