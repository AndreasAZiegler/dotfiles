# Exports
set -x GDK_DPI_SCALE 0.5
set -x JAVA_HOME /usr/lib/jvm/java-8-openjdk/jre
set -x PATH $PATH $JAVA_HOME/bin

set -x VISUAL nvim

set -x PATH /usr/lib/ccache ~/.local/bin $PATH

# Export SSH keys for awesome wm
set -gx SSH_AUTH_SOCK (gnome-keyring-daemon --start | awk -F "=" '$1 == "SSH_AUTH_SOCK" { print $2 }')

# Aliases
# Change to a2dp for bluetooth headset
alias a2dp="pacmd set-card-profile 2 a2dp_sink" 
alias res="sh ./Res.sh 1800"

alias ls='ls --color=auto'

function email-update
  systemctl start --user mbsync-personal.service
end

alias gitb='git branch'
alias gitba='git branch -a'
alias gitc='git checkout'
alias gitp='git push'
alias gitf='git fetch origin'
alias gits='git status'

# Fix for texlive tlmgr
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

# ssh mtr connections
function mtr
  ssh -Y mtr@robot-$argv.mt
end

function mts
  ssh -Y mtr@ms-$argv.mt
end

alias docker-ros='nvidia-docker run -it --rm --net=host --add-host=AndreasZiegler:127.0.0.1 --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --security-opt apparmor=unconfined --user="1000:1000" --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --workdir="/home/$USER" --volume="/home/$USER:/home/$USER" --volume="/etc/group:/etc/group:ro" --volume="/etc/passwd:/etc/passwd:ro" --volume="/etc/shadow:/etc/shadow:ro" --volume="/etc/sudoers.d:/etc/sudoers.d:ro" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --env="XAUTHORITY=$XAUTH" --volume="$XAUTH:$XAUTH" --device="/dev/dri:/dev/dri" --volume="/home/andreasziegler/ros:/ros" --runtime="nvidia" gazebo-ros'

alias docker-mtrsys='docker run -it --rm --net=host --add-host=AndreasZiegler:127.0.0.1 --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --security-opt apparmor=unconfined --user="1000:1000" --env="DISPLAY" -v /usr/lib/nvidia:/usr/lib/nvidia --env="QT_X11_NO_MITSHM=1" --workdir="/home/$USER" --volume="/home/$USER:/home/$USER" --volume="/etc/group:/etc/group:ro" --volume="/etc/passwd:/etc/passwd:ro" --volume="/etc/shadow:/etc/shadow:ro" --volume="/etc/sudoers.d:/etc/sudoers.d:ro" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --env="XAUTHORITY=$XAUTH" --volume="$XAUTH:$XAUTH" --device="/dev/dri:/dev/dri" --volume="/home/andreasziegler/ros:/ros" --gpus all mt_jessie'

alias docker-mtr-visualize='docker run -it --rm --net=host --add-host=AndreasZiegler:127.0.0.1 --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --security-opt apparmor=unconfined --user="1000:1000" --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --env="XAUTHORITY=$XAUTH" --volume="$XAUTH:$XAUTH" --device="/dev/dri:/dev/dri" --volume="/home/andreasziegler/ros:/ros" --gpus all mtr-sys-visualization'

alias docker-mtr-visualize-dev='docker run -it --rm --net=host --add-host=AndreasZiegler:127.0.0.1 --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --security-opt apparmor=unconfined --user="1000:1000" --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --workdir="/home/$USER" --volume="/home/$USER:/home/$USER" --volume="/etc/group:/etc/group:ro" --volume="/etc/passwd:/etc/passwd:ro" --volume="/etc/shadow:/etc/shadow:ro" --volume="/etc/sudoers.d:/etc/sudoers.d:ro" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --env="XAUTHORITY=$XAUTH" --volume="$XAUTH:$XAUTH" --device="/dev/dri:/dev/dri" --volume="/home/andreasziegler/ros:/ros" --gpus all mtr-sys-visualization'

alias docker-mtr-rviz='docker run -it --rm --net=host --add-host=AndreasZiegler:127.0.0.1 --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --security-opt apparmor=unconfined --user="1000:1000" --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --workdir="/home/$USER" --volume="/home/$USER:/home/$USER" --volume="/etc/group:/etc/group:ro" --volume="/etc/passwd:/etc/passwd:ro" --volume="/etc/shadow:/etc/shadow:ro" --volume="/etc/sudoers.d:/etc/sudoers.d:ro" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --env="XAUTHORITY=$XAUTH" --volume="$XAUTH:$XAUTH" --device="/dev/dri:/dev/dri" --volume="/home/andreasziegler/ros:/ros" --gpus all mtr-rviz2'

alias docker-ros-exp='nvidia-docker run -it --rm --net=host --add-host=AndreasZiegler:127.0.0.1 --cap-add=ALL --security-opt seccomp=unconfined --security-opt apparmor=unconfined --user="1000:1000" --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --workdir="/home/$USER" --volume="/home/$USER:/home/$USER" --volume="/etc/group:/etc/group:ro" --volume="/etc/passwd:/etc/passwd:ro" --volume="/etc/shadow:/etc/shadow:ro" --volume="/etc/sudoers.d:/etc/sudoers.d:ro" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --env="XAUTHORITY=$XAUTH" --volume="$XAUTH:$XAUTH" --device="/dev/dri:/dev/dri" --volume="/home/andreasziegler/ros:/ros" --runtime="nvidia" poly-exploration'

