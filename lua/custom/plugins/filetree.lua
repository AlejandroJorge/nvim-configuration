return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    -- OR setup with some options
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })


    local api = require "nvim-tree.api"
    -- Custom mappings
    vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>')        -- Toggle tree
    vim.keymap.set('n', '<leader>ft', ':NvimTreeFocus<CR>')         -- Focus tree
    vim.keymap.set('n', '<leader>cr', api.tree.change_root_to_node) -- Change root
    vim.keymap.set('n', '<leader>cf', api.fs.create)                -- Create file
    vim.keymap.set('n', '<leader>rn', api.fs.rename_sub)            -- Rename
    vim.keymap.set('n', '<leader>vs', api.node.open.vertical)       -- Vertical split
    vim.keymap.set('n', '<leader>pf', api.node.navigate.parent)     -- Parent folder
  end
}
