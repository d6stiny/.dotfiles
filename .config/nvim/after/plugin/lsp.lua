local cmp = require("cmp")

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
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.scroll_docs(4),
        ["<C-p>"] = cmp.mapping.scroll_docs(-4),
        ["<C-Space>"] = cmp.mapping.complete(),
    },

    sources = {
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "buffer" }
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = vim_item.kind
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

vim.diagnostic.config({
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})
