# Neovim Keybindings Cheatsheet

Leader Key = `Space`

## Navigation

| Taste | Funktion |
|-------|----------|
| `Ctrl+h/j/k/l` | Zwischen Splits wechseln |
| `Shift+H` / `Shift+L` | Buffer links/rechts |
| `Ctrl+b` | File Explorer toggle |
| `n` / `N` | Suche weiter/zurück (zentriert) |

## Dateien & Suche (Telescope)

| Taste | Funktion |
|-------|----------|
| `Ctrl+p` | Dateien finden |
| `Space ff` | Dateien finden |
| `Space fg` | Text in Dateien suchen (grep) |
| `Space fb` | Offene Buffer |
| `Space fr` | Zuletzt geöffnet |
| `Space fh` | Hilfe durchsuchen |
| `Space fk` | Keymaps durchsuchen |
| `Space /` | Im aktuellen Buffer suchen |

## Code (LSP)

| Taste | Funktion |
|-------|----------|
| `gd` | Go to Definition |
| `gD` | Go to Declaration |
| `gr` | Go to References |
| `gi` | Go to Implementation |
| `K` | Hover (Dokumentation) |
| `Space ca` | Code Action |
| `Space rn` | Rename |
| `Space D` | Type Definition |
| `[d` / `]d` | Vorheriger/Nächster Fehler |
| `Space d` | Fehler anzeigen |
| `Space rs` | LSP Restart |

## Buffer & Fenster

| Taste | Funktion |
|-------|----------|
| `Space bd` | Buffer schließen |
| `Space sv` | Vertical Split |
| `Space sh` | Horizontal Split |
| `Ctrl+Up/Down` | Split Höhe ändern |
| `Ctrl+Left/Right` | Split Breite ändern |

## Bearbeiten

| Taste | Funktion |
|-------|----------|
| `gc` | Comment toggle (Visual) |
| `gcc` | Zeile kommentieren |
| `J` / `K` (Visual) | Zeilen verschieben |
| `<` / `>` (Visual) | Einrücken (bleibt selected) |
| `ys{motion}{char}` | Surround hinzufügen |
| `ds{char}` | Surround entfernen |
| `cs{old}{new}` | Surround ändern |

## Speichern & Beenden

| Taste | Funktion |
|-------|----------|
| `Space w` | Speichern |
| `Space q` | Beenden |
| `Space x` | Speichern & Beenden |

## Git (Gitsigns)

| Taste | Funktion |
|-------|----------|
| `]h` / `[h` | Nächster/Vorheriger Hunk |
| `Space hp` | Hunk Preview |
| `Space hs` | Hunk Stage |
| `Space hr` | Hunk Reset |
| `Space hS` | Buffer Stage |
| `Space hR` | Buffer Reset |
| `Space hu` | Undo Stage Hunk |
| `Space hb` | Blame Line |
| `Space hd` | Diff This |
| `Space tb` | Toggle Blame (inline) |
| `Space td` | Toggle Deleted |

## Terminal

| Taste | Funktion |
|-------|----------|
| `Space tt` | Terminal öffnen |
| `Esc` | Terminal Normal Mode |

## Sonstiges

| Taste | Funktion |
|-------|----------|
| `Space l` | Lazy Plugin Manager |
| `Esc` | Such-Highlight entfernen |
| `Space ft` | TODOs finden |
| `Ctrl+Space` | Incremental Selection |
| `Backspace` | Selection verkleinern |

## Neo-tree (File Explorer)

| Taste | Funktion |
|-------|----------|
| `Enter` / `o` | Öffnen |
| `s` | Vertical Split öffnen |
| `S` | Horizontal Split öffnen |
| `a` | Neue Datei/Ordner |
| `d` | Löschen |
| `r` | Umbenennen |
| `c` | Kopieren |
| `m` | Verschieben |
| `H` | Hidden Files toggle |
| `R` | Refresh |
| `q` | Schließen |
| `?` | Hilfe |

## Telescope (im Popup)

| Taste | Funktion |
|-------|----------|
| `Ctrl+j/k` | Hoch/Runter |
| `Ctrl+q` | Zu Quickfix senden |
| `Esc` | Schließen |

---
Tipp: Drücke `Space` und warte - which-key zeigt alle Optionen!
