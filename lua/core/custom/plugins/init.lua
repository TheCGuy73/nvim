local M = {}

-- Funzione per caricare i plugin dalla cartella `spec`
function M.load_plugins_from_spec()
  local plugins = {}
  local spec_path = vim.fn.stdpath("config") .. "/lua/core/custom/plugins/spec"

  -- Itera su tutti i file Lua nella directory `spec`
  for _, file in ipairs(vim.fn.glob(spec_path .. "/*.lua", true, true)) do
    local plugin = dofile(file) -- Carica il file come modulo Lua
    if plugin then
      table.insert(plugins, plugin)
    end
  end

  return plugins
end

return M