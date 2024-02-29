return {
  "ThePrimeagen/harpoon",
  config = function()
    local api = {
      ui = require("harpoon.ui"),
      mark = require("harpoon.mark"),
    }

    vim.keymap.set("n", "<leader>hm", function()
      api.ui.toggle_quick_menu()
    end)

    vim.keymap.set("n", "<leader>ha", function()
      api.mark.add_file()
    end)

    vim.keymap.set("n", "<leader>hr", function(bufnr)
      api.mark.rm_file(bufnr)
    end)

    vim.keymap.set("n", "<leader>hR", function()
      api.mark.clear_all()
    end)

    vim.keymap.set("n", "<C-h>", function()
      api.ui.nav_next()
    end)

    vim.keymap.set("n", "<C-l>", function()
      api.ui.nav_prev()
    end)

    for i = 1, 5 do
      vim.keymap.set("n", "<leader>h" .. i, function()
        api.ui.nav_file(i)
      end)
    end
  end,
}
