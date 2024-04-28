require("nvim-treesitter.configs").setup({
    ensure_installed = { "typescript", "javascript", "bash", "css", "lua" },

    auto_install = true,

    highlight = {
        enable = true,
    },
})
