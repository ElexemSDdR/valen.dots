vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set("i", "<C-b>", "****", { buffer = true, desc = "Set four * to bold" })
    vim.keymap.set("i", "<C-i>", "**", { buffer = true, desc = "Set two * to italize" })
  end,
})

