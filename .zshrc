# ───── Oh My Zsh ──────────────────────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/android-studio/bin"
export CAPACITOR_ANDROID_STUDIO_PATH="$HOME/android-studio/bin/studio.sh"

# Theme-Wert egal, p10k übernimmt Prompt
ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf-tab
)

# nur laden, wenn vorhanden
[ -s "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

# ───── Powerlevel10k Prompt ───────────────────────────────────────────────────
if [ -d "$HOME/.powerlevel10k" ]; then
  # Standard-Theme
  [ -s "$HOME/.powerlevel10k/powerlevel10k.zsh-theme" ] && source "$HOME/.powerlevel10k/powerlevel10k.zsh-theme"
  # Persönliche Konfiguration
  [ -s "$HOME/.p10k.zsh" ] && source "$HOME/.p10k.zsh"
fi

# ───── Tools & Aliase ─────────────────────────────────────────────────────────
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -la'
alias cat='bat'

# Dotfiles Bare-Repo (Standardpfad)
alias dotgit='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Zoxide (smarter cd)
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"

# FZF (Fuzzy Finder) – Fedora Systempfade, alternativ ~/.fzf.zsh
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
[ -f /usr/share/fzf/shell/completion.zsh ]   && source /usr/share/fzf/shell/completion.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# thefuck (optional)
command -v thefuck >/dev/null 2>&1 && eval "$(thefuck --alias)"

# Homebrew/Linuxbrew – nur, wenn installiert
if [ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Dev Shortcuts (nutzen zoxide 'z', wenn vorhanden)
alias dev='z Dokumente/PhuDev'
alias wm='z Dokumente/PhuDev/workmate'
alias wm-ui='z Dokumente/PhuDev/workmate/ui'
alias wm-bck='z Dokumente/PhuDev/workmate/backend'

# Fallback-Prompt, falls p10k nicht geladen
if [ -z "$POWERLEVEL9K_LEFT_PROMPT_ELEMENTS" ] && [ -z "$POWERLEVEL10K_LEFT_PROMPT_ELEMENTS" ]; then
  PROMPT='%F{cyan}%n@%m%f %F{yellow}%1~%f %# '
fi
