#!/bin/zsh

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/usr/local/share/zsh/site-functions/_bun" ] && source "/usr/local/share/zsh/site-functions/_bun" # completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/d6stiny/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export XDG_CONFIG_HOME="$HOME/.config"
export PATH=$PWD/node_modules/.bin:$PATH
export HOMEBREW_NO_ANALYTICS=1


if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else 
	export EDITOR='nvim'
fi

source ~/.aliases
source ~/.secrets

eval "$(starship init zsh)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
