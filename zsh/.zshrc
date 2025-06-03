# ───── Oh My Zsh ──────────────────────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/android-studio/bin"
export CAPACITOR_ANDROID_STUDIO_PATH="$HOME/android-studio/bin/studio.sh"
ZSH_THEME="robbyrussell"  # Ignoriert, da Powerlevel10k geladen wird

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  bitwarden-cli
  fzf-tab
)

source $ZSH/oh-my-zsh.sh

# ───── Powerlevel10k Prompt ───────────────────────────────────────────────────
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ───── Tools & Aliase ─────────────────────────────────────────────────────────
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -la'
alias cat='bat'
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles-repo.git/ --work-tree=$HOME'

# Zoxide (smarter cd-Ersatz)
eval "$(zoxide init zsh)"

# FZF (Fuzzy Finder)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ───── Spicetify (optional) ───────────────────────────────────────────────────
if [ -d "$HOME/.spicetify" ]; then
  export SPICETIFY_CONFIG="$HOME/.config/spicetify/config-xpui.ini"
  export SPICETIFY_THEMES="$HOME/.config/spicetify/Themes"
  export SPICETIFY_EXTENSIONS="$HOME/.config/spicetify/Extensions"
  export SPICETIFY_APPS="$HOME/.config/spicetify/Apps"
  export SPICETIFY_USER="$HOME/.config/spicetify/User"
  export PATH="$PATH:$HOME/.spicetify"
fi
eval $(thefuck --alias)
