#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# ROS
function source-ros() {
  cd /data/ros_ws/prophesee_ws
  source devel/setup.bash
}

# Start fish-shell
fish
