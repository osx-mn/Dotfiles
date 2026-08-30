local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- =========================================================
-- 1. FUENTE
-- =========================================================
config.font = wezterm.font('JetBrains Mono', { weight = 'Medium' })
config.font_size = 10

-- =========================================================
-- 2. COLORES
-- =========================================================
config.colors = {
    background = "#000000",
    foreground = "#93B1A6",
    cursor_bg = "#183D3D",
    cursor_fg = "#51C1A4",
    tab_bar = {
        background = '#000000',
        active_tab = {
            bg_color = '#5C8374',
            fg_color = '#040D12',
        },
        inactive_tab = {
            bg_color = '#1a1a1a',
            fg_color = '#808080',
        },
    },
}

-- =========================================================
-- 3. CURSOR
-- =========================================================
config.default_cursor_style = 'BlinkingUnderline'
config.cursor_blink_rate = 400
config.cursor_blink_ease_in = 'EaseIn'
config.cursor_blink_ease_out = 'EaseOut'

-- =========================================================
-- 4. VENTANA
-- =========================================================
config.window_decorations = "RESIZE"
config.integrated_title_button_style = "Windows"
config.window_background_opacity = 0.80
config.window_close_confirmation = "AlwaysPrompt" -- evita cerrar paneles con procesos vivos por accidente

-- Un poco de aire interno para que el texto no quede pegado al borde
config.window_padding = {
    left = 6,
    right = 6,
    top = 4,
    bottom = 4,
}

-- =========================================================
-- 5. PESTAÑAS
-- =========================================================
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local title = tab.active_pane.title
    local index = tab.tab_index + 1

    -- Iconos Nerd Font por defecto
    local status_icon = '| 󰄰' -- Círculo vacío (sin novedades)
    local status_color = '#666666'

    for _, pane in ipairs(tab.panes) do
        if pane.has_unseen_output then
            local proc = pane.foreground_process_name or ''
            if proc:find('pwsh') then
                status_icon = '| 󰄯' -- Logo de PowerShell + Icono de alerta/salida
                status_color = '#9e1c1c' -- Rojo
                break
            else
                status_icon = '| 󰄯' -- Check/Punto lleno
                status_color = '#179937' -- Verde
            end
        end
    end

    return {
        { Text = string.format('  %d: %s ', index, title) },
        { Foreground = { Color = status_color } },
        { Text = status_icon .. '  ' },
    }
end)

-- =========================================================
-- 6. BARRA DE ESTADO (esquina derecha del tab bar)
-- =========================================================
wezterm.on('update-status', function(window, pane)
    local workspace = window:active_workspace()
    local pid_status = ''

    local info = pane:get_foreground_process_info()
    if info then
        -- El nombre del ejecutable es el primer elemento de argv
        local exe = info.argv[1] or ''
        local exe_name = exe:gsub('(.*[/\\])(.*)', '%2') -- se queda solo con el nombre, sin la ruta completa

        -- Solo mostramos el PID si hay algo corriendo que NO sea el shell inactivo
        if not exe_name:find('pwsh') then
            pid_status = '  󰛸 ' .. exe_name .. ' (PID ' .. info.pid .. ')'
        end
    end

    window:set_right_status(wezterm.format({
        { Foreground = { Color = '#5C8374' } },
        { Text = '  ' .. workspace .. pid_status .. '  ' },
    }))
end)

-- =========================================================
-- 7. PROGRAMA POR DEFECTO
-- =========================================================
config.default_prog = { 'pwsh.exe' }

-- =========================================================
-- 8. LEADER KEY (estilo tmux: prefijo antes de la acción)
-- =========================================================
-- Presionas Ctrl+a, sueltas, y luego la siguiente tecla (dentro de 1s)
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

-- =========================================================
-- 9. MENÚ DE BOTONES PROGRAMÁTICOS (launch_menu)
--    Ctrl+Shift+B abre un selector con tus comandos guardados
-- =========================================================
config.launch_menu = {
    {
        label = '󰽰  KINETIC Workspace',
        args = {
            'pwsh.exe', '-NoExit', '-Command',
            'cd C:\\Users\\osxar\\Documents\\iA_PROJECTS\\SINTETIZADOR-SOLIDJS; bun run dev'
        },
    },
    {
        label = '  PORTFOLIO Workspace',
        args = {
            'pwsh.exe', '-NoExit', '-Command',
            'cd C:\\Users\\osxar\\Documents\\webProjects\\portfolio; bun run dev'
        },
    },
    {
        label = '  Abrir wezterm.lua (app predeterminada)',
        args = {
            'pwsh.exe', '-NoExit', '-Command',
            'Invoke-Item "$env:USERPROFILE\\.wezterm.lua"',
        },
    },
    {
        label = '  Abrir starship.toml',
        args = {
            'pwsh.exe', '-NoExit', '-Command',
            'Invoke-Item "$env:USERPROFILE\\.config\\starship.toml"'
        },
    },
}

