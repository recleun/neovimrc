local lsp_zero = require('lsp-zero')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
	vim.keymap.set('n', '<leader>rs', vim.lsp.buf.rename, {})
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'rust_analyzer', 'tsserver', 'lua_ls', 'pyright', 'eslint', 'wgsl_analyzer', 'jsonls' },
})

require("mason-lspconfig").setup_handlers({
	function(server_name)
		if server_name == "tsserver" then server_name = "ts_ls" end
		require("lspconfig")[server_name].setup({capabilities = capabilities})
	end,
	["jsonls"] = function()
		require("lspconfig").jsonls.setup({
			filetypes = { "json", "jsonc" },
			capabilities = capabilities,
			settings = {
				json = {
					schemas = {
						{
							fileMatch = {"package.json"},
							url = "https://json.schemastore.org/package.json"
						},
						{
							fileMatch = {"tsconfig*.json"},
							url = "https://json.schemastore.org/tsconfig.json"
						},
						{
							fileMatch = {
								".prettierrc",
								".prettierrc.json",
								"prettier.config.json"
							},
							url = "https://json.schemastore.org/prettierrc.json"
						},
						{
							fileMatch = {".eslintrc", ".eslintrc.json"},
							url = "https://json.schemastore.org/eslintrc.json"
						},
					}
				}
			}
		})
	end,
})

local cmp = require('cmp')

cmp.setup({
	sources = {
		{ name = 'path' },
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
