#!/usr/bin/env python3
"""
Generate Apple Terminal theme (.terminal file) from colors.sh
Note: This creates a simplified version suitable for import
"""

import subprocess
import base64
import struct
import xml.etree.ElementTree as ET
from xml.dom import minidom

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

def hex_to_rgb_float(hex_color):
    """Convert hex color to RGB float values (0-1)"""
    hex_color = hex_color.lstrip('#')
    r = int(hex_color[0:2], 16) / 255.0
    g = int(hex_color[2:4], 16) / 255.0
    b = int(hex_color[4:6], 16) / 255.0
    return r, g, b

def create_nscolor_data(r, g, b, alpha=1.0):
    """Create NSColor archived data for Apple Terminal
    
    This creates a simplified NSColor archive that Terminal.app can read.
    The format is based on NSKeyedArchiver with specific structure for NSColor.
    """
    
    # This is a simplified approach - we'll create a basic sRGB color
    # The exact format is complex, but this should work for basic colors
    
    # Create the color description string
    color_desc = f"{r} {g} {b} {alpha}"
    
    # Create a minimal plist structure that Terminal can understand
    # This is a simplified version - the full NSKeyedArchiver format is very complex
    plist_data = f'''bplist00\\x81\\x01\\x02\\x03\\x04\\x05\\x06\\x07\\x08\\x09\\x0a\\x0bX$versionT$topY$archiverX$objects\\x12\\x00\\x01\\x86\\xa0_\\x10\\x0fNSKeyedArchiver\\xd1\\x08\\tTroot\\x80\\x01\\xa3\\x0b\\x0c\\x13U$null\\xd3\\r\\x0e\\x0f\\x10\\x11\\x12UNSRGB\\\\NSColorSpaceV$class\\x4f\\x10'{color_desc}\\x00\\x10\\x02\\x80\\x02\\x80\\x04\\xd2\\x14\\x15\\x16\\x17Z$classnameX$classesWNSColor\\xa2\\x16\\x18XNSObject\\x00\\x08\\x11\\x1a$)27ILQSWdpx\\x7e\\x8b\\xa0\\xa7\\xc7\\xf1\\xf3\\xf5\\xf7\\xfe\\x01\\x03\\x01\\t\\x01\\x0b\\x01\\r\\x01\\x0f\\x0d[\\r`\\rk\\rt\\r\\x81\\r\\x84\\r\\x91\\r\\x9a\\r\\x9f\\r\\xa7\\x00\\x00\\x00\\x00\\x00\\x00\\x02\\x01\\x00\\x00\\x00\\x00\\x00\\x00\\x00(\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\r\\xaa'''.encode('latin-1')
    
    return base64.b64encode(plist_data).decode('ascii')

def generate_simple_apple_terminal():
    """Generate a simplified Apple Terminal theme using standard color format"""
    colors = get_colors()
    
    # Create the root plist
    root = ET.Element('plist', version='1.0')
    dict_elem = ET.SubElement(root, 'dict')
    
    # Color mappings for Apple Terminal
    color_mappings = {
        'ANSIBlackColor': colors['H_DARK_SIDEBAR'],
        'ANSIRedColor': colors['H_DARK_RED'],
        'ANSIGreenColor': colors['H_DARK_LIME'],
        'ANSIYellowColor': colors['H_DARK_YELLOW'],
        'ANSIBlueColor': colors['H_DARK_LINK'],
        'ANSIMagentaColor': colors['H_DARK_PURPLE'],
        'ANSICyanColor': colors['H_DARK_CYAN'],
        'ANSIWhiteColor': colors['H_DARK_FG'],
        'ANSIBrightBlackColor': colors['H_DARK_COMMENTS'],
        'ANSIBrightRedColor': colors['H_DARK_RED'],
        'ANSIBrightGreenColor': colors['H_DARK_LIME'],
        'ANSIBrightYellowColor': colors['H_DARK_YELLOW'],
        'ANSIBrightBlueColor': colors['H_DARK_LINK'],
        'ANSIBrightMagentaColor': colors['H_DARK_PURPLE'],
        'ANSIBrightCyanColor': colors['H_DARK_CYAN'],
        'ANSIBrightWhiteColor': colors['H_DARK_FG'],
        'BackgroundColor': colors['H_DARK_BG'],
        'TextColor': colors['H_DARK_FG'],
        'CursorColor': colors['H_DARK_CURSOR'],
        'SelectionColor': colors['H_DARK_SELECTION'],
    }
    
    # Add each color to the plist
    for color_name, hex_color in color_mappings.items():
        r, g, b = hex_to_rgb_float(hex_color)
        
        # Add key
        key_elem = ET.SubElement(dict_elem, 'key')
        key_elem.text = color_name
        
        # For now, we'll use a simple approach with real values
        # This won't be as complex as the original but should work
        dict_color = ET.SubElement(dict_elem, 'dict')
        
        # Alpha Component
        alpha_key = ET.SubElement(dict_color, 'key')
        alpha_key.text = 'Alpha Component'
        alpha_real = ET.SubElement(dict_color, 'real')
        alpha_real.text = '1'
        
        # Blue Component
        blue_key = ET.SubElement(dict_color, 'key')
        blue_key.text = 'Blue Component'
        blue_real = ET.SubElement(dict_color, 'real')
        blue_real.text = str(b)
        
        # Color Space
        space_key = ET.SubElement(dict_color, 'key')
        space_key.text = 'Color Space'
        space_string = ET.SubElement(dict_color, 'string')
        space_string.text = 'sRGB'
        
        # Green Component
        green_key = ET.SubElement(dict_color, 'key')
        green_key.text = 'Green Component'
        green_real = ET.SubElement(dict_color, 'real')
        green_real.text = str(g)
        
        # Red Component
        red_key = ET.SubElement(dict_color, 'key')
        red_key.text = 'Red Component'
        red_real = ET.SubElement(dict_color, 'real')
        red_real.text = str(r)
    
    # Add some basic terminal settings
    settings = {
        'name': 'Halender',
        'type': 'Window Settings',
        'FontSize': '12',
        'FontName': 'SF Mono',
    }
    
    for setting_name, setting_value in settings.items():
        key_elem = ET.SubElement(dict_elem, 'key')
        key_elem.text = setting_name
        if setting_name in ['FontSize']:
            value_elem = ET.SubElement(dict_elem, 'real')
        else:
            value_elem = ET.SubElement(dict_elem, 'string')
        value_elem.text = setting_value
    
    # Create the XML string
    xml_str = ET.tostring(root, encoding='unicode')
    
    # Add the DOCTYPE and format nicely
    formatted_xml = f'''<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
{xml_str}'''
    
    # Pretty print the XML
    dom = minidom.parseString(formatted_xml)
    return dom.toprettyxml(indent='\\t').replace('<?xml version="1.0" ?>\\n', '')

def main():
    """Generate Apple Terminal theme"""
    print("🖥️  Generating Apple Terminal theme...")
    
    try:
        # Generate the terminal file
        terminal_content = generate_simple_apple_terminal()
        
        # Write to file
        output_path = 'terminal/Halender.terminal'
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(terminal_content)
        
        print(f"  📄 Generated {output_path}")
        
    except Exception as e:
        print(f"❌ Error generating Apple Terminal theme: {e}")
        return 1
    
    return 0

if __name__ == "__main__":
    exit(main())