local M = {}

function M.setup_oil_keymaps()
    local ok, oil = pcall(require, "oil")
    if ok then
        -- Keymap per aprire Oil
        vim.keymap.set("n", "<F1>", oil.open, { desc = "[O] Open Oil (File Explorer)" })

        -- Keymap per chiudere Oil
        vim.keymap.set("n", "<F2>", function()
            if oil.get_current_dir() then -- Assuming 'get_current_dir' checks if Oil is open
                oil.close()
            else
                vim.notify("Oil non è aperto!", vim.log.levels.INFO)
            end
        end, { desc = "[Q] Close Oil (File Explorer)" })
    else
        vim.notify("Il pacchetto 'oil' non è installato!", vim.log.levels.WARN)
    end
end

return M