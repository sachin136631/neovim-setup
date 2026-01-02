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
        ensure_installed={"lua_ls","pylsp","clangd","ts_ls","jsonls"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config=function()
      vim.lsp.config("lua_ls",{})
      vim.lsp.config("pylsp",{})
      vim.lsp.config("clangd",{})
      vim.lsp.config("ts_ls",{})
      vim.lsp.config("jsonls",{})


      vim.keymap.set('n','K',vim.lsp.buf.hover,{})
      vim.keymap.set('n','gd',vim.lsp.buf.definition,{})
      vim.keymap.set({'n','v'},'<leader>ca',vim.lsp.buf.code_action,{})
    end
  }

}
