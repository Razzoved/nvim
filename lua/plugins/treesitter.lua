return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "c", "lua", "vim", "vimdoc",
                "query", "javascript", "html", "php",
                "phpdoc", "python", "c_sharp", "java",
                "markdown"
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}

