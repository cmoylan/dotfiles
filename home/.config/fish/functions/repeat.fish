function repeat -a times command
    for i in (seq $times);
        eval $command
    end
end
