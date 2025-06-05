const fs = require("fs");
const path = require("path");

// ==================================================
// IMPLEMENTATION
// ==================================================

const name = "generate-swatches";

async function init() {
  const paletteDark = require(path.join(__dirname, "../../../palette.dark.json"));
  const paletteLight = require(path.join(__dirname, "../../../palette.light.json"));
  const outputDir = path.join(__dirname, "../../../assets/swatches/");

  // Clear out output dir before exporting
  fs.readdirSync(outputDir).forEach(file => fs.rmSync(`${outputDir}/${file}`));

  // Generate SVG
  const size = 20;
  const radius = 6;
  const borderColor = "#666666"

  paletteDark.forEach(color => {
    let svg = `<svg width="${size}" height="${size}" xmlns="http://www.w3.org/2000/svg">\n`;
    svg += `  <rect width="${size}" height="${size}" ry="${radius}" rx="${radius}" fill="${color.hex}" stroke="${borderColor}" stroke-width="1" />\n`;
    svg += `</svg>`;
    fs.writeFileSync(path.join(outputDir, `${color.name}_dark.svg`), svg);
  });
  paletteLight.forEach(color => {
    let svg = `<svg width="${size}" height="${size}" xmlns="http://www.w3.org/2000/svg">\n`;
    svg += `  <rect width="${size}" height="${size}" ry="${radius}" rx="${radius}" fill="${color.hex}" stroke="${borderColor}" stroke-width="1" />\n`;
    svg += `</svg>`;
    fs.writeFileSync(path.join(outputDir, `${color.name}_light.svg`), svg);
  });

  return `${paletteDark.length + paletteLight.length} swatches created in ${outputDir}`;
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
