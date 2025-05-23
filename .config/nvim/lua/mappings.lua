require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- save with Ctrl + s

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Save file" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

---@type MappingsTable
local M = {}

return M
