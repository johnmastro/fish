function prompt_virtual_env_name
    if set -q VIRTUAL_ENV
        set -l venv_name (basename "$VIRTUAL_ENV")
        if test "$venv_name" = "env" -o "$venv_name" = "venv"
            set venv_name (basename (dirname "$VIRTUAL_ENV"))
        end
        printf '%s' $venv_name
    end
end

