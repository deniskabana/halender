const fs = require("fs");
const path = require("path");

// ==================================================
// IMPLEMENTATION
// ==================================================

const name = "generate-markdown-palette";

async function init() {
  const palette = require(path.join(__dirname, "../../../palette.dark.json"));
  const outputPath = path.join(__dirname, "../../../README.md");
  const paletteByGroup = palette.reduce((acc, color) => {
    return acc[color.group] ? acc[color.group].push(color) : (acc[color.group] = [color]), acc;
  }, {});

  const flagStart = '<!-- GEN:PALETTE:START -->';
  const flagEnd = '<!-- GEN:PALETTE:END -->';

  const originalFileContent = fs.readFileSync(outputPath, 'utf8');
  if (!originalFileContent.includes(flagStart) || !originalFileContent.includes(flagEnd)) {
    throw new Error(`File ${outputPath} does not contain the required flags: ${flagStart} and ${flagEnd}`);
  }

  let md = '<table>\n  <tr>\n    <th>Color</th>\n    <th>Name</th>\n    <th>Group</th>\n    <th>Description</th>\n  </tr>\n';

  Object.entries(paletteByGroup).forEach(([group, colors]) => {
    // Group caption
    md += `  <tr>\n    <td colspan="4" style="background-color: #f0f0f0; font-weight: bold;">${group}</td>\n  </tr>\n`;
    // Colors
    colors.forEach(color => {
      md += `  <tr>\n    <td style="background-color: ${color.hex}; width: 100px;"></td>\n`;
      md += `    <td>${color.name[0].toLocaleUpperCase() + color.name.slice(1)}</td>\n`;
      md += `    <td>${color.group}</td>\n`;
      md += `    <td>${color.description || ''}</td>\n  </tr>\n`;
    });
  });

  md += '</table>';

  outputBeforeFlag = originalFileContent.split(flagStart)[0];
  outputAfterFlag = originalFileContent.split(flagEnd)[1];

  const outputContent = `${outputBeforeFlag}${flagStart}\n\n${md}\n\n${flagEnd}${outputAfterFlag}`;
  fs.writeFileSync(outputPath, outputContent);

  return outputPath;
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
