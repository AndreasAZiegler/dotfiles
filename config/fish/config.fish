# Exports
set -x EDITOR nvim
set -x BROWSER brave

# Make Java work in a non-reparenting window manager
set -x _JAVA_AWT_WM_NONREPARENTING 1

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ls='lsd'

# nnn settings
alias nnn="tmux new 'command nnn -a -P p'"
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
        function fish_enable_keypad_transmit --on-event fish_postexec
            tput smkx
        end

        function fish_disable_keypad_transmit --on-event fish_preexec
            tput rmkx
        end
    end
end

# Set fzf variable search to Ctrl+Alt+v
fzf_configure_bindings --variables=\e\cv

# Docker alias
function docker-dev
  source ~/rocker_venv/bin/activate.fish
  TERM=xterm rocker --x11 --user --home --privileged --env TERM=xterm --name ros-dev --volume /dev/bus/usb:/dev/bus/usb --volume /data:/data -- tabletennis-ros
end
alias docker-connect="docker exec -it (docker ps -qf "name=ros-dev") /bin/bash"
