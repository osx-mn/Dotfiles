# Configuración de WezTerm

Documentación del archivo `wezterm.lua`, configuración personalizada para el emulador de terminal [WezTerm](https://wezterm.org/).

---

## 1. Tipografía y Fuente

- **Fuente:** `JetBrains Mono`, peso `Medium`.
- **Tamaño:** `10 pt`.

---

## 2. Paleta de Colores

Esquema de color oscuro personalizado con contraste suave y acentos esmeralda/turquesa:

| Elemento | Código Hexadecimal | Propósito / Apariencia |
|---|---|---|
| Fondo principal | `#000000` | Negro puro |
| Texto principal | `#93B1A6` | Verde salvia suave |
| Fondo del cursor | `#183D3D` | Verde petróleo profundo |
| Texto del cursor | `#51C1A4` | Turquesa brillante (color de acento principal) |

### Barra de pestañas (`tab_bar`)

- **Fondo general:** `#000000`
- **Pestaña activa:** Fondo `#5C8374`, Texto `#040D12`
- **Pestaña inactiva:** Fondo `#1a1a1a`, Texto `#808080`

---

## 3. Cursor

- **Estilo:** `BlinkingUnderline` (subrayado parpadeante).
- **Velocidad de parpadeo:** `400 ms`.
- **Curvas de animación:** `EaseIn` y `EaseOut` para una transición suave.

---

## 4. Ventana y Comportamiento

- **Decoraciones:** Solo redimensionable (`RESIZE`), sin barra de título nativa clásica.
- **Estilo de botones integrados:** `Windows`.
- **Opacidad del fondo:** `0.80` (transparencia del 20%).
- **Confirmación al cerrar:** `AlwaysPrompt` (solicita confirmación antes de cerrar procesos activos).
- **Márgenes internos (*padding*):** `6px` laterales (izquierda/derecha), `4px` verticales (arriba/abajo).

---

## 5. Pestañas con Título Dinámico

El evento `format-tab-title` computa el estado de los procesos en segundo plano de cada pestaña:

- **Estructura:** Número de pestaña + título del proceso.
- **Indicador de actividad (`has_unseen_output`):**
  - **Sin novedades / Inactiva:** Ícono gris `󰄰` (`#666666`).
  - **PowerShell con salida no vista:** Ícono rojo `󰄯` (`#9e1c1c`).
  - **Otro proceso activo con salida:** Ícono verde `󰄯` (`#179937`).

---

## 6. Barra de Estado (Esquina Superior Derecha)

El evento `update-status` muestra información contextual en tiempo real:

- **Workspace activo:** Ícono ` ` seguido del nombre del espacio de trabajo en color `#5C8374`.
- **Monitoreo de procesos:** Si se está ejecutando un proceso en primer plano distinto a la shell base (`pwsh`), muestra `󰛸 nombre_proceso (PID xxxx)`.

---

## 7. Shell Predeterminado

- **Programa por defecto:** `pwsh.exe` (PowerShell 7) en modo 64 bits.

---

## 8. Tecla Líder (*Leader Key*)

- **Combinación:** `Ctrl + a` (estilo Tmux).
- **Tiempo de espera:** `1000 ms` para accionar la combinación secundaria.

---

## 9. Menú de Lanzamiento Rápido (`launch_menu`)

Se abre con la combinación **`Ctrl + Shift + B`** y proporciona acceso inmediato a proyectos y configuraciones:

| Ícono / Etiqueta | Acción Ejecutada |
|---|---|
| `󰽰  KINETIC Workspace` | Abre el proyecto `SINTETIZADOR-SOLIDJS` y corre `bun run dev` |
| `  PORTFOLIO Workspace` | Abre el proyecto `portfolio` y corre `bun run dev` |
| `  Abrir wezterm.lua` | Abre la configuración de WezTerm en el editor por defecto |
| `  Abrir starship.toml` | Abre la configuración de Starship en el editor por defecto |

---

## 10. Menú Interactivo de Atajos (`Ctrl + Shift + K`)

Selector con búsqueda difusa (*fuzzy search*) integrado vía `InputSelector` que documenta y ejecuta las acciones directamente:

| Atajo | Acción |
|---|---|
| `Alt + V` | Dividir panel verticalmente |
| `Alt + H` | Dividir panel horizontalmente |
| `Alt + ←` | Mover foco al panel de la izquierda |
| `Alt + →` | Mover foco al panel de la derecha |
| `Alt + ↑` | Mover foco al panel superior |
| `Alt + ↓` | Mover foco al panel inferior |
| `Alt + W` | Cerrar panel actual (con diálogo de confirmación) |
| `Alt + Z` | Alternar modo maximizado (*zoom*) del panel |
| `Alt + T` | Crear nueva pestaña |
| `Ctrl + Tab` | Navegar a la pestaña siguiente |
| `Ctrl + Shift + Tab` | Navegar a la pestaña anterior |
| `Alt + Enter` | Alternar pantalla completa |
| `Ctrl + Shift + L` | Limpiar historial de scroll (*scrollback*) |
| `Ctrl + Shift + P` | Abrir la paleta de comandos de WezTerm |
| `Ctrl + Shift + B` | Abrir el menú de lanzadores (*launch_menu*) |

---

## 11. Mapa de Atajos de Teclado (`config.keys`)

### Paneles y Ventanas

| Combinación | Acción |
|---|---|
| `Alt + V` | `SplitVertical` (panel vertical) |
| `Alt + H` | `SplitHorizontal` (panel horizontal) |
| `Alt + Flechas` | Navegación direccional entre paneles |
| `Alt + W` | Cerrar panel actual |
| `Alt + Z` | Maximizar / restaurar tamaño del panel |
| `Alt + Enter` | Pantalla completa |
| `Ctrl + Shift + L` | Limpiar buffer de scroll |

### Pestañas

| Combinación | Acción |
|---|---|
| `Alt + T` | Crear pestaña en el dominio actual |
| `Ctrl + Tab` | Ir a pestaña siguiente |
| `Ctrl + Shift + Tab` | Ir a pestaña anterior |

### Redimensionamiento con Tecla Líder (`Ctrl + a`)

| Combinación | Acción |
|---|---|
| `Leader + ←` | Reducir / ajustar 5 px a la izquierda |
| `Leader + →` | Reducir / ajustar 5 px a la derecha |
| `Leader + ↑` | Reducir / ajustar 5 px hacia arriba |
| `Leader + ↓` | Reducir / ajustar 5 px hacia abajo |

---

## 12. Acciones Rápidas en la Paleta de Comandos (`Ctrl + Shift + P`)

Comandos inyectados mediante `augment-command-palette`:

| Nombre en Paleta | Comando Enviado |
|---|---|
| **Docker: Levantar compose** | `docker compose up -d` |
| **Git: status** | `git status` |
| **Sistema: uso de disco** | `Get-PSDrive -PSProvider FileSystem` |

---

## 13. Requisitos

- [WezTerm](https://wezterm.org/) instalado.
- Fuente `JetBrains Mono` con soporte [Nerd Fonts](https://www.nerdfonts.com/).
- `pwsh` (PowerShell 7) configurado en las variables de entorno.
- `bun` para la ejecución de scripts de desarrollo en el menú de lanzamiento.

---

## 14. Ubicación del archivo

- **Linux / macOS:** `~/.wezterm.lua`
- **Windows:** `%USERPROFILE%\.wezterm.lua`