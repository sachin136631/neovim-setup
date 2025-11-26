return {
  {"williamboman/mason.nvim",
  config=function()
    require("mason").setup()
  end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config=function()
      require("mason-lspconfig").setup({
        ensure_installed={"lua_ls","pylsp","clangd"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config=function()
      vim.lsp.config("lua_ls",{})
      vim.lsp.config("pylsp",{})
      vim.lsp.config("clangd",{})
    end
  }

}
