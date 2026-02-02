local db = require("dashboard")

db.setup({
  theme = "doom",

  config = {
    header = {
      "   ██████╗ ██╗███████╗ ██████╗  ██████╗ ",
      "  ██╔════╝ ██║██╔════╝██╔═══██╗██╔════╝ ",
      "  ██║  ███╗██║█████╗  ██║   ██║██║  ███╗",
      "  ██║   ██║██║██╔══╝  ██║   ██║██║   ██║",
      "  ╚██████╔╝██║███████╗╚██████╔╝╚██████╔╝",
      "   ╚═════╝ ╚═╝╚══════╝ ╚═════╝  ╚═════╝ ",
      "",
      "           C I S C O   •   P H U",
      "     CommanderPhu Development Suite",
      "",
    },

    center = {
      {
        icon = "  ",
        desc = "Find File",
        key = "p",
        action = "Telescope find_files",
      },
      {
        icon = "  ",
        desc = "Search in Project",
        key = "f",
        action = "Telescope live_grep",
      },
      {
        icon = "  ",
        desc = "Explorer Toggle (CTRL+B)",
        key = "b",
        action = "NvimTreeToggle",
      },
      {
        icon = "  ",
        desc = "Open Recent Files",
        key = "r",
        action = "Telescope oldfiles",
      },
      {
        icon = "  ",
        desc = "Update Plugins",
        key = "u",
        action = "Lazy update",
      },
    },

    footer = {
      "",
      "🚀  Ready for Development — Powered by Cisco & CommanderPhu",
      "",
    },
  }
})
