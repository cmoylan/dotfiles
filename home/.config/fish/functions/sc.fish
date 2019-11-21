function sc --d "sittercity dev utils"
    switch $argv[1]
        case "br"
            _sc_branch $argv[2]
    end
end

function _sc_branch -a issue_number
    git stash
    git checkout master
    git pull upstream master
    git checkout -b $issue_number
    git push origin $issue_number
end
