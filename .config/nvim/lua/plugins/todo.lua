return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("todo-comments").setup({
            vim.keymap.set("n", "]t", function()
                require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
            end, { desc = "Next error/warning todo comment" }),
        })
    end,
}
