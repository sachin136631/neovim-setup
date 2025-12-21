return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = false,
      enable_git_status = false,
      enable_diagnostics = false,
      filesystem = {
        follow_current_file = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    })

    ---------------------------------------------------------
    -- CTRL-B → OPEN Neo-tree (always)
    ---------------------------------------------------------
    vim.keymap.set("n", "<C-y>", function()
      require("neo-tree.command").execute({
        position = "left",
        source = "filesystem",
        reveal = true,
        dir = vim.loop.cwd(),
      })
    end, { silent = true, noremap = true, nowait = true })

    ---------------------------------------------------------
    -- CTRL-M → FORCE CLOSE Neo-tree (even if cursor is inside)
    ---------------------------------------------------------
    vim.keymap.set("n", "<C-m>", function()
      vim.cmd("Neotree close")
    end, { silent = true, noremap = true, nowait = true })
  end,
}
