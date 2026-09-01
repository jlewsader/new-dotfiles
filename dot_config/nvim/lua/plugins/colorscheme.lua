return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "mocha", -- mocha, macchiato, frappe, latte
    transparent_background = true,
    -- integrations = {
    --   lualine = true,
    -- },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
