vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set("i", "<C-b>", function()
      vim.api.nvim_feedkeys("****", "n", false)
      vim.schedule(function()
          vim.api.nvim_input("<Left><Left>")
        end)
end, { buffer = true, desc = "Set four * to bold" })
    vim.keymap.set("i", "<C-i>", function()
      vim.api.nvim_feedkeys("**", "n", false)
      vim.schedule(function()
          vim.api.nvim_input("<Left>")
        end)
end, { buffer = true, desc = "Set two * to italize" })
  end,
})

