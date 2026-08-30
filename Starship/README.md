# Configuración de Starship

Documentación del archivo `starship.toml`, el prompt personalizado para la terminal usando [Starship](https://starship.rs/).

## Opciones generales

|Opción|Valor|Descripción|
|---|---|---|
|`add_newline`|`false`|No inserta línea en blanco antes del prompt.|
|`format`|ver abajo|Define el diseño del prompt principal (izquierda).|
|`right_format`|`$cmd_duration`|Muestra la duración del último comando en el lado derecho.|

### Estructura del prompt (`format`)

```
╭─usuario@host directorio rama-git estado-git
╰─❯
```

- **Línea 1:** usuario, hostname, directorio actual, rama de Git y estado de Git.
- **Línea 2:** símbolo `❯` como indicador de entrada.

## Módulos activos

### `[username]`

Muestra el usuario actual siempre (`show_always = true`).

- Usuario normal: blanco en negrita.
- Root: rojo en negrita.

### `[hostname]`

Muestra el hostname también fuera de sesiones SSH (`ssh_only = false`).

- Formato: `@hostname` en blanco tenue.

### `[directory]`

Muestra el directorio actual.

- Color: cian en negrita.
- Trunca a los últimos 3 directorios (`truncation_length = 3`).
- No trunca a la raíz del repo Git (`truncate_to_repo = false`).
- El símbolo `~` representa el home.

### `[git_branch]`

Muestra la rama de Git activa con el símbolo .

### `[git_status]`

Muestra el estado del repositorio Git (color amarillo), con símbolos para:

|Estado|Símbolo|
|---|---|
|Conflictos|``|
|Adelante (ahead)|``|
|Atrás (behind)|``|
|Divergente|`/`|
|Sin seguimiento (untracked)|``|
|Guardado (stash)|`󰆓`|
|Modificado|``|
|En stage|``|
|Renombrado|`󰁕`|
|Eliminado|``|

### `[cmd_duration]`

Muestra la duración de comandos que tarden **2 segundos o más** (`min_time = 2000`), incluyendo milisegundos.

## Módulos desactivados

Los siguientes módulos están explícitamente deshabilitados (`disabled = true`) para mantener el prompt limpio:

`package`, `nodejs`, `python`, `rust`, `golang`, `php`, `java`, `docker_context`, `conda`, `aws`, `gcloud`, `azure`, `terraform`, `kubernetes`, `memory_usage`, `time`

## Requisitos

- [Starship](https://starship.rs/) instalado.
- Fuente [Nerd Font](https://www.nerdfonts.com/) para renderizar correctamente los íconos/símbolos.

## Ubicación del archivo

Colocar el archivo como `~/.config/starship.toml`.