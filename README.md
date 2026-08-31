# Dotfiles

Archivos de configuración personal para un entorno de desarrollo integrado, ágil y multiplataforma (Windows y Linux/macOS). 

El objetivo es mantener una experiencia visual coherente y productiva entre la terminal, el prompt de comandos y el editor de código, compartiendo la misma identidad de diseño (fondos oscuros, tipografía Nerd Font y acento turquesa/verde esmeralda `#51C1A4`).

---

## Contenido del Repositorio

| Carpeta | Herramienta | Descripción | Documentación |
|---|---|---|---|
| [`LazyVim/`](file:///c:/Users/osxar/Documents/MyPA/DOTFILES/LazyVim/README.md) | [LazyVim](https://www.lazyvim.org/) / Neovim | Configuración del editor, tema personalizado Tokyonight, Lualine y atajos de navegación | [README LazyVim](file:///c:/Users/osxar/Documents/MyPA/DOTFILES/LazyVim/README.md) |
| [`Starship/`](file:///c:/Users/osxar/Documents/MyPA/DOTFILES/Starship/README.md) | [Starship](https://starship.rs/) | Prompt minimalista en dos líneas con información de Git, directorio y duración de comandos | [README Starship](file:///c:/Users/osxar/Documents/MyPA/DOTFILES/Starship/README.md) |
| [`WezTerm/`](file:///c:/Users/osxar/Documents/MyPA/DOTFILES/WezTerm/README.md) | [WezTerm](https://wezterm.org/) | Emulador de terminal con GPU, pestañas inteligentes, selector de atajos y paneles | [README WezTerm](file:///c:/Users/osxar/Documents/MyPA/DOTFILES/WezTerm/README.md) |

---

## Identidad Visual y Colores

Todas las herramientas comparten la misma paleta cromática basada en tonos oscuros y contraste balanceado:

- **Acento Principal:** `#51C1A4` (Turquesa / Esmeralda)
- **Fondo Base:** `#000000` / `#101715` / `#0D1211`
- **Fondo Intermedio / Selección:** `#17231F` / `#284239`
- **Texto Principal:** `#E6EEE9` / `#93B1A6`
- **Texto Secundario / Comentarios:** `#8D9D95` / `#333E48`
- **Tipografía:** `JetBrains Mono` con glifos de [Nerd Fonts](https://www.nerdfonts.com/).

---

## Instalación y Despliegue

Cada subcarpeta corresponde a una herramienta. Copiar o crear enlaces simbólicos (*symlinks*) a las rutas correspondientes del sistema operativo:

### 1. LazyVim
- **Windows:** `%LOCALAPPDATA%\nvim\lua\`
- **Linux/macOS:** `~/.config/nvim/lua/`

### 2. Starship
- **Windows:** `%USERPROFILE%\.config\starship.toml`
- **Linux/macOS:** `~/.config/starship.toml`

### 3. WezTerm
- **Windows:** `%USERPROFILE%\.wezterm.lua`
- **Linux/macOS:** `~/.wezterm.lua`

---

## Documentación Detallada

Para consultar el mapa de atajos de teclado, opciones específicas de cada configuración o requisitos del sistema, dirígete al `README.md` de cada herramienta.