> !CAUTION
> This section is still WIP.

## Theme Generation System

This repository uses a centralized color generation system that ensures consistency across all theme variants.

### Source of Truth

All colors are defined in `colors.sh` which exports environment variables for all theme colors:

> [!CAUTION]
> TODO: Better source of truth format, safer evaluation

```bash
# Dark theme colors
export H_DARK_PURPLE="#c3a6ff"
export H_DARK_YELLOW="#ffd580"
# ... more colors
```

### Generating Themes

To generate all theme files from the color definitions:

```bash
./generate.sh
```

This will generate:

- `playground/css/syntax.css` - CSS for web playground
- `terminal/Halender.ghostty.conf` - Ghostty terminal theme
- `terminal/HalenderKitty.conf` - Kitty terminal theme
- `terminal/Halender.itermcolors` - iTerm2 color scheme
- `terminal/Halender.terminal` - Apple Terminal theme
- `docs/colors.md` - Color palette documentation with swatches
- `assets/swatches/*.svg` - Individual color swatch images

### Adding New Themes

1. **Create a template file** with placeholder tokens like `@@H_DARK_PURPLE@@`
2. **Update `generate.sh`** to process your template
3. **Run `./generate.sh`** to generate the final theme file

> [!NOTE]
> For complex formats (like iTerm3's XML), consider creating a dedicated generator script (see `generate_iterm.py`).

## Development

Requires `bash` and `python3` for script execution.

### Development Workflow

1. Edit colors in `colors.sh`
2. Run `./generate.sh` to update all theme files
3. Test themes across different applications
4. Commit changes when satisfied
