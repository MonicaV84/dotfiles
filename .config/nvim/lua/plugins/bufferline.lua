return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup()
        vim.keymap.set('n', '<leader>n', ':bn<CR>')
        vim.keymap.set('n', '<leader>p', ':bp<CR>')
        vim.keymap.set('n', '<leader>x', ':bd<CR>')
    end,
}
