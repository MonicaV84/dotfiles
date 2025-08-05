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
vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>')
vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>')
vim.keymap.set('n', '<leader>c', ':bw<CR>')
vim.keymap.set('n', '-', ':Oil<CR>')

-- NOTE: Plugins
vim.pack.add({
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons' },
	{ src = 'https://github.com/echasnovski/mini.nvim' },
	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },
	{ src = 'https://github.com/echasnovski/mini.pairs' },
	{ src = 'https://github.com/echasnovski/mini.surround' },
	{ src = 'https://github.com/echasnovski/catppuccin-nvim' },
	{ src = 'https://github.com/echasnovski/mini.ai' },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/echasnovski/mini.snippets' },
	{ src = 'https://github.com/Saghen/blink.cmp' },
	{ src = 'https://github.com/ibhagwan/fzf-lua' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/folke/todo-comments.nvim' },
	{ src = 'https://github.com/stevearc/oil.nvim' },
	{ src = 'https://github.com/folke/which-key.nvim' },
})

require('nvim-web-devicons').setup()
require('lualine').setup()
require('mini.pairs').setup()
require('mini.ai').setup()
require('catppuccin').setup()
require('oil').setup()
require('mini.surround').setup()
require('mini.snippets').setup()
require('which-key').setup()
require('blink.cmp').setup({
	keymap = {
		preset = 'default',
		['<CR>'] = { 'accept', 'fallback' },
		['<Tab>'] = { 'select_next', 'fallback' },
		['<S-Tab>'] = { 'select_prev', 'fallback' },
		sources = {
			providers = {
				path = {
					opts = {
						show_hidden_files_by_default = true,
					},
				},
			},
		},
	},
})
require('fzf-lua').setup()
require('mason').setup()
require('todo-comments').setup()

vim.cmd.colorscheme "catppuccin-macchiato"
vim.lsp.enable({ 'lua_ls', 'pyright', 'bashls', 'cssls', 'html', 'jsonsl' })

-- NOTE: LSP Configurations
vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }, -- Recognize 'vim' as a global variable
			},
		},
	},
})
