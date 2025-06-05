const fs = require("fs");
const path = require("path");

// ==================================================
// IMPLEMENTATION
// ==================================================

const name = "generate-palette-stripe";

async function init() {
  // Load your palette JSON
  const palette = require(path.join(__dirname, "../../../palette.dark.json"));
  // Output file (static path intentional)
  const outputPath = path.join(__dirname, "../../../assets/docs/palette-stripe.svg");

  // Filter for accent colors
  const accentColors = palette.filter(({ group }) => group === "accent");

  // Allow sorting by hue
  function hexToHSL(hex) {
    let r = parseInt(hex.slice(1, 3), 16) / 255;
    let g = parseInt(hex.slice(3, 5), 16) / 255;
    let b = parseInt(hex.slice(5, 7), 16) / 255;

    let max = Math.max(r, g, b), min = Math.min(r, g, b);
    let h, s, l = (max + min) / 2;

    if (max === min) {
      h = s = 0;
    } else {
      let d = max - min;
      s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
      switch (max) {
        case r: h = ((g - b) / d + (g < b ? 6 : 0)); break;
        case g: h = ((b - r) / d + 2); break;
        case b: h = ((r - g) / d + 4); break;
      }
      h *= 60;
    }
    return h;
  }
  // Sort by hue (for human viewing pleasure)
  accentColors.sort((a, b) => hexToHSL(a.hex) - hexToHSL(b.hex));

  // Generate SVG
  const width = 400;
  const height = 10;
  const segmentWidth = width / accentColors.length;

  let svg = `<svg width="${width}" height="${height}" xmlns="http://www.w3.org/2000/svg">\n`;

  accentColors.forEach((color, i) => {
    const x = i * segmentWidth;
    svg += `  <rect x="${x}" y="0" width="${segmentWidth}" height="${height}" fill="${color.hex}" />\n`;
  });

  svg += `</svg>`;

  fs.writeFileSync(outputPath, svg);
  return outputPath; // Returned output is consoled for the user confirmation
}

// ==================================================
// EXECUTION
// ==================================================

(async function () {
  const isVerbose = process.argv.includes("--verbose");

  try {
    console.log(`[${name}] ✅ Success!`, await init());
  } catch (e) {
    if (isVerbose) console.error(`[${name}] ❌ Error!`, e);
    else console.error(`[${name}] ❌ Error! Use --verbose flag for details.`);
  }
})()
