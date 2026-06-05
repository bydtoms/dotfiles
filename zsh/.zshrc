# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin/:$PATH

# Aliases
alias vim='nvim'
alias zconf='nvim ~/.zshrc && source ~/.zshrc && clear && echo "Sucessfully sourced zshrc."'
alias ls='eza --icons=always --color=always --git --group-directories-first'


## byobu
alias b='byobu'


# Autostart

## Starship - Keep at bottom
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

## Zoxide
eval "$(zoxide init --cmd cd zsh)"

_sesh_auto_start() {
  if [[ -o interactive ]] && [ -z "$TMUX" ]; then
    add-zsh-hook -d precmd _sesh_auto_start

    local target
    # Run fzf. Awk will automatically grab the selection (line 2) if it exists,
    # otherwise it grabs your typed query (line 1). Tr cleans up newlines.
    target=$(sesh list -i | fzf --print-query | awk 'END{print}' | tr -d '\n')

    # If you pressed Esc or Ctrl+C, target will be completely blank.
    # We exit the function safely and you get your normal local prompt.
    if [ -z "$target" ]; then
      return
    fi

    # Check if the chosen target is an existing session or path
    if sesh list -i | grep -Fxq "$target"; then
      # It exists! Connect with sesh
      exec sesh connect "$target"
    else
      # It's a brand new name! Create it and attach natively with Tmux
      tmux new-session -d -s "$target"
      exec tmux attach-session -t "$target"
    fi
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd _sesh_auto_start

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
