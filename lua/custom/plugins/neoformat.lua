return {
  "sbdchd/neoformat",
  config = function()
    vim.api.nvim_create_autocmd({ "BufWrite" }, {
      callback = function()
        vim.cmd("Neoformat")
      end
    })
  end
}
