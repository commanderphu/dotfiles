# ───────────────────────────────────────────────────────────────
# ⚡ ZSH Config - Flash Theme
# ───────────────────────────────────────────────────────────────

# Powerlevel10k Instant Prompt (MUSS GANZ OBEN STEHEN)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ───────────────────────────────────────────────────────────────
# ⚡ Environment Setup
# ───────────────────────────────────────────────────────────────

export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export FILE_MANAGER="yazi"

# ───────────────────────────────────────────────────────────────
# ⚡ PATH Configuration
# ───────────────────────────────────────────────────────────────

# Local binaries
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

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
# ⚡ Powerlevel10k Theme
# ───────────────────────────────────────────────────────────────

if [[ -d "$HOME/.powerlevel10k" ]]; then
  source "$HOME/.powerlevel10k/powerlevel10k.zsh-theme"
elif [[ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]]; then
  source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme"
fi

# Flash P10k Config laden
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Fallback-Prompt falls P10k nicht geladen
if ! (( ${+functions[prompt_powerlevel10k_setup]} )); then
  # NEOTERRA Fallback Prompt
  PROMPT='%F{#D6A419}›%f %F{#E6E9EF}%n%f%F{#6B7280}@%f%F{#AAB2C5}%m%f %F{#D6A419}%1~%f %F{#1F2638}▸%f '
fi

# ───────────────────────────────────────────────────────────────
# ⚡ Oh My Zsh
# ───────────────────────────────────────────────────────────────

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf-tab
)

[[ -s "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# ───────────────────────────────────────────────────────────────
# ⚡ Shell Tools
# ───────────────────────────────────────────────────────────────

# FZF mit NEOTERRA-Farben
export FZF_DEFAULT_OPTS="
  --color=bg+:#1F2638,bg:#0B0E14,spinner:#F0B90B,hl:#D6A419
  --color=fg:#AAB2C5,header:#6B7280,info:#D6A419,pointer:#F0B90B
  --color=marker:#F0B90B,fg+:#E6E9EF,prompt:#D6A419,hl+:#F0B90B
  --color=border:#1F2638,separator:#1F2638,scrollbar:#1F2638
  --border=rounded --prompt='› ' --pointer='▸' --marker='◆'
"

[[ -f /usr/share/fzf/shell/key-bindings.zsh ]] && source /usr/share/fzf/shell/key-bindings.zsh
[[ -f /usr/share/fzf/shell/completion.zsh ]]   && source /usr/share/fzf/shell/completion.zsh
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# thefuck
command -v thefuck >/dev/null 2>&1 && eval "$(thefuck --alias)"

# ───────────────────────────────────────────────────────────────
# ⚡ Aliases
# ───────────────────────────────────────────────────────────────

# Modern CLI Tools
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -la'
alias cat='bat'

# Git
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Claude

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
# ⚡ Projekt-Registry & Navigation
# ───────────────────────────────────────────────────────────────

PROJECT_LIST=${PROJECT_LIST:-$HOME/.config/projects}

# FZF Projekt-Picker
proj() {
  local fzf_cmd="fzf --prompt='⚡ Projects > ' --height 40% --reverse"
  local dest
  if [[ -f "$PROJECT_LIST" ]]; then
    dest=$(cut -d"|" -f2 "$PROJECT_LIST" | eval $fzf_cmd)
  else
    dest=$(find ~/Projects ~/Dev ~/Work -maxdepth 2 -type d -name ".git" 2>/dev/null | sed "s|/.git$||" | eval $fzf_cmd)
  fi
  [[ -n "$dest" ]] && cd "$dest"
}

# Lade Projekt-Registry
[[ -f ~/.zsh/projects.zsh ]] && source ~/.zsh/projects.zsh
typeset -g -A PROJ

# Direkter Projekt-Jump mit Completion
pj() { cd "${PROJ[$1]:-$HOME}"; }
_pj_complete() { compadd ${(k)PROJ}; }
compdef _pj_complete pj

# ───────────────────────────────────────────────────────────────
# ⚡ Yazi - Terminal File Manager
# ───────────────────────────────────────────────────────────────

alias y="yazi"

yy() {
  local cwd_file="/tmp/yazi-cwd-$$"
  yazi --cwd-file "$cwd_file"
  if [[ -f "$cwd_file" ]]; then
    local dst="$(cat "$cwd_file")"
    rm -f "$cwd_file"
    [[ -n "$dst" ]] && cd "$dst"
  fi
}

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
# ⚡ Tresor - Verschluesseltes Archiv
# ───────────────────────────────────────────────────────────────

alias tresor_cd='cd /mnt/data/docs/Dokumente/Privat'
alias tresor_open='gpg -d visions_of_life.tar.gz.gpg > visions_of_life.tar.gz && tar -xzf visions_of_life.tar.gz'
alias tresor_close='tar -czf visions_of_life.tar.gz visions_of_life && gpg -c visions_of_life.tar.gz && shred -u visions_of_life.tar.gz && rm -rf visions_of_life'

# ───────────────────────────────────────────────────────────────
# ⚡ Zoxide (MUSS GANZ UNTEN STEHEN)
# ───────────────────────────────────────────────────────────────

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi
export PATH="$HOME/.local/bin/$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.spicetify:$PATH"

# ───────────────────────────────────────────────────────────────
# ⚡ rbw (Rust Bitwarden) - Auto Unlock
# ───────────────────────────────────────────────────────────────

# Auto-Unlock beim Shell-Start (falls credentials vorhanden)
if [[ -f "$HOME/gideon-stroage/secrets/bw_credentials" ]]; then
  _rbw_unlock() {
    if ! rbw unlocked &>/dev/null; then
      PASSWORD=$(grep '^master-password:' "$HOME/gideon-stroage/secrets/bw_credentials" | cut -d' ' -f2-)
      if [[ -n "$PASSWORD" ]]; then
        echo "$PASSWORD" | rbw unlock &>/dev/null
      fi
    fi
  }
  _rbw_unlock
fi

# Aliases für schnellen Zugriff
alias pw='rbw get'          # Passwort abrufen: pw github
alias pwls='rbw ls'         # Alle Einträge listen
alias pwsync='rbw sync'     # Mit Server synchronisieren

# Bitwarden (offizielle CLI) - GPG-gesicherter Unlock
alias bwu='export BW_SESSION=$(gpg --decrypt ~/.bw-master.asc 2>/dev/null | bw unlock --raw)'

# ───────────────────────────────────────────────────────────────
# ⚡ music-toggle 
# ───────────────────────────────────────────────────────────────

alias music='toggle-music'export PATH="$HOME/.deno/bin:$PATH"

# Samsung TV Controller
alias tv="python3 /home/einfachnurphu/tv.py"

# GPG Signing
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
