require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { { "prettierd", "prettier" } },
	},
	format_on_save = {
		lsp_fallback = true,
	},
})
