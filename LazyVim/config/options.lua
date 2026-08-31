local opt = vim.opt

-- Mantener colores de 24 bits activados
opt.termguicolors = true

-- Números de línea estáticos limpios
opt.number = true
opt.relativenumber = false

-- Ocultar el modo escrito por defecto (ya lo muestra Lualine abajo)
opt.showmode = false

-- Ocultar los símbolos '~' al final de los archivos
opt.fillchars = { eob = " " }