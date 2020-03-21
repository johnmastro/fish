#!/usr/bin/env fish

function prompt_last_command_status_description
    set -l code $argv[1]
    set -l description ""

    if test -n $code; and test $code -ne 0
        switch $code
            # Signals are 128 + signal value
            case (math "128 + 1")
                set description "SIGHUP"
            case (math "128 + 2")
                set description "SIGINT"
            case (math "128 + 3")
                set description "SIGQUIT"
            case (math "128 + 4")
                set description "SIGILL"
            case (math "128 + 5")
                set description "SIGTRAP"
            case (math "128 + 6")
                set description "SIGABRT"
            case (math "128 + 7")
                set description "SIGEMT"
            case (math "128 + 8")
                set description "SIGFPE"
            case (math "128 + 9")
                set description "SIGKILL"
            case (math "128 + 10")
                set description "SIGBUS"
            case (math "128 + 11")
                set description "SIGSEGV"
            case (math "128 + 12")
                set description "SIGSYS"
            case (math "128 + 13")
                set description "SIGPIPE"
            case (math "128 + 14")
                set description "SIGALRM"
            case (math "128 + 15")
                set description "SIGTERM"
            case (math "128 + 16")
                set description "SIGURG"
            case (math "128 + 17")
                set description "SIGSTOP"
            case (math "128 + 18")
                set description "SIGTSTP"
            case (math "128 + 19")
                set description "SIGCONT"
            case (math "128 + 20")
                set description "SIGCHLD"
            case (math "128 + 21")
                set description "SIGTTIN"
            case (math "128 + 22")
                set description "SIGTTOU"
            case (math "128 + 23")
                set description "SIGIO"
            case (math "128 + 24")
                set description "SIGXCPU"
            case (math "128 + 25")
                set description "SIGXFSZ"
            case (math "128 + 26")
                set description "SIGVTALRM"
            case (math "128 + 27")
                set description "SIGPROF"
            case (math "128 + 28")
                set description "SIGWINCH"
            case (math "128 + 29")
                set description "SIGINFO"
            case (math "128 + 30")
                set description "SIGUSR1"
            case (math "128 + 31")
                set description "SIGUSR2"
        end

        printf '%s' $description
    end
end


function prompt_last_command_status
    set -l code $argv[1]
    set -l description

    if test $code -ne 0
        set description (prompt_last_command_status_description $code)
        printf '[%s' $code
        if test "$description" != ""
            printf ': %s' $description
        end
        printf ']'
    end
end
