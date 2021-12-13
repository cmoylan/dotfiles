function gittool -a cmd opts -d "git utilities"
    if test (count $cmd) -gt 0
        switch "$cmd"
            case bc
                gittool-branch-clean
            case bs
                gittool-branch-save $opts
            case bn
                gittool-branch-create $opts
	    case rb
	    	gittool-rebase
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
    echo "branch new  - bn"
    read -l -P "Enter a command and arguments: " command
    echo "got command: " $command
    gittool (string split ' ' $command)
end


function gittool-branch-clean --d "clean old git branches"
    git branch | grep -v master | grep -v save
    read -l -P "Branches to be deleted. Proceed? (y/n) > " proceed

    if test $proceed = y
        git checkout master
        git branch | grep -v master | grep -v save | xargs git branch -D
    else
        echo "operation cancelled"
    end
end


function gittool-branch-save -a branch --d "add __save onto the branch name"
    set -l branches (git branch)
    set -l save_name (string join '' $branch '__save')

    if string match -q -r (string join '' $branch '__save$') $branches
        git branch -m $save_name $branch
    else
        git branch -m $branch $save_name
    end
end


function gittool-branch-create -a ticket -d "create a branch with the correct work format"
    if test -z $ticket
        read -P "Enter ticket number > " ticket
    end
    set -l ticket (string trim (string replace -a '#' '' $ticket))

    read -l -P "Enter a short description > " description
    set -l description (string trim (string replace -a ' ' _ $description))

    set -l branch_name (string join '' "chris/" $ticket "-" $description)

    git stash save (string join ' ' "GitTool - stashed to create:" $branch_name)
    git checkout master
    git pull
    git checkout -b $branch_name
    emacsclient -q --eval "(work/log-ticket $ticket)"
end

function gittool-rebase -d "rebase current branch against master"
    set -l branch_name (git branch --show-current)
    set -l stash_name (string join ' ' "stashed for rebase" $branch_name)
    #echo $stash_name
    git stash save $stash_name
    git checkout master
    git pull origin master
    git checkout $branch_name
    git rebase master
    git stash pop
    bdb
end
