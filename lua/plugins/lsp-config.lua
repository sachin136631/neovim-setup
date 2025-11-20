return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,    -- auto install servers
        ensure_installed = {
          "lua_ls",
          "pylsp",
        },
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- 1) Special config for languages that need it (Lua)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      -- 2) Enable`:w ALL installed servers automatically
      local servers = require("mason-lspconfig").get_installed_servers()
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end

      -- 3) Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n","gd",vim.lsp.buf.definition,{})
      vim.keymap.set({"n","v"},'<leader>ca',vim.lsp.buf.code_action,{} )
    end
  }
}
