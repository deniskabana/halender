#!/usr/bin/env python3
"""
Generate color swatch images and markdown table for Halender theme documentation
"""

import subprocess
import os
from pathlib import Path

def get_colors():
    """Get colors from colors.sh by sourcing it"""
    result = subprocess.run(['bash', '-c', 'source ./colors.sh && env | grep "^H_"'], 
                          capture_output=True, text=True)
    colors = {}
    for line in result.stdout.strip().split('\n'):
        if '=' in line:
            key, value = line.split('=', 1)
            colors[key] = value
    return colors

def hex_to_rgb(hex_color):
    """Convert hex color to RGB tuple"""
    hex_color = hex_color.lstrip('#')
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

def create_swatch_svg(hex_color, filename, size=32):
    """Create an SVG color swatch"""
    rgb = hex_to_rgb(hex_color)
    
    # Create a subtle border based on brightness
    brightness = sum(rgb) / 3
    border_color = "#000000" if brightness > 128 else "#666666"
    
    svg_content = f'''<svg width="{size}" height="{size}" xmlns="http://www.w3.org/2000/svg">
  <rect width="{size}" height="{size}" rx="4" ry="4" 
        fill="{hex_color}" 
        stroke="{border_color}" 
        stroke-width="1" 
        stroke-opacity="0.2"/>
</svg>'''
    
    with open(filename, 'w') as f:
        f.write(svg_content)

def generate_color_table():
    """Generate markdown table with color swatches"""
    colors = get_colors()
    
    # Create swatches directory
    swatches_dir = Path('assets/swatches')
    swatches_dir.mkdir(parents=True, exist_ok=True)
    
    # Define unique colors with their purposes and categorization
    # Format: (color_name, purpose, category, references_to_other_colors)
    color_definitions = [
        # Syntax/Text Colors
        ('PURPLE', 'Keywords, constants, booleans', 'syntax', []),
        ('YELLOW', 'Functions, classes', 'syntax', []),
        ('ORANGE', 'Operators, constants', 'syntax', []),
        ('LIME', 'Strings, markdown headings', 'syntax', []),
        ('CYAN', 'Variables, special keywords', 'syntax', []),
        ('SILVER', 'Property names, tags', 'syntax', []),
        ('PINK', 'Punctuation, brackets', 'syntax', []),
        ('BLUE', 'Types, properties', 'syntax', []),
        ('BLUE2', 'Rainbow parentheses', 'syntax', []),
        ('GOLD', 'Template literals, operators', 'syntax', []),
        ('PURPLE2', 'Import/export keywords', 'syntax', []),
        ('WHITE', 'Standout text', 'syntax', []),
        ('RED', 'Passive errors, reminders', 'syntax', []),
        ('RED2', 'Critical errors', 'syntax', []),
        ('GREEN', 'Success states', 'syntax', []),
        
        # UI Colors
        ('BG', 'Main background', 'ui', []),
        ('SIDEBAR', 'Sidebar background', 'ui', []),
        ('FLOAT', 'Floating window background', 'ui', ['SIDEBAR']),
        ('BLACK', 'Deepest background', 'ui', []),
        ('FG', 'Primary text', 'ui', []),
        ('TEXT', 'Secondary text', 'ui', []),
        ('COMMENTS', 'Comments, muted text', 'ui', []),
        ('SELECTION', 'Text selection', 'ui', []),
        ('CONTRAST', 'High contrast background', 'ui', ['SIDEBAR']),
        ('BORDER', 'Borders, separators', 'ui', []),
        ('LINE_NUMBERS', 'Line numbers', 'ui', ['BORDER']),
        ('HIGHLIGHT', 'Current line highlight', 'ui', ['SELECTION']),
        ('DISABLED', 'Disabled elements', 'ui', ['BORDER']),
        ('CURSOR', 'Cursor color', 'ui', ['PINK']),
        ('ACCENT', 'Accent color', 'ui', ['YELLOW']),
        ('ERROR', 'Error indicators', 'ui', []),
        ('WARNING', 'Warning indicators', 'ui', ['GOLD']),
        ('INFO', 'Info indicators', 'ui', ['CYAN']),
        ('LINK', 'Links, URLs', 'ui', []),
    ]
    
    markdown_content = "## Color Palette\n\n"
    
    # Generate separate sections for dark and light themes
    for theme in ['dark', 'light']:
        theme_title = "Dark Theme" if theme == 'dark' else "Light Theme"
        markdown_content += f"<details>\n<summary><h3>{theme_title}</h3></summary>\n\n"
        
        # Group colors by category
        syntax_colors = [c for c in color_definitions if c[2] == 'syntax']
        ui_colors = [c for c in color_definitions if c[2] == 'ui']
        
        for category_name, color_list in [("Syntax & Text Colors", syntax_colors), ("UI Colors", ui_colors)]:
            markdown_content += f"#### {category_name}\n\n"
            markdown_content += "| Swatch | Name | Hex | Variable | Purpose |\n"
            markdown_content += "|--------|------|-----|----------|----------|\n"
            
            for color_name, purpose, category, references in color_list:
                theme_key = f"H_{theme.upper()}_{color_name}"
                
                if theme_key in colors:
                    hex_color = colors[theme_key]
                    
                    # Check if this color is referenced by others (skip if it's a duplicate)
                    is_referenced = any(color_name in ref_list for _, _, _, ref_list in color_definitions)
                    if is_referenced and references:
                        # This is a duplicate, show reference instead
                        ref_name = references[0] if references else color_name
                        purpose_text = f"Same as {ref_name.title()}"
                        continue  # Skip duplicate colors
                    
                    # Generate swatch file
                    swatch_filename = f"assets/swatches/{theme}_{color_name.lower()}.svg"
                    create_swatch_svg(hex_color, swatch_filename)
                    swatch_url = f"/{swatch_filename}"
                    
                    # Format display name
                    display_name = color_name.replace('_', ' ').title()
                    if color_name.endswith('2'):
                        display_name = display_name[:-1] + ' 2'
                    
                    # Add references to purpose if they exist
                    if references:
                        ref_text = ", ".join([ref.title() for ref in references])
                        purpose_with_refs = f"{purpose} (uses {ref_text})"
                    else:
                        purpose_with_refs = purpose
                    
                    markdown_content += f"| ![{hex_color}]({swatch_url}) | **{display_name}** | `{hex_color}` | `{color_name}` | {purpose_with_refs} |\n"
            
            markdown_content += "\n"
        
        markdown_content += "</details>\n\n"
    
    return markdown_content

def main():
    """Generate color swatches and documentation"""
    print("🎨 Generating color swatches...")
    
    try:
        # Generate the color table
        table_content = generate_color_table()
        
        # Write to file
        with open('docs/colors.md', 'w') as f:
            f.write(table_content)
        
        print("  📄 Generated docs/colors.md")
        print("  🎨 Generated color swatch SVGs in assets/swatches/")
        
        # Count generated files
        swatches_dir = Path('assets/swatches')
        swatch_count = len(list(swatches_dir.glob('*.svg'))) if swatches_dir.exists() else 0
        print(f"  ✅ Created {swatch_count} color swatches")
        
    except Exception as e:
        print(f"❌ Error generating swatches: {e}")
        return 1
    
    return 0

if __name__ == "__main__":
    exit(main())