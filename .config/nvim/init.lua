-- NOTE: Basic setup
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.winborder = 'rounded'
vim.o.swapfile = false
vim.o.clipboard = 'unnamedplus'
vim.g.mapleader = " "


-- NOTE: Keymaps
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>r', ':restart<CR>')
vim.keymap.set('n', '<leader>l', ':wq<CR>')
vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>')
vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>')
vim.keymap.set('n', '<leader>c', ':bw<CR>')
vim.keymap.set('n', '<leader>n', ':bNext<CR>')
vim.keymap.set('n', '<leader>a', ':NvimTreeToggle<CR>')


-- NOTE: Lazy.Nvim
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ "catppuccin/nvim" },
		{ 'echasnovski/mini.nvim' },
		{ "ibhagwan/fzf-lua" },
		{ "mason-org/mason.nvim" },
		{ "mason-org/mason-lspconfig.nvim" },
		{ 'neovim/nvim-lspconfig' },
		{ 'nvim-lualine/lualine.nvim' },
		{ "folke/todo-comments.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-tree/nvim-tree.lua" },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-path' },
		{ 'hrsh7th/cmp-cmdline' },
		{ 'hrsh7th/nvim-cmp' },
		{'abeldekat/cmp-mini-snippets'},
		{ "lewis6991/gitsigns.nvim" },
    { "lukas-reineke/indent-blankline.nvim" },
    { "folke/which-key.nvim" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- automatically check for plugin updates
	checker = { enabled = true },
})
vim.cmd.colorscheme "catppuccin-macchiato"
require('mini.pairs').setup()
require('mini.ai').setup()
require('mini.surround').setup()
require('mini.snippets').setup()
require('mini.icons').setup()
require('mini.notify').setup()
require('fzf-lua').setup()
require("mason").setup()
require('mason-lspconfig').setup({
	ensure_installed = { 'lua_ls', 'pyright', 'cssls', 'bashls', 'jsonls' }
})
vim.lsp.enable('...')
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
require('lualine').setup()
require('todo-comments').setup()
require('nvim-tree').setup()
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('mini.snippets').expand_snippet(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'mini' },
  },
  window = {
    completion = cmp.config.window.bordered({
      border = 'rounded',
    }),
    documentation = cmp.config.window.bordered({
      border = 'rounded',
    }),
  },
})
-- gitsigns
require('gitsigns').setup({
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  current_line_blame = true,  -- show git blame info on current line
})

-- indent-blankline
require("ibl").setup()
-- which-key
require("which-key").setup()
