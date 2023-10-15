local lsp = require("lsp-zero")
local cmp = require("cmp")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"svelte",
	"astro",
	"tailwindcss",
	"prismals"
})

lsp.nvim_workspace()

local cmp_select = { behavior = cmp.SelectBehavior.Select }
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

		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),

		["<C-Space>"] = cmp.mapping.complete(),
	},

	sources = {
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "path" },
	},

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lsp.symbols[vim_item.kind] or vim_item.kind
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				luasnip = "[Snip]",
				path = "[Path]",
				copilot = "[Copilot]",
			})[entry.source.name]
			return vim_item
		end,
	},
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
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

vim.diagnostic.config({
	virtual_text = true,
})
