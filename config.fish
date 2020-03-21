function ...;   cd ../..; end
function ....;  cd ../../..; end
function .....; cd ../../../..; end

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
