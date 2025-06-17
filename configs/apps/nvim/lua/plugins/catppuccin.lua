local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",
      transparent_background = true,
      styles = {
        keywords = { "bold" },
        functions = { "italic" },
      },
    })
  end,
}

return M
