const fs = require("fs");
const path = require("path");

// ==================================================
// IMPLEMENTATION
// ==================================================

const name = "generate-markdown-palette";

async function init() {
  const paletteDark = require(path.join(__dirname, "../../../palette.dark.json"));
  const paletteLight = require(path.join(__dirname, "../../../palette.dark.json"));
  const outputPath = path.join(__dirname, "../../../README.md");

  const flagStart = '<!-- GEN:PALETTE:START -->';
  const flagEnd = '<!-- GEN:PALETTE:END -->';

  const originalFileContent = fs.readFileSync(outputPath, 'utf8');
  if (!originalFileContent.includes(flagStart) || !originalFileContent.includes(flagEnd)) {
    throw new Error(`File ${outputPath} does not contain the required flags: ${flagStart} and ${flagEnd}`);
  }

  let md = ''

  // Dark mode
  md += '<details>\n<summary><strong>🌙 Dark mode</strong></summary>\n<br />\n<table>\n  <tr>\n    <th>Color</th>\n    <th>Hex</th>\n    <th>Name</th>\n    <th>Group</th>\n    <th>Description</th>\n  </tr>\n';
  paletteDark.forEach(color => {
    md += `  <tr>\n    <td><img src="./assets/swatches/${color.name}_dark.svg" alt="${color.hex}" /></td>\n`;
    md += `    <td><code>${color.hex}</code></td>\n`;
    md += `    <td><strong>${color.name[0].toLocaleUpperCase() + color.name.slice(1)}</strong></td>\n`;
    md += `    <td>${color.group[0].toLocaleUpperCase() + color.group.slice(1)}</td>\n`;
    md += `    <td><i>${color.description || ''}</i></td>\n  </tr>\n`;
  });
  md += '</table>\n</details>\n\n';

  // Light mode
  md += '<details>\n<summary><strong>🔅 Light mode</strong></summary>\n<br />\n<table>\n  <tr>\n    <th>Color</th>\n    <th>Hex</th>\n    <th>Name</th>\n    <th>Group</th>\n    <th>Description</th>\n  </tr>\n';
  paletteDark.forEach(color => {
    md += `  <tr>\n    <td><img src="./assets/swatches/${color.name}_light.svg" alt="${color.hex}" /></td>\n`;
    md += `    <td><code>${color.hex}</code></td>\n`;
    md += `    <td><strong>${color.name[0].toLocaleUpperCase() + color.name.slice(1)}</strong></td>\n`;
    md += `    <td>${color.group[0].toLocaleUpperCase() + color.group.slice(1)}</td>\n`;
    md += `    <td><i>${color.description || ''}</i></td>\n  </tr>\n`;
  });
  md += '</table>\n</details>';


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
