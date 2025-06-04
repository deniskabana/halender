#!/bin/bash
# Halender Theme Generator
# Generates all theme files from templates using colors.sh as source of truth

set -e

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Source the colors
source ./colors.sh

echo "🎨 Generating Halender themes..."

# Function to replace placeholders in a template file
generate_from_template() {
  local template_file="$1"
  local output_file="$2"

  if [[ ! -f "$template_file" ]]; then
    echo "❌ Template file not found: $template_file"
    return 1
  fi

  echo "  📄 Generating $output_file"

  # Start with the template content
  cp "$template_file" "$output_file"

  # Replace all color placeholders
  # Dark theme colors
  sed -i '' "s/@@H_DARK_PURPLE@@/$H_DARK_PURPLE/g" "$output_file"
  sed -i '' "s/@@H_DARK_YELLOW@@/$H_DARK_YELLOW/g" "$output_file"
  sed -i '' "s/@@H_DARK_ORANGE@@/$H_DARK_ORANGE/g" "$output_file"
  sed -i '' "s/@@H_DARK_LIME@@/$H_DARK_LIME/g" "$output_file"
  sed -i '' "s/@@H_DARK_CYAN@@/$H_DARK_CYAN/g" "$output_file"
  sed -i '' "s/@@H_DARK_SILVER@@/$H_DARK_SILVER/g" "$output_file"
  sed -i '' "s/@@H_DARK_PINK@@/$H_DARK_PINK/g" "$output_file"
  sed -i '' "s/@@H_DARK_BLUE@@/$H_DARK_BLUE/g" "$output_file"
  sed -i '' "s/@@H_DARK_BLUE2@@/$H_DARK_BLUE2/g" "$output_file"
  sed -i '' "s/@@H_DARK_GOLD@@/$H_DARK_GOLD/g" "$output_file"
  sed -i '' "s/@@H_DARK_PURPLE2@@/$H_DARK_PURPLE2/g" "$output_file"
  sed -i '' "s/@@H_DARK_WHITE@@/$H_DARK_WHITE/g" "$output_file"
  sed -i '' "s/@@H_DARK_RED@@/$H_DARK_RED/g" "$output_file"
  sed -i '' "s/@@H_DARK_RED2@@/$H_DARK_RED2/g" "$output_file"
  sed -i '' "s/@@H_DARK_GREEN@@/$H_DARK_GREEN/g" "$output_file"
  sed -i '' "s/@@H_DARK_BG@@/$H_DARK_BG/g" "$output_file"
  sed -i '' "s/@@H_DARK_SIDEBAR@@/$H_DARK_SIDEBAR/g" "$output_file"
  sed -i '' "s/@@H_DARK_FLOAT@@/$H_DARK_FLOAT/g" "$output_file"
  sed -i '' "s/@@H_DARK_BLACK@@/$H_DARK_BLACK/g" "$output_file"
  sed -i '' "s/@@H_DARK_FG@@/$H_DARK_FG/g" "$output_file"
  sed -i '' "s/@@H_DARK_TEXT@@/$H_DARK_TEXT/g" "$output_file"
  sed -i '' "s/@@H_DARK_COMMENTS@@/$H_DARK_COMMENTS/g" "$output_file"
  sed -i '' "s/@@H_DARK_SELECTION@@/$H_DARK_SELECTION/g" "$output_file"
  sed -i '' "s/@@H_DARK_CONTRAST@@/$H_DARK_CONTRAST/g" "$output_file"
  sed -i '' "s/@@H_DARK_BORDER@@/$H_DARK_BORDER/g" "$output_file"
  sed -i '' "s/@@H_DARK_LINE_NUMBERS@@/$H_DARK_LINE_NUMBERS/g" "$output_file"
  sed -i '' "s/@@H_DARK_HIGHLIGHT@@/$H_DARK_HIGHLIGHT/g" "$output_file"
  sed -i '' "s/@@H_DARK_DISABLED@@/$H_DARK_DISABLED/g" "$output_file"
  sed -i '' "s/@@H_DARK_CURSOR@@/$H_DARK_CURSOR/g" "$output_file"
  sed -i '' "s/@@H_DARK_ACCENT@@/$H_DARK_ACCENT/g" "$output_file"
  sed -i '' "s/@@H_DARK_ERROR@@/$H_DARK_ERROR/g" "$output_file"
  sed -i '' "s/@@H_DARK_WARNING@@/$H_DARK_WARNING/g" "$output_file"
  sed -i '' "s/@@H_DARK_INFO@@/$H_DARK_INFO/g" "$output_file"
  sed -i '' "s/@@H_DARK_LINK@@/$H_DARK_LINK/g" "$output_file"

  # Light theme colors
  sed -i '' "s/@@H_LIGHT_PURPLE@@/$H_LIGHT_PURPLE/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_YELLOW@@/$H_LIGHT_YELLOW/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_ORANGE@@/$H_LIGHT_ORANGE/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_LIME@@/$H_LIGHT_LIME/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_CYAN@@/$H_LIGHT_CYAN/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_SILVER@@/$H_LIGHT_SILVER/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_PINK@@/$H_LIGHT_PINK/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_BLUE@@/$H_LIGHT_BLUE/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_BLUE2@@/$H_LIGHT_BLUE2/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_GOLD@@/$H_LIGHT_GOLD/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_PURPLE2@@/$H_LIGHT_PURPLE2/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_WHITE@@/$H_LIGHT_WHITE/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_RED@@/$H_LIGHT_RED/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_RED2@@/$H_LIGHT_RED2/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_GREEN@@/$H_LIGHT_GREEN/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_BG@@/$H_LIGHT_BG/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_SIDEBAR@@/$H_LIGHT_SIDEBAR/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_FLOAT@@/$H_LIGHT_FLOAT/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_BLACK@@/$H_LIGHT_BLACK/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_FG@@/$H_LIGHT_FG/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_TEXT@@/$H_LIGHT_TEXT/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_COMMENTS@@/$H_LIGHT_COMMENTS/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_SELECTION@@/$H_LIGHT_SELECTION/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_CONTRAST@@/$H_LIGHT_CONTRAST/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_BORDER@@/$H_LIGHT_BORDER/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_LINE_NUMBERS@@/$H_LIGHT_LINE_NUMBERS/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_HIGHLIGHT@@/$H_LIGHT_HIGHLIGHT/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_DISABLED@@/$H_LIGHT_DISABLED/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_CURSOR@@/$H_LIGHT_CURSOR/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_ACCENT@@/$H_LIGHT_ACCENT/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_ERROR@@/$H_LIGHT_ERROR/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_WARNING@@/$H_LIGHT_WARNING/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_INFO@@/$H_LIGHT_INFO/g" "$output_file"
  sed -i '' "s/@@H_LIGHT_LINK@@/$H_LIGHT_LINK/g" "$output_file"
}

