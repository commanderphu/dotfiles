
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
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:$HOME/android-studio/bin"
export CAPACITOR_ANDROID_STUDIO_PATH="$HOME/android-studio/bin/studio.sh"
export EDITOR="nvim"   # oder vim, oder micro
export PATH="$PATH":"$HOME/.pub-cache/bin"
# PNPM
export PNPM_HOME="$HOME/.local/share/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# SSH-Erkennung
if [[ -n "$SSH_CONNECTION" ]]; then
  IS_SSH=1
else
  IS_SSH=0
fi

# ───────────────────────────────────────────────────────────────
# 🟣 Powerlevel10k (MUSS VOR OH-MY-ZSH GELADEN WERDEN)
# ───────────────────────────────────────────────────────────────

if [[ -d "$HOME/.powerlevel10k" ]]; then
  [[ -s "$HOME/.powerlevel10k/powerlevel10k.zsh-theme" ]] && \
    source "$HOME/.powerlevel10k/powerlevel10k.zsh-theme"
fi

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Fallback-Prompt
if [[ -z "$POWERLEVEL10K_LEFT_PROMPT_ELEMENTS" ]]; then
  PROMPT='%F{cyan}%n@%m%f %F{yellow}%1~%f %# '
fi

# ───────────────────────────────────────────────────────────────
# 🟧 Oh My Zsh Base (MUSS NACH P10K, VOR ALLEN FUNCTIONS)
# ───────────────────────────────────────────────────────────────

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf-tab
)

[[ -s "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"


# ───────────────────────────────────────────────────────────────
# 🟩 Shell Tools (aber NOCH OHNE ZOXIDE)
# ───────────────────────────────────────────────────────────────

# FZF
[[ -f /usr/share/fzf/shell/key-bindings.zsh ]] && source /usr/share/fzf/shell/key-bindings.zsh
[[ -f /usr/share/fzf/shell/completion.zsh ]]   && source /usr/share/fzf/shell/completion.zsh
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# thefuck
command -v thefuck >/dev/null 2>&1 && eval "$(thefuck --alias)"

# Homebrew
[[ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]] && \
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# ───────────────────────────────────────────────────────────────
# 🟥 Aliases – Sauber strukturiert
# ───────────────────────────────────────────────────────────────

alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -la'
alias cat='bat'
alias dotgit='git --git-dir=$HOME/.dotfiles-repo.git --work-tree=$HOME'

alias kit='z ~/Dokumente/K.I.T'
alias dev='z ~/Dokumente/PhuDev'
alias infra='z /srv/infra'
[[ -f ~/.config/zsh/caddy_aliases.sh ]] && source ~/.config/zsh/caddy_aliases.sh

# ───────────────────────────────────────────────────────────────
# 🟨 Projekt-Registry (DEIN Dev-Universum)
# ───────────────────────────────────────────────────────────────

typeset -A PROJECTS

PROJECTS=(
  api             "/srv/services/phu-api-hub"
  dash            "$HOME/Dokumente"
  commander       "$HOME/Dokumente/PhuDev/commanderphu-site"
  phu             "$HOME/Dokumente/PhuDev/einfachnurphu-portfolio"
  inv             "$HOME/Dokumente/PhuDev/inventory-app"
  wm              "$HOME/Dokumente/K.I.T/1_Projects/workmate_os"
)

alias api='p api'
alias dash='p dash'
alias commander='p commander'
alias phu='p phu'
alias inv='p inv'
alias wm='p wm'


# ───────────────────────────────────────────────────────────────
# 🟦 Intelligent Project Switcher (tmux + SSH-Aware)
# ───────────────────────────────────────────────────────────────

p() {
  local key="$1"

  if [[ -z "$key" ]]; then
    echo "⚠️ Nutze: p <projekt>"
    printf '📦 Verfügbare Projekte:\n%s\n' "${(@k)PROJECTS}"
    return 1
  fi

  local path="${PROJECTS[$key]}"

  if [[ -z "$path" ]]; then
    echo "❌ Projekt '$key' nicht registriert."
    printf '📦 Verfügbare Projekte:\n%s\n' "${(@k)PROJECTS}"
    return 1
  fi

  # Ohne tmux: normale Navigation
  if ! command -v tmux >/dev/null; then
    cd "$path" || return
    return
  fi

  # Schon existierende Session → attach
  if tmux has-session -t "$key" 2>/dev/null; then
    echo "🔄 Attaching zu tmux-Session '$key'..."
    tmux attach -t "$key"
    return
  fi

  # Neue Session
  echo "🆕 Neue tmux-Session '$key' wird erstellt..."
  tmux new-session -d -s "$key" -c "$path"
  tmux rename-window -t "$key":0 "code"
  tmux new-window -t "$key":1 -n "dev" -c "$path"
  tmux new-window -t "$key":2 -n "tools" -c "$path"

  # Kein VS Code bei SSH
  if [[ $IS_SSH -eq 1 ]]; then
    echo "💻 SSH erkannt – VS Code wird nicht gestartet."
  fi

  tmux attach -t "$key"
}

# ───────────────────────────────────────────────────────────────
# 🟩 Yazi – Standard Terminal File Manager
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

export FILE_MANAGER="yazi"

# --------------------------------------------------------------
#  Lebensvision - Tresor
#  -------------------------------------------------------------

alias tresor_cd='cd /mnt/data/docs/Dokumente/Privat'
alias tresor_open='gpg -d visions_of_life.tar.gz.gpg > visions_of_life.tar.gz && tar -xzf visions_of_life.tar.gz'
alias tresor_close='tar -czf visions_of_life.tar.gz visions_of_life && gpg -c visions_of_life.tar.gz && shred -u visions_of_life.tar.gz && rm -rf visions_of_life'

# ───────────────────────────────────────────────────────────────
# 🟪 Zoxide (MUSS GANZ UNTEN STEHEN)
# ───────────────────────────────────────────────────────────────

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

alias claude="/home/einfachnurphu/.claude/local/claude"
export PATH="$HOME/flutter/bin:$PATH"

# Android SDK (Arch Linux)
export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_HOME=/opt/android-sdk
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH"
export CHROME_EXECUTABLE=/usr/bin/chromium

# --- Projekt-Navigation ---
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
  alias j="z"
  alias ji="zi"
fi
PROJECT_LIST=${PROJECT_LIST:-$HOME/.config/projects}
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
[[ -f ~/.zsh/projects.zsh ]] && source ~/.zsh/projects.zsh
typeset -g -A PROJ
pj() { cd "${PROJ[$1]:-$HOME}"; }
_pj_complete() { compadd ${(k)PROJ}; }
compdef _pj_complete pj
# --- Ende ---
