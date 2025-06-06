vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local arg = vim.fn.argv(0)
    if arg and vim.fn.isdirectory(arg) == 1 then
      require("telescope").extensions.file_browser.file_browser({ path = arg })
      vim.cmd("stopinsert")
    end
  end,
})