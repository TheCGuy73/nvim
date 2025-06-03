-- Mappature Telescope con Meta + le lettere di "telescope"

local telescope = require('telescope.builtin')

vim.keymap.set('n', '<M-t>', telescope.find_files, { desc = '[?] Find files' })
vim.keymap.set('n', '<M-e>', telescope.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<M-l>', telescope.live_grep, { desc = '[G]rep' })
vim.keymap.set('n', '<M-s>', telescope.grep_string, { desc = '[S]earch current word' })
vim.keymap.set('n', '<M-c>', telescope.builtin, { desc = '[B]uiltin' })
vim.keymap.set('n', '<M-o>', telescope.lsp_document_symbols, { desc = '[O]utline' })
vim.keymap.set('n', '<M-p>', function() telescope.find_files({ hidden = true }) end, { desc = '[.] Find hidden files' })



-- Keymaps per Neo-tree
vim.keymap.set('n', '<C-e>', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
vim.keymap.set('n', '<C-r>', ':Neotree refresh<CR>', { desc = 'Refresh Neo-tree' })
vim.keymap.set('n', '<C-f>', ':Neotree focus<CR>', { desc = 'Focus Neo-tree' })
vim.keymap.set('n', '<C-b>', ':Neotree reveal<CR>', { desc = 'Reveal current buffer in Neo-tree' })

-- Keymaps specifiche quando Neo-tree è aperto (opzionale, ma utile)
-- Se vuoi che queste keymaps funzionino solo quando Neo-tree è la finestra attiva,
-- potresti integrarle in un setup più complesso con un autocommand.
-- Per semplicità, qui le impostiamo globalmente, ma si attivano solo se Neo-tree è visibile.

-- Mappa 'a' per creare un nuovo file o directory (ti chiederà il nome)
vim.keymap.set('n', 'a', function()
  if require('neo-tree.sources.filesystem').is_active() then
    vim.cmd('Neotree create')
  end
end, { desc = 'Create new file/directory' })

-- Mappa 'd' per eliminare il file/directory selezionato
vim.keymap.set('n', 'd', function()
  if require('neo-tree.sources.filesystem').is_active() then
    vim.cmd('Neotree delete')
  end
end, { desc = 'Delete file/directory' })

-- Mappa 'r' per rinominare il file/directory selezionato
vim.keymap.set('n', 'r', function()
  if require('neo-tree.sources.filesystem').is_active() then
    vim.cmd('Neotree rename')
  end
end, { desc = 'Rename file/directory' })

-- Mappa 'y' per copiare il percorso del file/directory selezionato
vim.keymap.set('n', 'y', function()
  if require('neo-tree.sources.filesystem').is_active() then
    vim.cmd('Neotree copy_to_clipboard')
  end
end, { desc = 'Copy path to clipboard' })

-- Mappa 'x' per tagliare il file/directory selezionato (per incollare altrove)
vim.keymap.set('n', 'x', function()
  if require('neo-tree.sources.filesystem').is_active() then
    vim.cmd('Neotree cut')
  end
end, { desc = 'Cut file/directory' })

-- Mappa 'p' per incollare il file/directory tagliato o copiato
vim.keymap.set('n', 'p', function()
  if require('neo-tree.sources.filesystem').is_active() then
    vim.cmd('Neotree paste')
  end
end, { desc = 'Paste file/directory' })

-- Mappa 's' per aprire il file selezionato in uno split orizzontale
vim.keymap.set('n', 's', function()
  if require('neo-tree.sources.filesystem').is_active() then
    vim.cmd('Neotree s')
  end
end, { desc = 'Open in horizontal split' })

-- Mappa 'v' per aprire il file selezionato in uno split verticale
vim.keymap.set('n', 'v', function()
  if require('neo-tree.sources.filesystem').is_active() then
    vim.cmd('Neotree v')
  end
end, { desc = 'Open in vertical split' })

-- Mappa 'i' per visualizzare le informazioni del file (es. dimensione, data modifica)
vim.keymap.set('n', 'i', function()
  if require('neo-tree.sources.filesystem').is_active() then
    vim.cmd('Neotree info')
  end
end, { desc = 'Show file info' })

-- Mappa 'H' per toggle dei file nascosti (dotfiles)
vim.keymap.set('n', 'H', function()
  if require('neo-tree.sources.filesystem').is_active() then
    vim.cmd('Neotree toggle_hidden')
  end
end, { desc = 'Toggle hidden files' })
