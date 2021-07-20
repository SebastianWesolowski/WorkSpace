# --- Plugins
plugins=(
  git
  dotenv
  osx
  colorize
  brew
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# --- Theme
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=powerlevel10k/powerlevel10k

# --- Source
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

# --- NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# --- Homebrew config

export HOMEBREW_CACHE=~/brew-cache
export HOMEBREW_CASK_OPTS="-appdir=$HOME/Applications"

# --- PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH