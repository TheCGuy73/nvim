return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    -- Setup mason
    require("mason").setup()

    -- Setup mason-lspconfig
    require("mason-lspconfig").setup({
      ensure_installed = { "clangd", "texlab" },
      automatic_installation = true,
    })

    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    -- Setup each installed server
    for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
      if server_name == "clangd" then
        local compile_commands = vim.fn.getcwd() .. "/compile_commands.json"
        local cmd = { "clangd" }
        if vim.fn.filereadable(compile_commands) == 1 then
          table.insert(cmd, "--compile-commands-dir=" .. vim.fn.getcwd())
        else
          -- Show message only if a C/C++ file is open
          local ft = vim.bo.filetype
          if ft == "c" or ft == "cpp" or ft == "cxx" or ft == "objc" or ft == "objcpp" then
            vim.schedule(function()
              vim.notify("clangd: compile_commands.json non trovato nella directory corrente", vim.log.levels.WARN)
            end)
          end
        end
        lspconfig.clangd.setup({
          cmd = cmd,
        })
      else
        lspconfig[server_name].setup({})
      end
    end
  end,
}