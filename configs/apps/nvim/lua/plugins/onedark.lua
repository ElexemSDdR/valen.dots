return {
  "navarasu/onedark.nvim",
  priority = 1000,
  config = function()
    require('onedark').setup({
      transparent = true,
      style = 'cool',
      code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'bold',
        strings = 'none',
        variables = 'none'
      },
      lualine = {
        transparent = true, -- lualine center bar transparency
      },

      -- Plugins Config --
      diagnostics = {
        darker = true,     -- darker colors for diagnostic
        undercurl = true,  -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    })
    require('onedark').load()
  end
}