alias docker-turtlebot='docker run -it --rm --net=host --add-host=AndreasZiegler:127.0.0.1 --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --security-opt apparmor=unconfined --user="1000:1000" --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --workdir="/home/$USER" --volume="/home/$USER:/home/$USER" --volume="/etc/passwd:/etc/passwd:ro" --volume="/etc/group:/etc/group:ro" --volume="/etc/shadow:/etc/shadow:ro" --volume="/etc/sudoers.d:/etc/sudoers.d:ro" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --env="XAUTHORITY=$XAUTH" --volume="$XAUTH:$XAUTH" --device="/dev/dri:/dev/dri" --volume="/home/andreasziegler/ros:/ros" --gpus all turtlebot3-gazebo-ros2'

alias docker-realsense-ros2='nvidia-docker run -it --rm --net=host --add-host=AndreasZiegler:127.0.0.1 --cap-add=ALL --security-opt seccomp=unconfined --security-opt apparmor=unconfined --user="1000:1000" --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --workdir="/home/$USER" --volume="/home/$USER:/home/$USER" --volume="/etc/group:/etc/group:ro" --volume="/etc/passwd:/etc/passwd:ro" --volume="/etc/shadow:/etc/shadow:ro" --volume="/etc/sudoers.d:/etc/sudoers.d:ro" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --env="XAUTHORITY=$XAUTH" --volume="$XAUTH:$XAUTH" --device="/dev/dri:/dev/dri" --privileged -v /dev/video/ --device=/dev/video0:/dev/video0 --device=/dev/video1:/dev/video1 --device=/dev/video2:/dev/video2 --device=/dev/video3:/dev/video3 --device=/dev/video4:/dev/video4 --device=/dev/video5:/dev/video5 --device=/dev/video6:/dev/video6 --device=/dev/video7:/dev/video7 --volume="/home/andreasziegler/ros:/ros" --runtime="nvidia" realsense-ros2'

alias docker-safety-field='docker run -it --rm --net=host --user="1000:1000" --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --workdir="/home/$USER" --volume="/home/$USER:/home/$USER" --volume="/etc/group:/etc/group:ro" --volume="/etc/passwd:/etc/passwd:ro" --volume="/etc/shadow:/etc/shadow:ro" --volume="/etc/sudoers.d:/etc/sudoers.d:ro" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --env="XAUTHORITY=$XAUTH" --volume="$XAUTH:$XAUTH" --device="/dev/dri:/dev/dri" --privileged -v /dev/video/ --device=/dev/video0:/dev/video0 --device=/dev/video1:/dev/video1 --device=/dev/video2:/dev/video2 --device=/dev/video3:/dev/video3 --device=/dev/video4:/dev/video4 --device=/dev/video5:/dev/video5 --device=/dev/video6:/dev/video6 --device=/dev/video7:/dev/video7 --gpus all safety-field-detector'

alias docker-ros-drive='nvidia-docker run -it --rm --user="1000:1000" --workdir="/home/$USER" --volume="/home/$USER:/home/$USER" --volume="/etc/group:/etc/group:ro" --volume="/etc/passwd:/etc/passwd:ro" --volume="/etc/shadow:/etc/shadow:ro" --volume="/etc/sudoers.d:/etc/sudoers.d:ro" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --device=/dev/dri:/dev/dri -v /home/andreasziegler/ros:/ros ros-gazebo'

alias docker-ros-tty='nvidia-docker run -it --rm --user="1000:1000" --workdir="/home/$USER" --volume="/home/$USER:/home/$USER" --volume="/etc/group:/etc/group:ro" --volume="/etc/passwd:/etc/passwd:ro" --volume="/etc/shadow:/etc/shadow:ro" --volume="/etc/sudoers.d:/etc/sudoers.d:ro" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" -v /home/andreasziegler/ros:/ros --device /dev/ttyUSB0 ros-gazebo'

alias docker-realsense-slam='docker run -it --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --env="XAUTHORITY=$XAUTH" --volume="$XAUTH:$XAUTH" --device="/dev/dri:/dev/dri" --privileged -v /dev/video/ --device=/dev/video0:/dev/video0 --device=/dev/video1:/dev/video1 --device=/dev/video2:/dev/video2 --device=/dev/video3:/dev/video3 --device=/dev/video4:/dev/video4 --device=/dev/video5:/dev/video5 --device=/dev/video6:/dev/video6 --device=/dev/video7:/dev/video7 --gpus all realsense-slam'

