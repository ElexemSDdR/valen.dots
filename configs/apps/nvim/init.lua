-- Configuración básica de Neovim
vim.g.mapleader = " " -- Configura la tecla líder como espacio

-- Opciones globales
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.updatetime = 300
vim.opt.clipboard = "unnamedplus"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Cargar plugins desde el directorio de plugins
require("lazy").setup("plugins")

-- require("onedark").load()

-- conform.nvim
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- Cargar configuraciones adicionales
require("config.keymaps")

-- ### Nvim highlight colors ###
-- Activar el resaltado de colores
-- require("nvim-highlight-colors").turnOn()

vim.cmd("SoftWrapMode")

vim.diagnostic.config({
  -- Mostrar diagnósticos como texto virtual al final de la línea
  virtual_text = {
    enabled = true,
    source = "always", -- Mostrar la fuente del diagnóstico (eslint, typescript, etc.)
    spacing = 2, -- Espaciado entre el código y el mensaje
    prefix = "●", -- Símbolo antes del mensaje (puedes cambiarlo por "■", "▎", etc.)
    format = function(diagnostic)
      return string.format("%s: %s", diagnostic.source or "LSP", diagnostic.message)
    end,
  },
  -- Configuración de los signos en el column (las letras E, W, H, etc.)
  signs = {
    enabled = true,
    priority = 20,
  },
  -- Mostrar diagnósticos en ventana flotante al pasar el cursor
  float = {
    enabled = true,
    source = "always",
    border = "rounded",
    header = "",
    prefix = "",
  },
  -- Configuración del subrayado
  underline = {
    enabled = true,
    severity = { min = vim.diagnostic.severity.WARN }
  },
  -- Actualización en tiempo real
  update_in_insert = false, -- Cambiar a true si quieres diagnósticos mientras escribes
  -- Configurar la severidad mínima para mostrar
  severity_sort = true,
})

local signs = { Error = "✗", Warn = "⚠", Hint = "⍟", Info = "ℹ" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Configuración adicional para mejorar la experiencia
-- Resaltar la línea completa donde hay errores (opcional)
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})
