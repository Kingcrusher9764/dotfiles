#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$HOME/dotfiles/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# pnpm
export PNPM_HOME="/home/kacey/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:/home/kacey/.dotnet/tools"
export PATH="/home/kacey/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/kacey/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# used to persist the ssh-agent
if [[ -f "$HOME/.ssh/ssh-agent.env" ]]; then
    source "$HOME/.ssh/ssh-agent.env" > /dev/null
    if ! ps -p "$SSH_AGENT_PID" > /dev/null 2>&1; then
        rm -f "$HOME/.ssh/ssh-agent.env"
    fi
fi
