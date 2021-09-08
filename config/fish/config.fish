# Exports
set -x EDITOR nvim
set -x BROWSER brave

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ls='lsd'

# nnn settings
alias nnn="tmux new 'nnn -a -P p'"
set -x NNN_FIFO /tmp/nnn.fifo
set -x NNN_PLUG 'p:preview-tui'
set -x TERMINAL $TERM

# st DEL key fix
if status is-interactive
    switch $TERM

        # Fix DEL key in st
        case 'st*'
            set -gx is_simple_terminal 1

        case "linux"
            set -ex is_simple_terminal
            function fish_prompt
                fish_fallback_prompt
            end
    end

    if set -q is_simple_terminal
        tput smkx ^/dev/null
        function fish_enable_keypad_transmit --on-event fish_postexec
            tput smkx ^/dev/null
        end

        function fish_disable_keypad_transmit --on-event fish_preexec
            tput rmkx ^/dev/null
        end
    end
end

# Docker alias
function docker-dev
  source ~/rocker-venv/bin/activate.fish
  TERM=xterm rocker --nvidia --x11 --user --home --privileged --env TERM=xterm --name ros-dev --volume /dev/bus/usb:/dev/bus/usb --volume /data:/data -- prophesee-ros
end
alias docker-connect="docker exec -it (docker ps -qf "name=ros-dev") /bin/bash"