alias docker-realsense-slam-user='docker run -it --rm --net=host --add-host=AndreasZiegler:127.0.0.1 --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --security-opt apparmor=unconfined --user="1000:1000" --env="DISPLAY" --env="QT_X11_NO_MITSHM=1"  --workdir="/home/$USER" --volume="/home/$USER:/home/$USER" --volume="/etc/group:/etc/group:ro" --volume="/etc/passwd:/etc/passwd:ro" --volume="/etc/shadow:/etc/shadow:ro" --volume="/etc/sudoers.d:/etc/sudoers.d:ro" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --env="XAUTHORITY=$XAUTH" --volume="$XAUTH:$XAUTH" --device="/dev/dri:/dev/dri" --privileged -v /dev/video/ --device=/dev/video0:/dev/video0 --device=/dev/video1:/dev/video1 --device=/dev/video2:/dev/video2 --device=/dev/video3:/dev/video3 --device=/dev/video4:/dev/video4 --device=/dev/video5:/dev/video5 --device=/dev/video6:/dev/video6 --device=/dev/video7:/dev/video7 --gpus all realsense-slam'

alias docker-connect='nvidia-docker exec -ti (docker ps -aq --filter ancestor=gazebo-ros --filter status=running) bash'

alias docker-realsense-connect='nvidia-docker exec -ti (docker ps -aq --filter ancestor=realsense/ycmd:build --filter status=running) bash'

alias docker-realsense-slam-connect='docker exec -ti (docker ps -aq --filter ancestor=realsense-slam --filter status=running) bash'

alias docker-safety-connect='docker exec -ti (docker ps -aq --filter ancestor=safety-field-detector/ycmd:build --filter status=running) bash'

alias docker-turtlebot-connect='docker exec -ti (docker ps -aq --filter ancestor=turtlebot3-gazebo-ros2 --filter status=running) bash'

alias docker-connect-exp='nvidia-docker exec -ti (docker ps -aq --filter ancestor=poly-exploration --filter status=running) bash'

alias docker-poly-connect='nvidia-docker exec -ti (docker ps -aq --filter ancestor=poly-exploration/ycmd:build --filter status=running) bash'

alias docker-mtrsys-connect='docker exec -ti (docker ps -aq --filter ancestor=mt_jessie/ycmd:build --filter status=running) bash'

alias docker-mtr-visualize-connect='docker exec -ti (docker ps -aq --filter ancestor=mtr-sys-visualization --filter status=running) bash'

alias docker-mtr-rviz-connect='docker exec -ti (docker ps -aq --filter ancestor=mtr-rviz2 --filter status=running) bash'

alias docker-realsense-ros2-connect='nvidia-docker exec -ti (docker ps -aq --filter ancestor=realsense-ros2/ycmd:build --filter status=running) bash'


alias monitor-desk='xrandr --output DP-1.1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-1-3 --off --output HDMI-1-2 --off --output HDMI-1-1 --off --output DP-1-2 --off --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1.2 --mode 2560x1440 --pos 3840x0 --rotate left --output DP-1-1 --off --output HDMI-0 --off --output DP-2 --off --output DP-1 --off --output DP-0 --off'

# Conda
#source (conda info --root)/etc/fish/conf.d/conda.fish
function sconda
  set -x PATH /home/andreasziegler/miniconda3/bin $PATH
  source (conda info --root)/etc/fish/conf.d/conda.fish
end

# Jupyter dir
set -x JUPYTERLAB_DIR $HOME/.local/share/jupyter/lab

# Source jekyll
set -x PATH $HOME/.gem/ruby/2.7.0/bin $PATH

fish_vi_key_bindings

# ROS
function kinetic
  source /opt/ros/kinetic/share/rosbash/rosfish
  set -x PYTHONPATH /opt/ros/kinetic/lib/python2.7/site-packages:$PYTHONPATH
  set -x PKG_CONFIG_PATH "/opt/ros/kinetic/lib/pkgconfig:$PKG_CONFIG_PATH"
  # Optionally, you can set:
  #export ROS_PACKAGE_PATH=/path/to/your/package/path:$ROS_PACKAGE_PATH

  # Useful aliases
  alias catkin_make="catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so"

  # If you use Gazebo:
  #source /usr/share/gazebo/setup.sh

  set -x ROS_HOSTNAME localhost
  set -x ROS_MASTER_URI http://localhost:11311

  # For CLion
  set -x EMPY_SCRIPT /usr/lib/python2.7/site-packages/em.py
  set -x NOSETESTS /usr/bin/nosetests2
  set -x PYTHON_EXECUTABLE /usr/bin/python2
  set -x PY_EM /usr/lib/python2.7/site-packages/em.py
end

xrdb -merge ~/.Xresources

#set -l base03  002b36
#set -l base02  073642
#set -l base01  586e75
#set -l base00  657b83
#set -l base0   839496
#set -l base1   93a1a1
#set -l base2   eee8d5
#set -l base3   fdf6e3
#set -l yellow  b58900
#set -l orange  cb4b16
#set -l red     dc322f
#set -l magenta d33682
#set -l violet  6c71c4
#set -l blue    268bd2
#set -l cyan    2aa198
#set -l green   859900

#set -g fish_color_command $base01$
#set -g fish_color_comment $base1$
#set -g fish_color_end $blue$
#set -g fish_color_error $red$
#set -g fish_color_param $base00$
#set -g fish_color_quote $base0$
#set -g fish_color_redirection $violet$
