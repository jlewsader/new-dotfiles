return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha", -- mocha, macchiato, frappe, latte
    integrations = {
      lualine = true,
    },
    custom_highlights = function(colors)
      -- Set your desired background color hex
      local custom_bg = "#1e1e2e" -- e.g., colors.mantle, colors.crust, or a custom hex

      return {
        -- Override lualine section background colors across all modes
        LualineNormalB = { bg = custom_bg, fg = colors.subtext1 },
        LualineNormalC = { bg = custom_bg, fg = colors.text },

        LualineInsertB = { bg = custom_bg, fg = colors.subtext1 },
        LualineInsertC = { bg = custom_bg, fg = colors.text },

        LualineVisualB = { bg = custom_bg, fg = colors.subtext1 },
        LualineVisualC = { bg = custom_bg, fg = colors.text },

        LualineCommandB = { bg = custom_bg, fg = colors.subtext1 },
        LualineCommandC = { bg = custom_bg, fg = colors.text },

        LualineInactiveA = { bg = custom_bg, fg = colors.overlay0 },
        LualineInactiveB = { bg = custom_bg, fg = colors.overlay0 },
        LualineInactiveC = { bg = custom_bg, fg = colors.overlay0 },

        -- Standard fallback groups
        StatusLine = { bg = custom_bg, fg = colors.text },
        StatusLineNC = { bg = custom_bg, fg = colors.overlay0 },
      }
    end,
  },
}
