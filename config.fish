function ...;   cd ../..; end
function ....;  cd ../../..; end
function .....; cd ../../../..; end

function d
    set -l dirs

    # This is obviously much less efficient than e.g. `sort -u`, but it
    # preserves the relative order of entries and `dirprev` is small enough
    # (25 elements) that it doesn't matter anyway
    for elt in $dirprev
        if not contains $elt $dirs; and test "$elt" != "$PWD"
            set -a dirs $elt
        end
    end

    if test (count $dirs) -gt 0
        cd (printf '%s\0' $dirs | fzf --read0)
    else
        echo "No recent directories"
        return 1
    end
end

function prepend_to_path
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH "$argv[1]" $PATH
        end
    end
end

prepend_to_path "/usr/local/bin"
prepend_to_path "$HOME/bin"

set -gx fish_greeting ''
set -gx BROWSER open
# set -gx EDITOR 'emacsclient -a "emacs" -c'
set -gx EDITOR vim
set -gx PSQL_EDITOR "$EDITOR"
set -gx PAGER less
set -gx LESS '-iMRSx4 -FX'

if test -f ~/.python/startup.py
    set -gx PYTHONSTARTUP "$HOME/.python/startup.py"
end

switch (uname)
    case Linux
        set -gx BROWSER xdg-open
    case Darwin
        set -gx BROWSER open
        set -gx HOMEBREW_NO_INSECURE_REDIRECT 1
        set -gx HOMEBREW_CASK_OPTS "--require-sha"
        set -gx CLICOLOR 1
end

abbr -a -g e "$EDITOR"
abbr -a -g g git

if test -f ~/.local.fish
    . ~/.local.fish
end
