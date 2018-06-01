#! /bin/bash 
# eval `ssh-agent -s` 
# ssh-add ~/.ssh/*_rsa

export PATH=/c/apps/vim/vim80:$PATH

take () {
  mkdir "$1"
  cd "$1"
}
docker-ip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

alias la='ls -la'
