return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "lua_ls",
        "pylsp",
        "clangd",
        "ts_ls",
        "jsonls",
      },
      automatic_installation = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      end

      -- Lua
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Python
      vim.lsp.config("pylsp", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- C/C++
      vim.lsp.config("clangd", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- TypeScript / JavaScript (NEW NAME)
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- JSON
      vim.lsp.config("jsonls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      --linter for python
      vim.lsp.config("ruff",{})
    end,
  },
}
