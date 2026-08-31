# LazyVim — Configuración personal

Módulos de personalización cargados sobre [LazyVim](https://www.lazyvim.org/) para Neovim.

> **Dependencias del sistema:** `git`, `ripgrep` y `fd` deben estar en el `PATH`.  
> `gcc` (o cualquier compilador C) es necesario para compilar parsers de Tree-sitter.

---

## `config/options.lua`

Ajustes básicos de Neovim:

- Colores True Color activados.
- Números de línea absolutos (sin modo relativo).
- Indicador de modo oculto (lo muestra Lualine).
- Tildes `~` al final del buffer reemplazadas por espacios.

---

## `plugins/colorscheme.lua`

Tema `tokyonight` estilo `night` con la paleta redefinida:

- Fondos oscuros con tonos `#101715` / `#0D1211`.
- Color de acento unificado: `#51C1A4` (turquesa) para acentos, Git y UI.
- Resaltados personalizados para cursor, Neo-tree, búsqueda y autocompletado.

> **Importante:** cargado con `lazy = false` y `priority = 1000` para que siempre se aplique antes que cualquier otro plugin. Todos los colores de acento (blue, cyan, green, magenta, etc.) apuntan al mismo `#51C1A4` de forma intencional para mantener coherencia monocromática.

---

## `plugins/ui.lua`

Configuración de `lualine.nvim` con tema dinámico por modo:

- **Normal / Replace / Command:** acento `#51C1A4`.
- **Insert:** blanco `#E6EEE9`.
- **Visual:** verde oscuro `#284239`.
- Separadores planos (`│`), sin glifos angulares.

> El tema de Lualine se define manualmente en `opts` para no depender de la auto-detección del colorscheme activo, lo que evita parpadeos o colores incorrectos al recargar la configuración.

---

## Modificar colores

Para cambiar el acento a otro color, basta con reemplazar `#51C1A4` en `colorscheme.lua` y `ui.lua`. No está hardcodeado en múltiples plugins: todos referencian ese mismo valor.

---

## Ubicación de los archivos

| Archivo | Ruta de destino |
|---|---|
| `config/options.lua` | `~/.config/nvim/lua/config/options.lua` |
| `plugins/colorscheme.lua` | `~/.config/nvim/lua/plugins/colorscheme.lua` |
| `plugins/ui.lua` | `~/.config/nvim/lua/plugins/ui.lua` |

> **Windows:** reemplazar `~/.config/nvim` por `%LOCALAPPDATA%\nvim`.
