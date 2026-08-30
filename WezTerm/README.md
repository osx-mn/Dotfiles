# Configuración de WezTerm

Documentación del archivo `wezterm.lua`, configuración personalizada para la terminal [WezTerm](https://wezterm.org/).

## 1. Fuente

- Fuente: `JetBrains Mono`, peso `Medium`.
- Tamaño: `10`.

## 2. Colores

Esquema de color oscuro personalizado:

|Elemento|Color|
|---|---|
|Fondo|`#000000`|
|Texto|`#93B1A6`|
|Fondo del cursor|`#183D3D`|
|Texto del cursor|`#51C1A4`|

**Barra de pestañas (`tab_bar`):**

- Fondo general: `#000000`
- Pestaña activa: fondo `#5C8374`, texto `#040D12`
- Pestaña inactiva: fondo `#1a1a1a`, texto `#808080`

## 3. Cursor

- Estilo: `BlinkingUnderline` (subrayado parpadeante).
- Velocidad de parpadeo: `400 ms`.
- Curvas de animación: `EaseIn` / `EaseOut`.

## 4. Ventana

- Decoraciones: solo permite redimensionar (`RESIZE`), sin barra de título nativa.
- Estilo de botones de título: `Windows`.
- Opacidad del fondo: `0.80`.
- Confirmación al cerrar: siempre pregunta (`AlwaysPrompt`) para evitar cerrar procesos activos por error.
- Padding interno: `6px` izquierda/derecha, `4px` arriba/abajo.

## 5. Pestañas (título dinámico)

Evento `format-tab-title`: personaliza el título de cada pestaña mostrando:

- Índice y título del panel activo.
- Un ícono de estado según si hay salida no vista (`has_unseen_output`):
    - **Sin novedades:** ícono gris `󰄰`.
    - **PowerShell con actividad:** ícono rojo `󰄯` (color `#9e1c1c`).
    - **Otro proceso con actividad:** ícono verde `󰄯` (color `#179937`).

## 6. Barra de estado (esquina derecha)

Evento `update-status`: en la esquina derecha de la barra de pestañas muestra:

- El nombre del **workspace** activo.
- Si hay un proceso en primer plano distinto de `pwsh`, muestra su nombre y PID: `nombre_proceso (PID xxxx)`.

## 7. Programa por defecto

Shell predeterminado al abrir una nueva terminal: `pwsh.exe` (PowerShell 7).

## 8. Leader Key

- Combinación: `Ctrl+a`.
- Tiempo de espera: `1000 ms` para presionar la siguiente tecla (estilo tmux).

## 9. Menú de lanzamiento (`launch_menu`)

Se abre con **`Ctrl+Shift+B`**. Comandos predefinidos:

|Etiqueta|Acción|
|---|---|
|KINETIC Workspace|Entra al proyecto `SINTETIZADOR-SOLIDJS` y ejecuta `bun run dev`|
|PORTFOLIO Workspace|Entra al proyecto `portfolio` y ejecuta `bun run dev`|
|📝 Abrir wezterm.lua|Abre el archivo de configuración con la app predeterminada|

## 10. Menú de atajos (`Ctrl+Shift+K`)

Selector interactivo (con búsqueda difusa) que lista los atajos disponibles y ejecuta la acción real de WezTerm al elegir uno:

|Atajo|Acción|
|---|---|
|`Alt+V`|Dividir panel verticalmente|
|`Alt+H`|Dividir panel horizontalmente|
|`Alt+←`|Ir al panel de la izquierda|
|`Alt+→`|Ir al panel de la derecha|
|`Alt+↑`|Ir al panel de arriba|
|`Alt+↓`|Ir al panel de abajo|
|`Alt+W`|Cerrar el panel actual (con confirmación)|
|`Alt+Z`|Maximizar/restaurar el panel actual|
|`Alt+T`|Abrir una nueva pestaña|
|`Ctrl+Tab`|Ir a la siguiente pestaña|
|`Ctrl+Shift+Tab`|Ir a la pestaña anterior|
|`Alt+Enter`|Pantalla completa|
|`Ctrl+Shift+L`|Limpiar el scrollback|
|`Ctrl+Shift+P`|Paleta de comandos de WezTerm|
|`Ctrl+Shift+B`|Menú de comandos (launch_menu)|

## 11. Atajos de teclado (`config.keys`)

### Generales

|Atajo|Acción|
|---|---|
|`Alt+Enter`|Pantalla completa|
|`Ctrl+Shift+L`|Limpiar scrollback|

### Paneles

|Atajo|Acción|
|---|---|
|`Alt+V`|Dividir verticalmente|
|`Alt+H`|Dividir horizontalmente|
|`Alt+←/→/↑/↓`|Navegar entre paneles|
|`Alt+W`|Cerrar panel actual (con confirmación)|
|`Alt+Z`|Maximizar/restaurar panel|

### Pestañas

|Atajo|Acción|
|---|---|
|`Alt+T`|Nueva pestaña|
|`Ctrl+Tab`|Siguiente pestaña|
|`Ctrl+Shift+Tab`|Pestaña anterior|

### Menús y paletas

|Atajo|Acción|
|---|---|
|`Ctrl+Shift+B`|Menú de comandos (launch_menu)|
|`Ctrl+Shift+K`|Menú de atajos con descripción|
|`Ctrl+Shift+P`|Paleta de comandos de WezTerm|

### Redimensionar paneles (con Leader `Ctrl+a`)

|Atajo|Acción|
|---|---|
|`Leader + ←`|Reducir panel hacia la izquierda (5px)|
|`Leader + →`|Reducir panel hacia la derecha (5px)|
|`Leader + ↑`|Reducir panel hacia arriba (5px)|
|`Leader + ↓`|Reducir panel hacia abajo (5px)|

## 12. Comandos rápidos en la paleta (`Ctrl+Shift+P`)

Evento `augment-command-palette`: agrega comandos personalizados a la paleta nativa de WezTerm:

|Comando|Acción ejecutada|
|---|---|
|Docker: Levantar compose|`docker compose up -d`|
|Git: status|`git status`|
|Sistema: uso de disco|`Get-PSDrive -PSProvider FileSystem`|

## Requisitos

- [WezTerm](https://wezterm.org/) instalado.
- Fuente `JetBrains Mono` instalada en el sistema.
- Fuente [Nerd Font](https://www.nerdfonts.com/) (o una que incluya sus glifos) para los íconos de estado.
- `pwsh` (PowerShell 7) disponible en el `PATH`.
- `bun` instalado, si se usan las entradas del `launch_menu` que lo invocan.

## Ubicación del archivo

Colocar el archivo como `~/.wezterm.lua` (o `%USERPROFILE%\.wezterm.lua` en Windows).