local nvterm = require("nvterm.terminal")

local function run_maven()
  vim.cmd("w") -- Guardar archivo actual

  -- Comando para compilar y ejecutar con Maven
  local cmd = "mvn compile exec:java"

  -- Ejecutar en terminal flotante
  nvterm.send(cmd, "float")
end

-- Asignar a F5 si el archivo está dentro de un proyecto Maven
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.keymap.set("n", "<F5>", run_maven, { noremap = true, silent = true, buffer = true })
  end,
})
