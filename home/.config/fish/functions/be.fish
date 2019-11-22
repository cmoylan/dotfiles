function be --d "run dotenv bundle exec"
    set env_files ".env"

    # if there is a dev .env, use it
    if test -f .env.dev
        echo "dotenv: using additional env file [.env.dev]"
        set env_files (string join "," ".env.dev" $env_files)
    end

    dotenv -f "$env_files" bundle exec $argv
end
