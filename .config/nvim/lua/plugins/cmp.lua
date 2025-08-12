return {
	'hrsh7th/nvim-cmp',
	config = function()
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
	end
}
