# Alias
alias lvim="~/.local/bin/lvim"
alias ls="lsd"

# Docker alias
docker-dev() {
  TERM=xterm rocker --x11 --user --home --privileged --env TERM=xterm --name ros-dev --volume /dev/bus/usb:/dev/bus/usb --volume /data:/data --network=host --oyr-run-arg " --ipc=host --pid=host" -- table-tennis-ros2
}
calibration-dev() {
  TERM=xterm rocker --x11 --user --home --privileged --env TERM=xterm --name calib-dev --volume /dev/bus/usb:/dev/bus/usb --volume /data:/data -- calibration-ros
}

alias docker-connect="docker container exec -it ros-dev /bin/bash"

# Source fzf
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# Source fast syntax highlighting
source ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Source git prompt
source ~/.zsh/plugins/zsh-git-prompt/zshrc.sh
