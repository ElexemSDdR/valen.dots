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

-- Cambiar nvim-treesitter para que descargue mediante git y no curl
require('nvim-treesitter.install').prefer_git = true

-- ### Nvim highlight colors ###
-- Activar el resaltado de colores
require("nvim-highlight-colors").turnOn()
require("nvim-highlight-colors").setup {
	---Render style
	---@usage 'background'|'foreground'|'virtual'
	render = 'background',

	---Set virtual symbol (requires render to be set to 'virtual')
	virtual_symbol = '■',

	---Set virtual symbol suffix (defaults to '')
	virtual_symbol_prefix = '',

	---Set virtual symbol suffix (defaults to ' ')
	virtual_symbol_suffix = ' ',

	---Set virtual symbol position()
 	---@usage 'inline'|'eol'|'eow'
 	---inline mimics VS Code style
 	---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
 	---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
	virtual_symbol_position = 'inline',

	---Highlight hex colors, e.g. '#FFFFFF'
	enable_hex = true,

    	---Highlight short hex colors e.g. '#fff'
	enable_short_hex = true,

	---Highlight rgb colors, e.g. 'rgb(0 0 0)'
	enable_rgb = true,

	---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
	enable_hsl = true,
	
	---Highlight ansi colors, e.g '\033[0;34m'
	enable_ansi = true,

	---Highlight xterm 256 (8bit) colors, e.g '\033[38;5;118m'
	enable_xterm256 = true,

	---Highlight xterm True Color (24bit) colors, e.g '\033[38;2;118;64;90m'
	enable_xtermTrueColor = true,

  -- Highlight hsl colors without function, e.g. '--foreground: 0 69% 69%;'
  enable_hsl_without_function = true,

	---Highlight CSS variables, e.g. 'var(--testing-color)'
	enable_var_usage = true,

	---Highlight named colors, e.g. 'green'
	enable_named_colors = true,

	---Highlight tailwind colors, e.g. 'bg-blue-500'
	enable_tailwind = true,

	---Set custom colors
	---Label must be properly escaped with '%' to adhere to `string.gmatch`
	--- :help string.gmatch
	custom_colors = {
		{ label = '%-%-theme%-primary%-color', color = '#0f1219' },
		{ label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
	},

 	-- Exclude filetypes or buftypes from highlighting e.g. 'exclude_buftypes = {'text'}'
    	exclude_filetypes = {},
    	exclude_buftypes = {},
 	-- Exclude buffer from highlighting e.g. 'exclude_buffer = function(bufnr) return vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 1000000 end'
    	exclude_buffer = function(bufnr) end
}

vim.cmd("colorscheme catppuccin")
vim.cmd("SoftWrapMode")

vim.diagnostic.config({
  -- Mostrar diagnósticos como texto virtual al final de la línea
  virtual_text = {
    enabled = true,
    source = "always",  -- Mostrar la fuente del diagnóstico (eslint, typescript, etc.)
    spacing = 2,        -- Espaciado entre el código y el mensaje
    prefix = "●",       -- Símbolo antes del mensaje (puedes cambiarlo por "■", "▎", etc.)
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
  update_in_insert = false,  -- Cambiar a true si quieres diagnósticos mientras escribes
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
