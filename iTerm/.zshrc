ZSH_THEME=powerlevel10k/powerlevel10k


# --- Plugins
plugins=(
  git
  dotenv
  osx
  colorize
  brew 
  zsh-syntax-highlighting 
)

# --- Source 
source $ZSH/oh-my-zsh.sh
source $HOME/.functions
source $HOME/.aliases
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh