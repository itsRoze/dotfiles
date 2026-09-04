# Enable Powerlevel10k instant prompt. Keep this near the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

# Keep PATH and completion entries unique as nested shells add to them.
typeset -U path PATH fpath

# Register completions before Oh My Zsh runs compinit. Completion functions are
# autoloaded on demand instead of sourcing large generated files at startup.
fpath=(
  "$HOME/.bun"
  "$HOME/.local/share/zsh/site-functions"
  /opt/homebrew/share/zsh-completions
  $fpath
)

# Homebrew owns the external plugins and prompt theme; Oh My Zsh supplies its
# built-in Git and pass integrations.
ZSH_THEME=""
plugins=(git pass)
source "$ZSH/oh-my-zsh.sh"
[[ -r /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -r /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme ]] && \
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# Prompt appearance is intentionally unchanged for now.
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

# NVM remains authoritative for Node, but its default version is placed on PATH
# directly. Loading the full NVM implementation is deferred until `nvm` is used.
export NVM_DIR="$HOME/.nvm"
if [[ -r "$NVM_DIR/alias/default" ]]; then
  _nvm_default_version="$(<"$NVM_DIR/alias/default")"
  if [[ -d "$NVM_DIR/versions/node/$_nvm_default_version/bin" ]]; then
    path=("$NVM_DIR/versions/node/$_nvm_default_version/bin" $path)
  fi
  unset _nvm_default_version
fi

nvm() {
  if [[ ! -r /opt/homebrew/opt/nvm/nvm.sh ]]; then
    print -u2 "nvm is not installed; run: brew bundle"
    return 127
  fi
  unfunction nvm
  source /opt/homebrew/opt/nvm/nvm.sh --no-use
  nvm "$@"
}

# Pyenv shims select the project Python; virtualenv keeps directory-based
# environments activated. Guard initialization for partial fresh installs.
export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && path=("$PYENV_ROOT/bin" $path)
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
  if command -v pyenv-virtualenv-init >/dev/null 2>&1; then
    eval "$(pyenv virtualenv-init -)"
  fi
fi

# User tools.
path=(
  "$HOME/.local/bin"
  "$HOME/.sst/bin"
  $path
  "$HOME/.composer/vendor/bin"
)

alias ls="eza"
alias ll="eza -alh"
alias cat="bat"

# iTerm integration must not emit iTerm-specific control sequences in Ghostty.
if [[ "$TERM_PROGRAM" == "iTerm.app" && -r "$HOME/.iterm2_shell_integration.zsh" ]]; then
  source "$HOME/.iterm2_shell_integration.zsh"
fi

# Syntax highlighting must be sourced after all widgets and plugins.
[[ -r /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
