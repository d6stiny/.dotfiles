require("formatter").setup({
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		css = { require("formatter.filetypes.css").prettier },
		json = { require("formatter.filetypes.json").prettier },
		javascript = { require("formatter.filetypes.javascript").prettier },
		javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
		typescript = { require("formatter.filetypes.typescript").prettier },
		typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
		["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
	},
})

local formatGroup = vim.api.nvim_create_augroup("FormatAutogroup", {})
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "FormatWriteLock",
	group = formatGroup,
})
