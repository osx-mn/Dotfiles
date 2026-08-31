return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local custom_theme = {
        normal = {
          a = { bg = "#51C1A4", fg = "#0D1211", bold = true },
          b = { bg = "#17231F", fg = "#E6EEE9" },
          c = { bg = "#101715", fg = "#8D9D95" },
        },
        insert = {
          a = { bg = "#E6EEE9", fg = "#0D1211", bold = true },
          b = { bg = "#17231F", fg = "#E6EEE9" },
          c = { bg = "#101715", fg = "#8D9D95" },
        },
        visual = {
          a = { bg = "#284239", fg = "#E6EEE9", bold = true },
          b = { bg = "#17231F", fg = "#E6EEE9" },
          c = { bg = "#101715", fg = "#8D9D95" },
        },
        replace = {
          a = { bg = "#51C1A4", fg = "#0D1211", bold = true },
          b = { bg = "#17231F", fg = "#E6EEE9" },
          c = { bg = "#101715", fg = "#8D9D95" },
        },
        command = {
          a = { bg = "#51C1A4", fg = "#0D1211", bold = true },
          b = { bg = "#17231F", fg = "#E6EEE9" },
          c = { bg = "#101715", fg = "#8D9D95" },
        },
        inactive = {
          a = { bg = "#0D1211", fg = "#333E48" },
          b = { bg = "#0D1211", fg = "#333E48" },
          c = { bg = "#0D1211", fg = "#333E48" },
        },
      }

      opts.options.theme = custom_theme
      opts.options.component_separators = { left = "│", right = "│" }
      opts.options.section_separators = { left = "", right = "" }
    end,
  },
}
