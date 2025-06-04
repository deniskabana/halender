# Development Documentation

> [!CAUTION]
> This section of the docs is under construction.

## playground

The playground is simply said a website. For now it's a showcase of the theme on a code and it supports CSS variable modification to allow live theme and options switching.

_Note: This will probably be switched out for live Monaco editor with the theme applied in the future once VSCode theme is ready to be shipped._

## Theme Generation System

**Halender uses a centralized color generation system.** This makes maintaining multiple ports possible on short time. Adding any port also means adding an option to generate a new theme file for it.

### Source of Truth

> [!IMPORTANT]
> TODO: A different approach for storing the palette. Ideally alongside meta, like csv or json.

All colors are defined in `colors.sh` which exports environment variables for all theme colors:

```bash
# Dark theme colors
export H_DARK_PURPLE="#c3a6ff"
export H_DARK_YELLOW="#ffd580"
# ... more colors
```

### Generating Themes

> [!CAUTION]
> TODO: Generating and managing themes needs to be more consistent and predictable.

**Pre-requisites:** `bash` and `python 3.9`

To generate all theme files from the color definitions:

```bash
./generate.sh
```

This will generate:

- 🖥️ Web Playground CSS in `dev/playground/css/syntax.css`
- 📚 Documentation (repo docs)
  - Color palette documentation in `docs/colors.md` **TODO: Consider moving to main README.md**
  - Color swatch images in `assets/swatches`
- 🛠️ Editor themes
  - Neovim in `editors/nvim`
- 📟 Terminal themes
  - Ghostty in `terminals/ghostty`
  - Kitty in `terminals/kitty`
  - iTerm2 in `terminals/iterm2`
  - Apple Terminal in `terminals/apple-terminal`
