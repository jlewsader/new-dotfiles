return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Fetch raw Catppuccin Mocha color palette
    local palette = require("catppuccin.palettes").get_palette("mocha")

    -- Define explicit background and text colors for status bar sections
    local custom_catppuccin = {
      normal = {
        a = { bg = palette.blue, fg = palette.mantle, gui = "bold" },
        b = { bg = palette.surface0, fg = palette.text },
        c = { bg = palette.mantle, fg = palette.subtext1 },
      },
      insert = {
        a = { bg = palette.green, fg = palette.mantle, gui = "bold" },
        b = { bg = palette.surface0, fg = palette.text },
        c = { bg = palette.mantle, fg = palette.subtext1 },
      },
      visual = {
        a = { bg = palette.mauve, fg = palette.mantle, gui = "bold" },
        b = { bg = palette.surface0, fg = palette.text },
        c = { bg = palette.mantle, fg = palette.subtext1 },
      },
      replace = {
        a = { bg = palette.red, fg = palette.mantle, gui = "bold" },
        b = { bg = palette.surface0, fg = palette.text },
        c = { bg = palette.mantle, fg = palette.subtext1 },
      },
      command = {
        a = { bg = palette.peach, fg = palette.mantle, gui = "bold" },
        b = { bg = palette.surface0, fg = palette.text },
        c = { bg = palette.mantle, fg = palette.subtext1 },
      },
      inactive = {
        a = { bg = palette.crust, fg = palette.overlay0 },
        b = { bg = palette.crust, fg = palette.overlay0 },
        c = { bg = palette.crust, fg = palette.overlay0 },
      },
    }

    -- Custom options
    opts.options = {
      icons_enabled = true,
      theme = custom_catppuccin,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {
          "alpha",
          "checkhealth",
          "dashboard",
          "snacks_dashboard",
          "fzf",
          "lazy",
          "mason",
          "TelescopePrompt",
        },
      },
      always_divide_middle = true,
      globalstatus = 1,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    }

    -- Set desired sections.
    -- Add this directly before setting opts.sections
    opts.sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {},
      lualine_x = { { "filename", path = 1 } },
      lualine_y = { { "filetype", icon_only = true } },
      lualine_z = {
        { "location", separator = " ", padding = { left = 1, right = 0 } },
        { "progress", padding = { left = 0, right = 1 } },
      },
    }

    -- Set inactive sections.
    opts.inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    }

    -- Initialize everything else.
    opts.tabline = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "tabs" },
    }

    opts.winbar = {}
    opts.inactive_winbar = {}
    opts.extensions = { "neo-tree", "lazy" }
  end,
}
