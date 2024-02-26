return {
  "mhartington/formatter.nvim",
  event = "VeryLazy",
  config = function()
    require("formatter").setup({
      filetype = {
        javascript = {
          require("formatter.filetypes.javascript").prettier
        },
        javascriptreact = {
          require("formatter.filetypes.javascriptreact").prettier
        },
        typescript = {
          require("formatter.filetypes.typescript").prettier
        },
        typescriptreact = {
          require("formatter.filetypes.typescriptreact").prettier
        },
        json = {
          require("formatter.filetypes.json").prettier
        },
        css = {
          require("formatter.filetypes.css").prettier
        },
        html = {
          require("formatter.filetypes.html").prettier
        }
      }
    })

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      command = "FormatWriteLock"
    })
  end
}
