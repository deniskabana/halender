#!/usr/bin/env python3
"""
Generate iTerm2 color scheme from colors.sh
"""

import subprocess
import re

def hex_to_rgb_float(hex_color):
    """Convert hex color to RGB float values (0-1)"""
    hex_color = hex_color.lstrip('#')
    r = int(hex_color[0:2], 16) / 255.0
    g = int(hex_color[2:4], 16) / 255.0
    b = int(hex_color[4:6], 16) / 255.0
    return r, g, b

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

def generate_iterm_dict(name, hex_color):
    """Generate iTerm color dictionary XML"""
    r, g, b = hex_to_rgb_float(hex_color)
    return f"""	<key>{name}</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>{b}</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>{g}</real>
		<key>Red Component</key>
		<real>{r}</real>
	</dict>"""

def main():
    colors = get_colors()
    
    # Map colors to iTerm ANSI colors
    iterm_xml = '''<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>'''
    
    # ANSI colors
    iterm_xml += generate_iterm_dict("Ansi 0 Color", colors["H_DARK_SIDEBAR"])
    iterm_xml += generate_iterm_dict("Ansi 1 Color", colors["H_DARK_RED"])
    iterm_xml += generate_iterm_dict("Ansi 2 Color", colors["H_DARK_LIME"])
    iterm_xml += generate_iterm_dict("Ansi 3 Color", colors["H_DARK_YELLOW"])
    iterm_xml += generate_iterm_dict("Ansi 4 Color", colors["H_DARK_LINK"])
    iterm_xml += generate_iterm_dict("Ansi 5 Color", colors["H_DARK_PURPLE"])
    iterm_xml += generate_iterm_dict("Ansi 6 Color", colors["H_DARK_CYAN"])
    iterm_xml += generate_iterm_dict("Ansi 7 Color", colors["H_DARK_FG"])
    iterm_xml += generate_iterm_dict("Ansi 8 Color", colors["H_DARK_COMMENTS"])
    iterm_xml += generate_iterm_dict("Ansi 9 Color", colors["H_DARK_RED"])
    iterm_xml += generate_iterm_dict("Ansi 10 Color", colors["H_DARK_LIME"])
    iterm_xml += generate_iterm_dict("Ansi 11 Color", colors["H_DARK_YELLOW"])
    iterm_xml += generate_iterm_dict("Ansi 12 Color", colors["H_DARK_LINK"])
    iterm_xml += generate_iterm_dict("Ansi 13 Color", colors["H_DARK_PURPLE"])
    iterm_xml += generate_iterm_dict("Ansi 14 Color", colors["H_DARK_CYAN"])
    iterm_xml += generate_iterm_dict("Ansi 15 Color", colors["H_DARK_COMMENTS"])
    
    # Basic colors
    iterm_xml += generate_iterm_dict("Background Color", colors["H_DARK_BG"])
    iterm_xml += generate_iterm_dict("Bold Color", colors["H_DARK_FG"])
    iterm_xml += generate_iterm_dict("Cursor Color", colors["H_DARK_CURSOR"])
    iterm_xml += generate_iterm_dict("Cursor Text Color", colors["H_DARK_BG"])
    iterm_xml += generate_iterm_dict("Foreground Color", colors["H_DARK_FG"])
    iterm_xml += generate_iterm_dict("Link Color", colors["H_DARK_LINK"])
    iterm_xml += generate_iterm_dict("Selected Text Color", colors["H_DARK_BG"])
    iterm_xml += generate_iterm_dict("Selection Color", colors["H_DARK_PURPLE"])
    
    # Add badge color (with alpha)
    r, g, b = hex_to_rgb_float(colors["H_DARK_YELLOW"])
    iterm_xml += f"""	<key>Badge Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>0.5</real>
		<key>Blue Component</key>
		<real>{b}</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>{g}</real>
		<key>Red Component</key>
		<real>{r}</real>
	</dict>"""
    
    # Add cursor guide color (with alpha)
    r, g, b = hex_to_rgb_float(colors["H_DARK_SELECTION"])
    iterm_xml += f"""	<key>Cursor Guide Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>0.25</real>
		<key>Blue Component</key>
		<real>{b}</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>{g}</real>
		<key>Red Component</key>
		<real>{r}</real>
	</dict>"""
    
    iterm_xml += '''
</dict>
</plist>'''
    
    with open('terminal/Halender.itermcolors', 'w') as f:
        f.write(iterm_xml)
    
    print("  📄 Generated terminal/Halender.itermcolors")

if __name__ == "__main__":
    main()