-- =========================================================
-- 10. MENÚ DE ATAJOS (lista + descripción, ejecuta la acción real)
--    A diferencia de launch_menu (que solo lanza comandos nuevos),
--    esto sí puede correr acciones internas de WezTerm como dividir
--    paneles, hacer zoom, etc. Se abre con Ctrl+Shift+K.
-- =========================================================
local shortcuts = {
    { id = 'split_v',    label = 'ALT+V           Dividir panel verticalmente',        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    { id = 'split_h',    label = 'ALT+H           Dividir panel horizontalmente',       action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { id = 'pane_left',  label = 'ALT+Flecha Izq  Ir al panel de la izquierda',         action = wezterm.action.ActivatePaneDirection 'Left' },
    { id = 'pane_right', label = 'ALT+Flecha Der  Ir al panel de la derecha',           action = wezterm.action.ActivatePaneDirection 'Right' },
    { id = 'pane_up',    label = 'ALT+Flecha Arr  Ir al panel de arriba',               action = wezterm.action.ActivatePaneDirection 'Up' },
    { id = 'pane_down',  label = 'ALT+Flecha Abj  Ir al panel de abajo',                action = wezterm.action.ActivatePaneDirection 'Down' },
    { id = 'pane_close', label = 'ALT+W           Cerrar el panel actual (con confirmación)', action = wezterm.action.CloseCurrentPane { confirm = true } },
    { id = 'pane_zoom',  label = 'ALT+Z           Maximizar/restaurar el panel actual', action = wezterm.action.TogglePaneZoomState },
    { id = 'tab_new',    label = 'ALT+T           Abrir una nueva pestaña',             action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
    { id = 'tab_next',   label = 'CTRL+Tab        Ir a la siguiente pestaña',           action = wezterm.action.ActivateTabRelative(1) },
    { id = 'tab_prev',   label = 'CTRL+SHIFT+Tab  Ir a la pestaña anterior',            action = wezterm.action.ActivateTabRelative(-1) },
    { id = 'fullscreen', label = 'ALT+Enter       Pantalla completa',                   action = wezterm.action.ToggleFullScreen },
    { id = 'clear',      label = 'CTRL+SHIFT+L    Limpiar el scrollback',               action = wezterm.action.ClearScrollback 'ScrollbackOnly' },
    { id = 'palette',    label = 'CTRL+SHIFT+P    Paleta de comandos de WezTerm',       action = wezterm.action.ActivateCommandPalette },
    { id = 'launcher',   label = 'CTRL+SHIFT+B    Menú de comandos (launch_menu)',      action = wezterm.action.ShowLauncherArgs { flags = 'LAUNCH_MENU_ITEMS' } },
}

-- Construimos la lista de "choices" que ve el InputSelector y una tabla
-- para recuperar la acción real a partir del id elegido.
local shortcut_choices = {}
local shortcut_action_by_id = {}
for _, s in ipairs(shortcuts) do
    table.insert(shortcut_choices, { id = s.id, label = s.label })
    shortcut_action_by_id[s.id] = s.action
end

-- =========================================================
-- 11. TECLAS
-- =========================================================
config.keys = {
    -- Generales
    { key = 'Enter', mods = 'ALT',        action = wezterm.action.ToggleFullScreen },
    { key = 'L',     mods = 'CTRL|SHIFT', action = wezterm.action.ClearScrollback 'ScrollbackOnly' },

    -- Paneles: crear
    { key = 'v', mods = 'ALT', action = wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' }) },
    { key = 'h', mods = 'ALT', action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },

    -- Paneles: navegar con ALT + flechas
    { key = 'LeftArrow',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
    { key = 'UpArrow',    mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = 'DownArrow',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },

    -- Paneles: cerrar / maximizar
    { key = 'w', mods = 'ALT', action = wezterm.action.CloseCurrentPane { confirm = true } },
    { key = 'z', mods = 'ALT', action = wezterm.action.TogglePaneZoomState },

    -- Pestañas: crear / navegar / cerrar
    { key = 't', mods = 'ALT', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
    { key = 'Tab', mods = 'CTRL', action = wezterm.action.ActivateTabRelative(1) },
    { key = 'Tab', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTabRelative(-1) },

    -- Abrir el menú de botones (launch_menu): comandos/programas
    { key = 'b', mods = 'CTRL|SHIFT', action = wezterm.action.ShowLauncherArgs { flags = 'LAUNCH_MENU_ITEMS' } },

    -- Abrir el menú de ATAJOS: lista con descripción, y al elegir uno, lo ejecuta
    {
        key = 'k',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.InputSelector {
            title = 'Atajos disponibles',
            choices = shortcut_choices,
            fuzzy = true,
            fuzzy_description = 'Buscar atajo: ',
            action = wezterm.action_callback(function(window, pane, id, label)
                if id and shortcut_action_by_id[id] then
                    window:perform_action(shortcut_action_by_id[id], pane)
                end
            end),
        },
    },

    -- Paleta de comandos general de WezTerm (buscar acciones por nombre)
    { key = 'p', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateCommandPalette },

    -- Redimensionar paneles usando LEADER (Ctrl+a) + flechas
    { key = 'LeftArrow',  mods = 'LEADER', action = wezterm.action.AdjustPaneSize { 'Left', 5 } },
    { key = 'RightArrow', mods = 'LEADER', action = wezterm.action.AdjustPaneSize { 'Right', 5 } },
    { key = 'UpArrow',    mods = 'LEADER', action = wezterm.action.AdjustPaneSize { 'Up', 5 } },
    { key = 'DownArrow',  mods = 'LEADER', action = wezterm.action.AdjustPaneSize { 'Down', 5 } },
}

-- =========================================================
-- 12. COMANDOS RÁPIDOS EN LA PALETA (Ctrl+Shift+P)
--     Aparecen junto a las acciones nativas de WezTerm, filtrables por texto
-- =========================================================
wezterm.on('augment-command-palette', function(window, pane)
    return {
        {
            brief = 'Docker: Levantar compose',
            action = wezterm.action.SendString('docker compose up -d\n'),
        },
        {
            brief = 'Git: status',
            action = wezterm.action.SendString('git status\n'),
        },
        {
            brief = 'Sistema: uso de disco',
            action = wezterm.action.SendString('Get-PSDrive -PSProvider FileSystem\n'),
        },
    }
end)

return config