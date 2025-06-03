return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "clangd", "texlab" },
      automatic_installation = true,
    })

    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local mason_lspconfig = require("mason-lspconfig")

    for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
      if server_name == "clangd" then
        local compile_commands = vim.fn.getcwd() .. "/compile_commands.json"
        local cmd = { "clangd" }
        if vim.fn.filereadable(compile_commands) == 1 then
          table.insert(cmd, "--compile-commands-dir=" .. vim.fn.getcwd())
        else
          vim.schedule(function()
            vim.notify("clangd: compile_commands.json non trovato nella directory corrente", vim.log.levels.WARN)
          end)
        end
        lspconfig.clangd.setup({
          capabilities = capabilities,
          cmd = cmd,
        })
      else
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end
    end
  end,
}