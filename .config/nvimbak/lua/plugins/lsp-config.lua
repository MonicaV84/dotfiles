return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers = require("mason-lspconfig").get_installed_servers()

      for _, name in ipairs(servers) do
        lspconfig[name].setup({
          capabilities = capabilities,
        })
      end
    end,
  },
}

