function dev-tmux -d "open tmux with some dev windows"
    set -l session "dev"

    tmux new-session -d -s $session -n shell
    tmux new-window -t $session:2 -n server
    tmux new-window -t $session:3 -n console

    tmux select-window -t $session:1
    tmux attach-session -t $session
end
