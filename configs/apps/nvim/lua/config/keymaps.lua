-- Atajos generales
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Cerrar ventana" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Quitar resaltado de búsqueda" })

-- Navegación entre ventanas
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Mover a la ventana izquierda" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Mover a la ventana inferior" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Mover a la ventana superior" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Mover a la ventana derecha" })

-- Redimensionar ventanas
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Reducir altura de ventana" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Aumentar altura de ventana" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Reducir ancho de ventana" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Aumentar ancho de ventana" })

-- Navegación en modo insertar
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Mover cursor a la izquierda" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Mover cursor abajo" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Mover cursor arriba" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Mover cursor a la derecha" })

-- Mover líneas
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover línea seleccionada abajo" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover línea seleccionada arriba" })

-- Wrapped lines navigation
vim.keymap.set("n", "j", "gj", { desc = "Navigate down to wrapped lines" })
vim.keymap.set("n", "k", "gk", { desc = "Navigate up to wrapped lines" })

-- Indentar y desindentar en modo visual sin salirse del mismo
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })

-- Mantener cursor en su lugar al unir líneas
vim.keymap.set("n", "J", "mzJ`z", { desc = "Unir líneas manteniendo cursor" })

-- Centrar al buscar y desplazarse
vim.keymap.set("n", "n", "nzzzv", { desc = "Siguiente coincidencia centrada" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Anterior coincidencia centrada" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Desplazar media página abajo centrado" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Desplazar media página arriba centrado" })

-- Atajos para Snacks pick
vim.keymap.set("n", "<leader><space>", ":lua Snacks.dashboard.pick('files')<CR>", { desc = "Open the find files from Snacks pick" })
vim.keymap.set("n", "<leader>b", ":lua Snacks.dashboard.pick('buffers')<CR>", { desc = "Open the opened buffers from Snacks pick" })

-- Auto pair
vim.keymap.set("i", "(", function()
  vim.api.nvim_feedkeys("()", "n", false)
  vim.schedule(function()
      vim.api.nvim_input("<Left>")
    end)
  end
)

vim.keymap.set("i", "[", function()
  vim.api.nvim_feedkeys("[]", "n", false)
  vim.schedule(function()
      vim.api.nvim_input("<Left>")
    end)
  end
)

vim.keymap.set("i", "{", function()
  vim.api.nvim_feedkeys("{}", "n", false)
  vim.schedule(function()
      vim.api.nvim_input("<Left>")
    end)
  end
)

vim.keymap.set("i", "'", function()
  vim.api.nvim_feedkeys("''", "n", false)
  vim.schedule(function()
      vim.api.nvim_input("<Left>")
    end)
  end
)

vim.keymap.set("i", "`", function()
  vim.api.nvim_feedkeys("``", "n", false)
  vim.schedule(function()
      vim.api.nvim_input("<Left>")
    end)
  end
)

vim.keymap.set("i", "\"", function()
  vim.api.nvim_feedkeys("\"\"", "n", false)
  vim.schedule(function()
      vim.api.nvim_input("<Left>")
    end)
  end
)

vim.keymap.set("i", "<", function()
  vim.api.nvim_feedkeys("<>", "n", false)
  vim.schedule(function()
      vim.api.nvim_input("<Left>")
    end)
  end
)

-- ToggleTerm keymap
vim.keymap.set("n", "<leader>tr", ":ToggleTerm direction=float<CR>", { desc = "Open a floating terminal" })

-- CopilotChat keymaps
vim.keymap.set("n", "<leader>ac", ":CopilotChat<CR>", { desc = "Open Copilot Chat" })
vim.keymap.set("n", "<leader>am", ":CopilotChatModels<CR>", { desc = "Open Copilot Chat Models" })
vim.keymap.set("n", "<leader>aC", ":CopilotChatClose<CR>", { desc = "Close Copilot Chat" })
vim.keymap.set("n", "<leader>at", ":CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })


-- Keymaps for Markdown formatting
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set("i", "<C-b>", function()
      vim.api.nvim_feedkeys("****", "n", false)
      vim.schedule(function()
          vim.api.nvim_input("<Left><Left>")
        end)
end, { buffer = true, desc = "Set four * to bold" })
    vim.keymap.set("i", "<C-e>", function()
      vim.api.nvim_feedkeys("**", "n", false)
      vim.schedule(function()
          vim.api.nvim_input("<Left>")
        end)
end, { buffer = true, desc = "Set two * to italize" })
  end,
})

