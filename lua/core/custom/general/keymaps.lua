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

-- Keymaps specifiche quando Neo-tree è aperto (solo se il filetype è "neo-tree")

vim.keymap.set('n', 'a', function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd('Neotree create')
  end
end, { desc = 'Create new file/directory' })

vim.keymap.set('n', 'd', function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd('Neotree delete')
  end
end, { desc = 'Delete file/directory' })

vim.keymap.set('n', 'r', function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd('Neotree rename')
  end
end, { desc = 'Rename file/directory' })

vim.keymap.set('n', 'y', function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd('Neotree copy_to_clipboard')
  end
end, { desc = 'Copy path to clipboard' })

vim.keymap.set('n', 'x', function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd('Neotree cut')
  end
end, { desc = 'Cut file/directory' })

vim.keymap.set('n', 'p', function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd('Neotree paste')
  end
end, { desc = 'Paste file/directory' })

vim.keymap.set('n', 's', function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd('Neotree s')
  end
end, { desc = 'Open in horizontal split' })

vim.keymap.set('n', 'v', function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd('Neotree v')
  end
end, { desc = 'Open in vertical split' })

vim.keymap.set('n', 'i', function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd('Neotree info')
  end
end, { desc = 'Show file info' })

vim.keymap.set('n', 'H', function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd('Neotree toggle_hidden')
  end
end, { desc = 'Toggle hidden files' })