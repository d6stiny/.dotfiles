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
export EDITOR="zed"
export HOMEBREW_NO_ANALYTICS=1

source ~/.aliases

# Stolen from https://github.com/peppy/dotfiles/blob/e6e807a6fd35720adbdb709a57ef2bb976ef85db/dot_config/private_fish/config.fish#L38
ssh () {
	local ps_res
  	ps_res=$(ps -p $(ps -p $$ -o ppid= | xargs) -o comm=)

  	if [ "$ps_res" = "tmux" ]; then
		tmux rename-window "ssh:$(echo $argv | cut -d . -f 1)"
		command ssh $argv
		tmux set-window-option automatic-rename "on" >/dev/null
	else
		command ssh $argv
	fi
}

source ~/.secrets

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
