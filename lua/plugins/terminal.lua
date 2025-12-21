return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      ---------------------------------------------------------
      -- Base setup
      ---------------------------------------------------------
      require("toggleterm").setup{
        size = 20,
        open_mapping = [[<leader>=]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        float_opts = {
          border = "curved",
          winblend = 3,
        },
      }

      ---------------------------------------------------------
      -- Terminal “tabs” (IDs 1, 2, 3)
      ---------------------------------------------------------
      local Terminal = require("toggleterm.terminal").Terminal

      local term1 = Terminal:new({ id = 1, direction = "horizontal" })
      local term2 = Terminal:new({ id = 2, direction = "horizontal" })
      local term3 = Terminal:new({ id = 3, direction = "horizontal" })

      ---------------------------------------------------------
      -- Keymaps to switch between them
      ---------------------------------------------------------
      vim.keymap.set("n", "<leader>1", function()
        term1:toggle()
      end, { noremap = true, silent = true })

      vim.keymap.set("n", "<leader>2", function()
        term2:toggle()
      end, { noremap = true, silent = true })

      vim.keymap.set("n", "<leader>3", function()
        term3:toggle()
      end, { noremap = true, silent = true })

    end,
  }
}
