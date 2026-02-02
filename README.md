# Dotfiles

Personal dotfiles managed via Git bare repository.

## Branches

| Branch | System | Beschreibung |
|--------|--------|--------------|
| `cisco` | Arch Linux (headless) | Dev-Host, Docker, Homelab |
| `Flash-Inspired` | Fedora | barry Notebook, Mobile Workstation |

## Inhalt (cisco)

```
.config/
├── alacritty/          # Terminal Emulator
├── btop/               # System Monitor (Catppuccin)
├── cisco-setup/        # Bootstrap Package-Listen
│   └── packages/       # essential, development, optional
├── kitty/              # Terminal (Catppuccin Frappé)
├── mc/                 # Midnight Commander
├── neofetch/           # System Info
├── nvim/               # Neovim (Lazy, LSP, Telescope, Treesitter)
├── projects            # Projekt-Registry
└── starship.toml       # Prompt

.gitconfig              # Git User, GPG, Credential Helper
.p10k.zsh               # Powerlevel10k Config
.ssh/config             # SSH Hosts (Server)
.tmux.conf              # Tmux Config
.zsh/                   # Zsh Modules
.zshrc                  # Zsh Config

bin/
├── bootstrap           # System-Setup für frischen Arch-Install
├── project-setup       # Projekt-Scaffolding (FastAPI, React, Vue)
├── sysutil             # System-Utilities (nvidia, rdp, vnc)
├── add-project         # Projekt zur Registry hinzufügen
├── sync-projects       # Projekt-Registry synchronisieren
└── ...
```

## Installation

### Frisches System

```bash
# 1. Repo klonen (bare)
git clone --bare git@github.com:commanderphu/dotfiles.git $HOME/.dotfiles-repo.git

# 2. Alias definieren
alias dotgit='git --git-dir=$HOME/.dotfiles-repo.git --work-tree=$HOME'

# 3. Checkout (cisco oder Flash-Inspired)
dotgit checkout cisco

# 4. Untracked Files ausblenden
dotgit config --local status.showUntrackedFiles no

# 5. Bootstrap ausführen (nur cisco)
~/bin/bootstrap
```

### Bestehendes System

```bash
# Alias in .zshrc/.bashrc
alias dotgit='git --git-dir=$HOME/.dotfiles-repo.git --work-tree=$HOME'

# Änderungen committen
dotgit add ~/.zshrc
dotgit commit -m "update: zshrc"
dotgit push
```

## Tools

| Tool | Zweck |
|------|-------|
| `bootstrap` | Komplettes System-Setup |
| `project-setup` | Neues Projekt erstellen |
| `sysutil` | Nvidia/RDP/VNC Diagnose & Setup |
| `pj <name>` | Zu Projekt springen |
| `proj` | Projekt-Picker (fzf) |

## Theme

- **Terminal:** Catppuccin Frappé
- **Font:** FiraCode Nerd Font
- **Prompt:** Powerlevel10k

## Links

- **Homelab Docs:** [star-labs-homelab](https://github.com/commanderphu/star-labs-homelab)
- **Packages:** `~/.config/cisco-setup/packages/`

---
**Maintainer:** Joshua Phu Kuhrau
