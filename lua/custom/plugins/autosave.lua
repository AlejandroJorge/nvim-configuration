return {
  "pocco81/auto-save.nvim",
  config = {
    vim.api.nvim_set_keymap("n", "<leader>ta", ":ASToggle<CR>", { desc = "Toggle autosave" })
  }
}
