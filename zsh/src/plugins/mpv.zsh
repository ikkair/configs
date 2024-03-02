if (( $+commands[mpv] )); then
  mpve(){
    if [[ -z "$@" ]]; then
      echo 'Argument is empty'
    else
      command ls *."$@" | xargs -rd '\n' mpv --save-position-on-quit -fs
    fi
  }
  alias mpve=mpve
  mpvs(){
    if (( $+commands[fzf] )); then
      command ls -p | grep -v / | fzf --multi | xargs -rd '\n' mpv --save-position-on-quit -fs
    else
      echo 'fzf: command not found'
    fi
  }
  alias mpvs=mpvs
else
  echo 'mpv: command not found'
fi
