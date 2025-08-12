return {
	'mason-org/mason.nvim',
	lazy = false,
	dependencies = {
		'mason-org/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',
		'hrsh7th/cmp-nvim-lsp'
	},
	config = function()
		local mason = require('mason')
		local mason_lspconfig = require('mason-lspconfig')
		local lspconfig = require('lspconfig')
		local cmp_nvim_lsp = require('cmp_nvim_lsp')
		local capabilities = cmp_nvim_lsp.default_capabilities()

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				},
			},

		})
		mason_lspconfig.setup({
			ensure_installed = {
				'lua_ls',
				'pyright',
				'cssls',
				'html',
				'bashls',
				'jsonls'
			},
			automatic_installation = true,
		})
	end
}
