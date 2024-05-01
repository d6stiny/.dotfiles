local lsp = require("lsp-zero")
local cmp = require("cmp")

require("mason-lspconfig").setup({
	ensure_installed = { "tsserver" },
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})

cmp.setup({
	window = {
		completion = {
			border = "rounded",
			side_padding = 1,
			winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
			zindex = 1001,
		},
		documentation = {
			border = "rounded",
			side_padding = 1,
			winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
			zindex = 1001,
		},
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp.mapping.confirm({ select = false }),
		["<C-Space>"] = cmp.mapping.complete(),

		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
	},

	sources = {
		{ name = "buffer" },
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "path" },
	},

	formatting = {
		format = function(entry, vim_item)
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				copilot = "[Copilot]",
			})[entry.source.name]
			return vim_item
		end,
	},
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.setup()
