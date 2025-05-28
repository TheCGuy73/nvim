return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- clangd
      lspconfig.clangd.setup({})

      -- texlab
      lspconfig.texlab.setup({
        settings = {
          texlab = {
            build = {
              args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
              executable = "latexmk",
              onSave = false,
            },
            forwardSearch = {
              args = { "--file-line", "%f:%l", "%p" },
              executable = "zathura",
            },
            chktex = {
              enabled = true,
            },
            latexindent = {
              enabled = true,
            },
            auxDirectory = "build",
            rootDirectory = "%workspaceFolder",
          },
        },
      })
    end,
  },
}