# Exports
set -x EDITOR nvim
set -x BROWSER brave

if status is-interactive
    # Commands to run in interactive sessions can go here
end


# Docker alias
function docker-dev
  source ~/rocker-venv/bin/activate.fish
  TERM=xterm rocker --nvidia --x11 --user --home --privileged --env TERM=xterm --name ros-dev --volume /dev/bus/usb:/dev/bus/usb --volume /data:/data -- prophesee-ros
end
alias docker-connect="docker exec -it (docker ps -qf "name=ros-dev") /bin/bash"
