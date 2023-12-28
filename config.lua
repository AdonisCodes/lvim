-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--
lvim.builtin.treesitter.ensure_installed = {
  "python",
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black"}}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup = { { command = "flake8", args = { "--ignore=E203" }, filetypes = {"python"}}}

lvim.plugins = {
  "AckslD/swenv.nvim",
  "stevearc/dressing.nvim"
}

require("swenv").setup({
  post_set_venv = function()
    vim.cmd("LspRestart")
  end
})

lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = {"<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env"},
}

lvim.transparent_window = true
