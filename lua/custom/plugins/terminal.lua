return {
  "numToStr/FTerm.nvim",
  config = function()
    vim.keymap.set('n', '<leader>tm', '<CMD>lua require("FTerm").toggle()<CR>')       -- Terminal
    vim.keymap.set('t', '<C-e>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>') -- Exit
  end

}