# Generate CSS file
generate_from_template "playground/css/syntax.css.template" "playground/css/syntax.css"

# Generate terminal theme files
generate_from_template "terminal/Halender.ghostty.conf.template" "terminal/Halender.ghostty.conf"
generate_from_template "terminal/Halender.kitty.conf.template" "terminal/Halender.kitty.conf"

# Generate iTerm colors, Apple Terminal, and swatches using Python scripts
if command -v python3 &>/dev/null; then
  python3 generate_iterm.py
  python3 generate_apple_terminal.py
  python3 generate_swatches.py
else
  echo "  ⚠️  Python3 not found, skipping iTerm, Apple Terminal, and swatch generation"
fi

echo "✅ All themes generated successfully!"
echo ""
echo "Generated files:"
echo "  📄 playground/css/syntax.css"
echo "  🖥️  terminal/Halender.ghostty.conf"
echo "  🖥️  terminal/Halender.kitty.conf"
echo "  🖥️  terminal/Halender.itermcolors"
echo "  🖥️  terminal/Halender.terminal (Apple Terminal)"
echo "  🎨 docs/colors.md (color palette documentation)"
echo "  🎨 assets/swatches/*.svg (color swatch images)"
echo ""
echo "To update colors, edit colors.sh and run ./generate.sh again"

