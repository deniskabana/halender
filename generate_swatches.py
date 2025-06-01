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

def create_swatch_svg(hex_color, filename, size=50):
    """Create an SVG color swatch"""
    rgb = hex_to_rgb(hex_color)
    
    # Create a subtle border based on brightness
    brightness = sum(rgb) / 3
    border_color = "#000000" if brightness > 128 else "#666666"
    
    svg_content = f'''<svg width="{size}" height="{size}" xmlns="http://www.w3.org/2000/svg">
  <rect width="{size}" height="{size}" rx="8" ry="8" 
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
    
    # Color categories for organization
    color_categories = {
        'Syntax Colors': ['PURPLE', 'YELLOW', 'ORANGE', 'LIME', 'CYAN', 'SILVER', 'PINK', 'BLUE', 'BLUE2', 'GOLD', 'PURPLE2', 'WHITE', 'RED', 'RED2', 'GREEN'],
        'UI Colors': ['BG', 'SIDEBAR', 'FLOAT', 'BLACK', 'FG', 'TEXT', 'COMMENTS', 'SELECTION', 'CONTRAST', 'BORDER', 'LINE_NUMBERS', 'HIGHLIGHT', 'DISABLED', 'CURSOR', 'ACCENT'],
        'Status Colors': ['ERROR', 'WARNING', 'INFO', 'LINK']
    }
    
    markdown_content = "## Color Palette\n\n"
    
    for category, color_names in color_categories.items():
        markdown_content += f"### {category}\n\n"
        markdown_content += "| Color | Dark | Light | Variable Name |\n"
        markdown_content += "|-------|------|-------|---------------|\n"
        
        for color_name in color_names:
            dark_key = f"H_DARK_{color_name}"
            light_key = f"H_LIGHT_{color_name}"
            
            if dark_key in colors and light_key in colors:
                dark_color = colors[dark_key]
                light_color = colors[light_key]
                
                # Generate swatch files
                dark_swatch = f"assets/swatches/dark_{color_name.lower()}.svg"
                light_swatch = f"assets/swatches/light_{color_name.lower()}.svg"
                
                create_swatch_svg(dark_color, dark_swatch)
                create_swatch_svg(light_color, light_swatch)
                
                # Format color name nicely
                display_name = color_name.replace('_', ' ').title()
                if color_name.endswith('2'):
                    display_name = display_name[:-1] + ' 2'
                
                markdown_content += f"| **{display_name}** | ![{dark_color}]({dark_swatch}) `{dark_color}` | ![{light_color}]({light_swatch}) `{light_color}` | `{color_name}` |\n"
        
        markdown_content += "\n"
    
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