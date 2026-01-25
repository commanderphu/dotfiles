
# ───────────────────────────────────────────────────────────────
# 🟣 Powerlevel10k Instant Prompt (MUSS GANZ OBEN STEHEN)
# ───────────────────────────────────────────────────────────────
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ───────────────────────────────────────────────────────────────
# 🟦 Environment Setup
# ───────────────────────────────────────────────────────────────

export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export FILE_MANAGER="yazi"

# ───────────────────────────────────────────────────────────────
# 🟨 PATH Configuration
# ───────────────────────────────────────────────────────────────

# Local binaries
export PATH="$HOME/bin:$PATH"

# Development Tools
export PATH="$HOME/.pub-cache/bin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"

# Android Development
export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_HOME=/opt/android-sdk
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator:$PATH"
export CHROME_EXECUTABLE=/usr/bin/chromium
export CAPACITOR_ANDROID_STUDIO_PATH="$HOME/android-studio/bin/studio.sh"
export PATH="$HOME/android-studio/bin:$PATH"

# PNPM
export PNPM_HOME="$HOME/.local/share/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# Homebrew
[[ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]] && \
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# SSH-Erkennung
if [[ -n "$SSH_CONNECTION" ]]; then
  IS_SSH=1
else
  IS_SSH=0
fi

# ───────────────────────────────────────────────────────────────
# 🟣 Powerlevel10k Theme (VOR OH-MY-ZSH)
# ───────────────────────────────────────────────────────────────

if [[ -d "$HOME/.powerlevel10k" ]]; then
  [[ -s "$HOME/.powerlevel10k/powerlevel10k.zsh-theme" ]] && \
    source "$HOME/.powerlevel10k/powerlevel10k.zsh-theme"
fi

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Fallback-Prompt falls P10k nicht lädt
if [[ -z "$POWERLEVEL10K_LEFT_PROMPT_ELEMENTS" ]]; then
  PROMPT='%F{cyan}%n@%m%f %F{yellow}%1~%f %# '
fi

# ───────────────────────────────────────────────────────────────
# 🟧 Oh My Zsh
# ───────────────────────────────────────────────────────────────

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf-tab
)

[[ -s "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# ───────────────────────────────────────────────────────────────
# 🟩 Shell Tools
# ───────────────────────────────────────────────────────────────

# FZF
[[ -f /usr/share/fzf/shell/key-bindings.zsh ]] && source /usr/share/fzf/shell/key-bindings.zsh
[[ -f /usr/share/fzf/shell/completion.zsh ]]   && source /usr/share/fzf/shell/completion.zsh
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# thefuck
command -v thefuck >/dev/null 2>&1 && eval "$(thefuck --alias)"

# ───────────────────────────────────────────────────────────────
# 🟥 Aliases - Sauber strukturiert
# ───────────────────────────────────────────────────────────────

# Modern CLI Tools
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -la'
alias cat='bat'

# Git
alias dotgit='git --git-dir=$HOME/.dotfiles-repo.git --work-tree=$HOME'

# Claude
alias claude="/home/einfachnurphu/.claude/local/claude"

# Quick Navigation (mit zoxide fallback zu cd)
if command -v zoxide >/dev/null 2>&1; then
  alias kit='z ~/Dokumente/K.I.T'
  alias dev='z ~/Dokumente/PhuDev'
  alias infra='z /srv/infra'
else
  alias kit='cd ~/Dokumente/K.I.T'
  alias dev='cd ~/Dokumente/PhuDev'
  alias infra='cd /srv/infra'
fi

# Caddy Shortcuts
[[ -f ~/.config/zsh/caddy_aliases.sh ]] && source ~/.config/zsh/caddy_aliases.sh

# ───────────────────────────────────────────────────────────────
# 🟨 Projekt-Registry & Navigation
# ───────────────────────────────────────────────────────────────

# Projekt-Liste für FZF-Picker
PROJECT_LIST=${PROJECT_LIST:-$HOME/.config/projects}

# FZF Projekt-Picker (interaktive Auswahl)
proj() {
  local fzf_cmd="fzf --prompt='Projects > ' --height 40% --reverse"
  local dest
  if [[ -f "$PROJECT_LIST" ]]; then
    dest=$(cut -d"|" -f2 "$PROJECT_LIST" | eval $fzf_cmd)
  else
    dest=$(find ~/Projects ~/Dev ~/Work -maxdepth 2 -type d -name ".git" 2>/dev/null | sed "s|/.git$||" | eval $fzf_cmd)
  fi
  [[ -n "$dest" ]] && cd "$dest"
}

# Lade Projekt-Registry (PROJ Array)
[[ -f ~/.zsh/projects.zsh ]] && source ~/.zsh/projects.zsh
typeset -g -A PROJ

# Direkter Projekt-Jump mit Completion
pj() { cd "${PROJ[$1]:-$HOME}"; }
_pj_complete() { compadd ${(k)PROJ}; }
compdef _pj_complete pj

# Optional: Tmux-Integration (erstellt automatisch Sessions)
# Uncomment um p() Command mit tmux-Sessions zu aktivieren:
# [[ -f ~/.zsh/tmux-integration.zsh ]] && source ~/.zsh/tmux-integration.zsh

# ───────────────────────────────────────────────────────────────
# 🟩 Yazi - Terminal File Manager
# ───────────────────────────────────────────────────────────────

alias y="yazi"

# Yazi öffnen → danach im gewählten Ordner landen
yy() {
  local cwd_file="/tmp/yazi-cwd-$$"
  yazi --cwd-file "$cwd_file"

  if [[ -f "$cwd_file" ]]; then
    local dst="$(cat "$cwd_file")"
    rm -f "$cwd_file"
    [[ -n "$dst" ]] && cd "$dst"
  fi
}

# cd → Yazi (magischer Ordnerwechsel)
cdy() {
  local cwd_file="/tmp/yazi-cwd-$$"
  yazi --cwd-file "$cwd_file"

  if [[ -f "$cwd_file" ]]; then
    local dst="$(cat "$cwd_file")"
    rm -f "$cwd_file"
    [[ -n "$dst" ]] && builtin cd "$dst"
  fi
}

alias yc="cdy"

# ───────────────────────────────────────────────────────────────
# 🟪 Tresor - Verschlüsseltes Archiv
# ───────────────────────────────────────────────────────────────

alias tresor_cd='cd /mnt/data/docs/Dokumente/Privat'
alias tresor_open='gpg -d visions_of_life.tar.gz.gpg > visions_of_life.tar.gz && tar -xzf visions_of_life.tar.gz'
alias tresor_close='tar -czf visions_of_life.tar.gz visions_of_life && gpg -c visions_of_life.tar.gz && shred -u visions_of_life.tar.gz && rm -rf visions_of_life'

# ───────────────────────────────────────────────────────────────
# 🟪 Zoxide (MUSS GANZ UNTEN STEHEN)
# ───────────────────────────────────────────────────────────────

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
else
  # Fallback: wenn zoxide nicht verfügbar ist, deaktiviere Hook falls vorhanden
  if typeset -f __zoxide_hook >/dev/null 2>&1; then
    unfunction __zoxide_hook 2>/dev/null || true
  fi
  # Entferne aus chpwd_functions falls gesetzt
  if [[ -n "${chpwd_functions[(r)__zoxide_hook]}" ]]; then
    chpwd_functions=("${(@)chpwd_functions:#__zoxide_hook}")
  fi
fi
