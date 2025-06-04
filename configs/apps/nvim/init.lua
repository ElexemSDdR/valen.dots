-- Configuración básica de Neovim
vim.g.mapleader = " "  -- Configura la tecla líder como espacio

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

-- Cargar configuraciones adicionales
require("config.keymaps")
-- require("config.keymaps_for_different_files.markdown")

vim.cmd("colorscheme catppuccin-macchiato")
vim.cmd("SoftWrapMode")

