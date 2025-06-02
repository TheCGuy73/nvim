local M = {}

-- Funzione per caricare i plugin dalla cartella `spec` e dalle sue sottocartelle
function M.load_plugins_from_spec()
  local plugins = {}
  local spec_path = vim.fn.stdpath("config") .. "/lua/core/custom/plugins/spec"

  -- Funzione ricorsiva per cercare file .lua in tutte le sottocartelle
  local function scan_dir(dir)
    local files = vim.fn.glob(dir .. "/*", true, true)
    for _, file in ipairs(files) do
      if vim.fn.isdirectory(file) == 1 then
        scan_dir(file)
      elseif file:sub(-4) == ".lua" then
        local plugin = dofile(file)
        if plugin then
          table.insert(plugins, plugin)
        end
      end
    end
  end

  scan_dir(spec_path)
  return plugins
end

return M