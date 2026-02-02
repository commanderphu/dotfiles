#!/usr/bin/env zsh
# ===================================================================
# Tmux Projekt-Integration
# ===================================================================
# Optional: Lade diese Datei in deiner .zshrc um tmux-Sessions
# automatisch zu erstellen wenn du zu einem Projekt springst
#
# Usage in .zshrc:
#   [[ -f ~/.zsh/tmux-integration.zsh ]] && source ~/.zsh/tmux-integration.zsh
#
# Commands:
#   p <projekt>  - Spring zu Projekt mit tmux-Session
#   p            - Liste alle verfügbaren Projekte
# ===================================================================

# SSH-Erkennung (falls nicht schon gesetzt)
if [[ -z "$IS_SSH" ]]; then
  if [[ -n "$SSH_CONNECTION" ]]; then
    IS_SSH=1
  else
    IS_SSH=0
  fi
fi

# Projekt-Switcher mit tmux + SSH-Aware
p() {
  local key="$1"

  if [[ -z "$key" ]]; then
    echo "⚠️  Nutze: p <projekt>"
    echo "📦 Verfügbare Projekte:"
    for k in ${(ok)PROJ}; do
      echo "   - $k"
    done
    return 1
  fi

  local path="${PROJ[$key]}"

  if [[ -z "$path" ]]; then
    echo "❌ Projekt '$key' nicht registriert."
    echo "📦 Verfügbare Projekte:"
    for k in ${(ok)PROJ}; do
      echo "   - $k"
    done
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

# Häufig genutzte Projekt-Aliases
alias wm='p workmate'
alias portfolio='p portfolio'
alias commander='p commander'
alias umbau='p umbau'
