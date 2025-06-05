const fs = require("fs");
const path = require("path");

// ==================================================
// IMPLEMENTATION
// ==================================================

const name = "generate-swatches";

async function init() {
  const palette = require(path.join(__dirname, "../../../palette.dark.json"));
  const outputDir = path.join(__dirname, "../../../assets/swatches/");

  // Clear out output dir before exporting
  fs.readdirSync(outputDir).forEach(file => fs.rmSync(`${outputDir}/${file}`));

  // Generate SVG
  const size = 28;
  const radius = 14;
  const borderColor = "#666666"

  palette.forEach(color => {
    let svg = `<svg width="${size}" height="${size}" xmlns="http://www.w3.org/2000/svg">\n`;
    svg += `  <circle cx="${radius}" cy="${radius}" r="${radius}" fill="${color.hex}" stroke="${borderColor}" stroke-width="1" />\n`;
    svg += `</svg>`;
    fs.writeFileSync(path.join(outputDir, `${color.name}_dark.svg`), svg);
  });

  return `${palette.length} swatches created in ${outputDir}`;
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
