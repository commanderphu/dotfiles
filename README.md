# Dotfiles

Personal dotfiles managed via Git bare repository.

## Branches

| Branch | System | Host | Beschreibung |
|--------|--------|------|--------------|
| `cisco` | Arch Linux | cisco (headless) | Dev-Host, Docker, Homelab |
| `Flash-Inspired` | Fedora | barry (Notebook) | Mobile Workstation |

---

## cisco (Arch Linux)

Headless Dev-Host mit 23+ Docker Containern, Homelab-Infrastruktur.

### Inhalt

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
├── backup-thunderbird.sh
├── restore-thunderbird.sh
├── caddy-check.sh
├── tmux-start.sh
└── workmate-dev
```

### Theme
- **Terminal:** Catppuccin Frappé
- **Font:** FiraCode Nerd Font
- **Prompt:** Powerlevel10k

---

## Flash-Inspired (Fedora)

Mobile Workstation für Kunden-/Remote-Arbeit, Audio-Produktion.

### Inhalt

```
.config/
├── alacritty/          # Terminal Emulator
└── nvim/
    ├── colors/flash.lua    # Custom Flash Theme
    ├── init.lua
    └── lua/plugins/
        ├── cmp.lua         # Completion
        ├── editing.lua     # Editor Enhancements
        ├── gitsigns.lua    # Git Integration
        ├── lsp.lua         # Language Server
        ├── lualine.lua     # Statusline
        ├── neo-tree.lua    # File Explorer
        ├── telescope.lua   # Fuzzy Finder
        ├── treesitter.lua  # Syntax Highlighting
        └── ui.lua          # UI Enhancements

.p10k.zsh               # Powerlevel10k Config
.tmux.conf              # Tmux Config
.zsh/                   # Zsh Modules
.zshrc                  # Zsh Config

bin/
├── add-project
├── sync-projects
├── backup-thunderbird.sh
├── restore-thunderbird.sh
├── caddy-check.sh
├── tmux-start.sh
└── workmate-dev
```

### Theme
- **Neovim:** Flash (Dunkelrot + Gold)
- **Inspiration:** The Flash / S.T.A.R. Labs

---

## Installation

### Frisches System

```bash
# 1. Repo klonen (bare)
git clone --bare git@github.com:commanderphu/dotfiles.git $HOME/.dotfiles-repo.git

# 2. Alias definieren
alias dotgit='git --git-dir=$HOME/.dotfiles-repo.git --work-tree=$HOME'

# 3. Checkout
dotgit checkout cisco          # Arch Linux
# oder
dotgit checkout Flash-Inspired # Fedora

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

---

## Tools (cisco)

| Tool | Zweck |
|------|-------|
| `bootstrap` | Komplettes System-Setup |
| `project-setup` | Neues Projekt erstellen |
| `sysutil` | Nvidia/RDP/VNC Diagnose & Setup |
| `pj <name>` | Zu Projekt springen |
| `proj` | Projekt-Picker (fzf) |

---

## S.T.A.R. Labs Homelab

Die Systeme sind nach **The Flash** benannt:

| Host | Charakter | Rolle |
|------|-----------|-------|
| **cisco** | Cisco Ramon | Tech-Genius, Dev-Host |
| **barry** | Barry Allen | The Flash, Mobile Workstation |
| **gideon** | Gideon AI | NAS, Home Assistant, Wissensdatenbank |

**Docs:** [star-labs-homelab](https://github.com/commanderphu/star-labs-homelab)

---

**Maintainer:** Joshua Phu Kuhrau
