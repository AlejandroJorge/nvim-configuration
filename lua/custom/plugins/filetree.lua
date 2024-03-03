return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    local api = require "nvim-tree.api"

    local function custom_on_attach(bufnr)
      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      -- Custom mappings
      vim.keymap.set('n', '<leader>tr', ':NvimTreeRefresh<CR>', opts('Refresh'))                    -- Refresh tree
      vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', '<leader>ct', ':NvimTreeClose<CR>', opts('Close'))                        -- Close tree
      vim.keymap.set('n', '<leader>cr', api.tree.change_root_to_node, opts('Change root'))          -- Change root
      vim.keymap.set('n', '<leader>cf', api.fs.create, opts('Create'))                              -- Create file
      vim.keymap.set('n', '<leader>rn', api.fs.rename_sub, opts('Rename'))                          -- Rename
      vim.keymap.set('n', '<leader>rm', api.fs.remove, opts('Remove'))                              -- Remove
      vim.keymap.set('n', '<leader>vs', api.node.open.vertical)                                     -- Vertical split
      vim.keymap.set('n', '<leader>pf', api.node.navigate.parent)                                   -- Parent folder
      vim.keymap.set('n', '<leader>hf', api.tree.toggle_hidden_filter, opts('Toggle hidden'))       -- Toggle hidden files
      vim.keymap.set('n', '<leader>gf', api.tree.toggle_gitignore_filter, opts('Toggle gitignore')) -- Toggle gitignore files
    end

    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 40,
        side = "right",
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
      on_attach = custom_on_attach,
    })

    vim.keymap.set('n', '<leader>ft', ':NvimTreeFocus<CR>')  -- Focus tree
    vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>') -- Toggle tree

    vim.api.nvim_create_autocmd({ "QuitPre" }, {
      callback = function() vim.cmd("NvimTreeClose") end,
    })
  end
}
