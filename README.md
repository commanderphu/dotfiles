# Dotfiles

Personal dotfiles managed via bare Git repository.

**Remote:** `git@github.com:commanderphu/dotfiles.git`

---

## 📦 Tracked Configs

- **Shell:** `.zshrc` (zsh + Oh My Zsh + Powerlevel10k)
- **Theme:** `.p10k.zsh` (Powerlevel10k config)
- **Terminal:** `kitty/` (Terminal emulator)
- **Multiplexer:** `.tmux.conf` (Catppuccin Frappe theme)
- **Editor:** `nvim/` (Neovim with Lazy.nvim)
- **Git:** `.gitconfig`
- **Tools:** alacritty, btop, mc, neofetch configs
- **Scripts:** `bin/` (Thunderbird backup/restore)

---

## 🚀 Setup auf neuem System

```bash
# 1. Clone bare repository
git clone --bare git@github.com:commanderphu/dotfiles.git $HOME/.dotfiles-repo.git

# 2. Alias für dotgit erstellen
echo 'alias dotgit="git --git-dir=$HOME/.dotfiles-repo.git --work-tree=$HOME"' >> ~/.zshrc

# 3. Checkout dotfiles
dotgit checkout

# 4. Untracked files ausblenden
dotgit config status.showUntrackedFiles no

# 5. Shell neu laden
source ~/.zshrc
```

---

## 🔧 Usage

```bash
# Status checken
dotgit status

# Dateien hinzufügen
dotgit add .zshrc

# Committen
dotgit commit -m "update zshrc"

# Pushen
dotgit push

# Alle Changes auf einmal
dotgit add -u && dotgit commit -m "chore: update configs" && dotgit push
```

---

## 🛡️ Ignored Files

Die folgenden Verzeichnisse werden bewusst **nicht** getrackt (siehe `.gitignore-dotfiles`):

- `.config/thunderbird-profile/` - Enthält Secrets (logins, keys, cookies)
- `.config/obs-studio/` - Host-spezifisch, ändert sich häufig
- `obs-studio/` - Duplicate path cleanup

**Backup-Alternative:** Thunderbird Backup-Scripts in `bin/`

---

## 📂 Projekt-Navigation

Aktiviert durch `init_setup.sh` aus [umbauphase_repo](https://github.com/commanderphu/umbauphase_repo):

```bash
# FZF Projekt-Picker
proj

# Direkt zu Projekt (Shortcut)
pj workmate

# Zoxide navigation
j docs
```

**Config-Dateien:**
- `~/.config/projects` - Projekt-Liste (Format: `label|/pfad`)
- `~/.zsh/projects.zsh` - pj-Shortcuts Map

---

## 🔗 Related Repos

- **[umbauphase_repo](https://github.com/commanderphu/umbauphase_repo)** - Homelab Docs, Ansible, Scripts
- **Setup-Scripts:** `scripts/init_setup.sh`, `scripts/project-setup.sh`

---

## 📝 Notes

- Bare repo Setup erlaubt dotfiles im $HOME ohne `.git` Folder
- Keine Symlinks nötig (direkte Dateien)
- Clean separation: Nur Config-Files getrackt, keine Secrets

---

**Maintainer:** Joshua Phu Bein
**Last major cleanup:** 2026-01-16 (Security fixes, removed 83 sensitive files)
