return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    -- Optional: Extend html snippets to other filetypes like JSX/TSX
    require("luasnip").filetype_extend("javascriptreact", { "html" })
  end,
}
