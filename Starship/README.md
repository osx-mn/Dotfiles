# Configuración de Starship

Documentación del archivo `starship.toml`, el prompt personalizado para la terminal usando [Starship](https://starship.rs/).

## 1. Opciones generales

| Opción | Valor | Descripción |
|---|---|---|
| `add_newline` | `true` | Inserta una línea en blanco antes de cada nuevo prompt para mayor legibilidad. |
| `format` | *Ver desglose* | Define el diseño del prompt principal en dos líneas (izquierda). |
| `right_format` | `$cmd_duration` | Muestra la duración del último comando ejecutado en el extremo derecho. |

---

## 2. Estructura del prompt (`format`)

```
╭─  usuario@hostname │ directorio │ 󰊢 rama-git [estado-git]
╰─❯
```

- **Línea 1:** Ícono de sistema/usuario, nombre de usuario, hostname, separador, directorio actual, separador, rama Git y estado de sincronización / modificaciones.
- **Línea 2:** Prefijo conector `╰─` y símbolo `❯` como indicador de entrada.

---

## 3. Módulos activos

### `[username]`
Muestra el usuario actual en todo momento (`show_always = true`) precedido por el ícono ``.
- **Usuario estándar:** `bold white` (blanco en negrita).
- **Usuario root:** `bold red` (rojo en negrita).

### `[hostname]`
Muestra el hostname incluso fuera de sesiones SSH (`ssh_only = false`).
- **Formato:** `@hostname` en blanco tenue (`dimmed white`).

### `[directory]`
Ruta del directorio de trabajo actual.
- **Color:** `bold cyan` (cian en negrita).
- **Longitud de truncamiento:** `3` niveles de directorio (`truncation_length = 3`).
- **Truncamiento en repo Git:** `false` (mantiene la ruta relativa visible).
- **Símbolo de Home:** `~`.
- **Separador:** `│` en blanco tenue.

### `[git_branch]`
Muestra la rama activa de Git con el ícono `󰊢 `.
- **Color:** `dimmed white`.
- **Separador:** `│` en blanco tenue.

### `[git_status]`
Muestra el estado detallado del repositorio Git en color amarillo (`yellow`), indicando la cantidad de cambios:

| Estado | Símbolo | Descripción |
|---|---|---|
| Conflictos | `` | Archivos en conflicto de fusión |
| Adelante (*ahead*) | `` | Commits por delante del remoto |
| Atrás (*behind*) | `` | Commits por detrás del remoto |
| Divergente | `` | Commits adelante y atrás simultáneamente |
| Sin seguimiento (*untracked*) | `` | Nuevos archivos no rastreados |
| Guardado (*stash*) | `󰆓` | Cambios en el stash |
| Modificado | `` | Archivos modificados sin stage |
| En stage | `` | Archivos preparados para commit |
| Renombrado | `󰁕` | Archivos renombrados |
| Eliminado | `` | Archivos borrados |

### `[cmd_duration]`
Muestra la duración del comando en el extremo derecho si tarda **2 segundos o más** (`min_time = 2000`), incluyendo milisegundos (`show_milliseconds = true`).
- **Formato:** `│ <duración>` en blanco tenue.

---

## 4. Módulos desactivados

Para mantener un prompt rápido, limpio y minimalista, los siguientes módulos de lenguajes y servicios están explícitamente desactivados (`disabled = true`):

`package`, `nodejs`, `python`, `rust`, `golang`, `php`, `java`, `docker_context`, `conda`, `aws`, `gcloud`, `azure`, `terraform`, `kubernetes`, `memory_usage`, `time`

---

## 5. Requisitos

- [Starship](https://starship.rs/) instalado en el sistema.
- Fuente [Nerd Font](https://www.nerdfonts.com/) (como *JetBrainsMono Nerd Font*) para renderizar los glifos e íconos.

---

## 6. Ubicación del archivo

- **Linux / macOS:** `~/.config/starship.toml`
- **Windows:** `%USERPROFILE%\.config\starship.toml` (o `$HOME\.config\starship.toml` en PowerShell)