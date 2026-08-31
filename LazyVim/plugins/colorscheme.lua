return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
      on_colors = function(colors)
        -- Entorno general y fondos oscuros
        colors.bg = "#101715"
        colors.bg_dark = "#0D1211"
        colors.bg_float = "#17231F"
        colors.bg_sidebar = "#0D1211"
        colors.bg_statusline = "#1B2924"
        colors.bg_highlight = "#284239"
        colors.bg_search = "#284239"

        -- Texto y estado
        colors.fg = "#E6EEE9"
        colors.fg_dark = "#8D9D95"
        colors.comment = "#333E48"

        -- Color firma #51C1A4 aplicado a acentos y elementos principales
        colors.teal = "#51C1A4"
        colors.cyan = "#51C1A4"
        colors.blue = "#51C1A4"
        colors.blue0 = "#51C1A4"
        colors.magenta = "#51C1A4"
        colors.purple = "#51C1A4"
        colors.orange = "#51C1A4"
        colors.green = "#51C1A4"

        -- Destacados e interfaz
        colors.git = { change = "#51C1A4", add = "#51C1A4", delete = "#333E48" }
      end,
      on_highlights = function(hl, c)
        -- Cursor, selecciones y botones
        hl.Cursor = { bg = "#51C1A4", fg = "#0D1211" }
        hl.CursorLine = { bg = "#17231F" }
        hl.CursorLineNr = { fg = "#51C1A4", bold = true }
        hl.LineNr = { fg = "#333E48" }

        -- Neo-tree y selecciones activas
        hl.NeoTreeDirectoryIcon = { fg = "#51C1A4" }
        hl.NeoTreeDirectoryName = { fg = "#E6EEE9" }
        hl.NeoTreeFileNameOpened = { fg = "#51C1A4", bold = true }
        hl.NeoTreeCursorLine = { bg = "#284239", fg = "#E6EEE9" }

        -- Coincidencias de búsqueda y menú flotante
        hl.Search = { bg = "#284239", fg = "#E6EEE9" }
        hl.IncSearch = { bg = "#51C1A4", fg = "#0D1211" }
        hl.Pmenu = { bg = "#17231F", fg = "#E6EEE9" }
        hl.PmenuSel = { bg = "#51C1A4", fg = "#0D1211", bold = true }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")
    end,
  },
}