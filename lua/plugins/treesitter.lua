  return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config=function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = {
          "lua",
          "javascript",
          "go",
          "rust",
          "css",
          "cpp",
          "python",
          "typescript",
          "tsx",
          "html",},
        highlight = { enable = true },
        indent = { enable = true },

      })
    end
}
