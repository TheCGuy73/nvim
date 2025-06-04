function check_plugins_loaded()
  local ok, lazy = pcall(require, "lazy")
  if not ok then
    vim.notify("Unable to find 'lazy.nvim'.", vim.log.levels.ERROR, { title = "Check Plugins" })
    return
  end

  local not_loaded = {}
  for _, plugin in ipairs(lazy.plugins()) do
    -- Considera caricati anche i plugin che sono lazy (event, cmd, ecc.)
    if not plugin._.loaded and not plugin.lazy then
      table.insert(not_loaded, plugin.name or plugin[1])
    end
  end

  if #not_loaded == 0 then
    vim.notify("All plugins have been loaded and updated successfully!", vim.log.levels.INFO, { title = "Check Plugins" })
  else
    vim.notify("Plugins not loaded or not updated:\n- " .. table.concat(not_loaded, "\n- "), vim.log.levels.ERROR, { title = "Check Plugins" })
  end
end