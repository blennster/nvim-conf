-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "gl", vim.diagnostic.open_float, { desc = "Open Float Diagnostics" })
map("n", "<leader><tab>n", "<cmd>BufferLineCycleNext<cr>", { desc = "Previous tab" })
map("n", "<leader><tab>p", "<cmd>BufferLineCyclePrev<cr>", { desc = "Next tab" })
map("n", "<leader><tab>,", "<cmd>BufferLineMovePrev<cr>", { desc = "Move tab left" })
map("n", "<leader><tab>.", "<cmd>BufferLineMovePrev<cr>", { desc = "Move tab right" })
map("n", "<leader>cL", "<cmd>lua vim.lsp.codelens.run()<cr>", { desc = "Codelens" })
