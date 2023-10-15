vim.keymap.set(
	"n",
	"<C-f>",
	"<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>"
)
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>lg", "<cmd>Telescope live_grep<CR>")
