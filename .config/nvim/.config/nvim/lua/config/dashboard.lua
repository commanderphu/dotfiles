local logo = [[
    ██╗  ██╗██╗████████╗     ███████╗██╗ ██████╗██╗   ██╗
    ██║ ██╔╝██║╚══██╔══╝     ██╔════╝██║██╔════╝╚██╗ ██╔╝
    █████╔╝ ██║   ██║█████╗  █████╗  ██║██║      ╚████╔╝
    ██╔═██╗ ██║   ██║╚════╝  ██╔══╝  ██║██║       ╚██╔╝
    ██║  ██╗██║   ██║        ██║     ██║╚██████╗   ██║
    ╚═╝  ╚═╝╚═╝   ╚═╝        ╚═╝     ╚═╝ ╚═════╝   ╚═╝
    Willkommen bei K.I.T. Solutions
]]

-- Die Funktion zur Zentrierung des Dashboards
local function center_dashboard()
local api = vim.api
local width = vim.o.columns
local height = vim.o.lines
local win_width = 60  -- Breite des Fensters
local win_height = #vim.split(logo, "\n") + 8  -- Höhe des Fensters, basierend auf der Anzahl der Zeilen im Logo und etwas zusätzlichem Platz
local win_row = math.floor((height - win_height) / 2)
local win_col = math.floor((width - win_width) / 2)

-- Setze die Fensterposition
api.nvim_win_set_config(0, {
    relative = "editor",
    row = win_row,
    col = win_col,
    width = win_width,
    height = win_height,
})
end

-- Dashboard-Konfiguration
require("dashboard").setup({
    theme = "doom",
    config = {
        header = vim.split(logo, "\n"),  -- Dein Logo
        center = {
            { icon = " ", desc = "Neues File", key = "n", action = "enew" },
            { icon = " ", desc = "Datei suchen", key = "f", action = "Telescope find_files" },
            { icon = " ", desc = "Zuletzt geöffnet", key = "r", action = "Telescope oldfiles" },
            { icon = " ", desc = "Einstellungen", key = "c", action = "edit ~/.config/nvim/init.lua" },
            { icon = " ", desc = "Beenden", key = "q", action = "qa" },
        },
        footer = {
            "K.I.T. Solutions – IT mit Herz in Koblenz ♥",
            "Starte deinen Tag mit Produktivität ☕",
        },
    },
})
