if (( $+commands[zellij] )); then
  export ZELLIJ_AUTO_ATTACH=true
  eval "$(zellij setup --generate-auto-start zsh)"
else
  echo 'zellij: command not found'
fi

if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
else
  echo 'zoxide: command not found'
fi

if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
else
  echo 'starship: command not found'
fi
