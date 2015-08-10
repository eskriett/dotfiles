# BASIC SETTINGS ----------------------------------------------------------- {{{

set fish_greeting ""        # Disable the fish greeting

# }}}
# ALIASES ------------------------------------------------------------------ {{{

function take; mkdir -p $argv; cd $argv; end

function g
    if test (count $argv) -gt 0
        git $argv
    else
        git status
    end
end

# }}}
# PROMPT ------------------------------------------------------------------- {{{

function fish_prompt

    # Set the hostname
    if not set -q __fish_prompt_hostname
      set -g __fish_prompt_hostname (hostname | cut -d . -f 1)
    end

    # Setup colours
    set -l normal (set_color normal)
    set -l magenta (set_color magenta)
    set -l green (set_color green)
    set -l yellow (set_color yellow)

    # Configure __fish_git_prompt
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_showuntrackedfiles true
    set -g __fish_git_prompt_showstashstate true
    set -g __fish_git_prompt_color cyan
    set -g __fish_git_prompt_color_flags red

    printf $magenta
    printf $USER
    printf $normal
    printf '@'
    printf $yellow
    printf $__fish_prompt_hostname
    printf ' '
    printf $green
    printf (prompt_pwd)
    __fish_git_prompt
    printf ' '

end

# }}}
