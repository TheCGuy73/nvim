vim.wo.number = true
vim.opt.guicursor = "a:block"
vim.opt.termguicolors = true
vim.opt.guifont = "Caskaydia Cove Nerd Font Mono:h12"
vim.opt.fillchars = { eob = " " }
vim.cmd.colorscheme "gruber-darker"
require("lualine").setup()
