local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
	vim.keymap.set('n', '<leader>rs', vim.lsp.buf.rename, {})
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'rust_analyzer', 'tsserver', 'lua_ls', 'pyright', 'eslint' },
	handlers = {
		lsp_zero.default_setup,
	},
})

local cmp = require('cmp')

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'crates' },
	},
	mapping = {
		['<C-y>'] = cmp.mapping.confirm({ select = false }),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-k>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
		['<C-j>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
		['<C-p>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = 'insert' })
			else
				cmp.complete()
			end
		end),
		['<C-n>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = 'insert' })
			else
				cmp.complete()
			end
		end),
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})
