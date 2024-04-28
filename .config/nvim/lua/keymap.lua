vim.keymap.set('n', '<leader>f', "<cmd>Telescope live_grep<CR>")  -- search within files
vim.keymap.set('n', '<leader>p', "<cmd>Telescope find_files<CR>") -- file finder
vim.keymap.set(
    "n",
    "<C-f>",
    "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>"
) -- find in buffer

-- Map <M-Up> to move the current line up
vim.api.nvim_set_keymap("n", "<M-Up>", ":m-2<CR>==", { noremap = true })
vim.api.nvim_set_keymap("i", "<M-Up>", "<Esc>:m-2<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("v", "<M-Up>", ":m-2<CR>gv=gv", { noremap = true })

-- Map <M-Down> to move the current line down
vim.api.nvim_set_keymap("n", "<M-Down>", ":m+<CR>==", { noremap = true })
vim.api.nvim_set_keymap("i", "<M-Down>", "<Esc>:m+<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("v", "<M-Down>", ":m+<CR>gv=gv", { noremap = true })

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)      -- code action
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)           -- rename
vim.keymap.set("n", "H", "^", { silent = true })                -- first char of the line
vim.keymap.set("v", "H", "^", { silent = true })
vim.keymap.set("n", "L", "$", { silent = true })                -- end of the line
vim.keymap.set("v", "L", "$", { silent = true })
vim.keymap.set("i", "jj", "<Esc>", { silent = true })           -- exit insert mode
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })       -- go to the left window
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })       -- go to the right window
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true })   -- save file
vim.keymap.set("n", "<leader>W", ":wa<CR>", { silent = true })  -- save files
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true })   -- quit
vim.keymap.set("n", "<leader>Q", ":qa!<CR>", { silent = true }) -- force quit
