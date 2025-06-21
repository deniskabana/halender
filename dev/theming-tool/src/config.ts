export const DEFAULT_PALETTE_LIGHT = "https://raw.githubusercontent.com/deniskabana/halender/refs/heads/main/palette.light.json" as const
export const DEFAULT_PALETTE_DARK = "https://raw.githubusercontent.com/deniskabana/halender/refs/heads/main/palette.dark.json" as const

export type CodeExample = { name: string; url: string };

export const URL_CODE_EXAMPLE = [
  { name: "TypeScript", url: "https://raw.githubusercontent.com/deniskabana/halender/refs/heads/main/dev/demo/typescript.ts" },
  { name: "Python", url: "https://raw.githubusercontent.com/deniskabana/halender/refs/heads/main/dev/demo/python.py" },
  { name: "CSS", url: "https://raw.githubusercontent.com/deniskabana/halender/refs/heads/main/dev/demo/css.css" },
  { name: "HTML", url: "https://raw.githubusercontent.com/deniskabana/halender/refs/heads/main/dev/demo/html.html" },
  { name: "JSON", url: "https://raw.githubusercontent.com/deniskabana/halender/refs/heads/main/dev/demo/json.json" },
  { name: "Markdown", url: "https://raw.githubusercontent.com/deniskabana/halender/refs/heads/main/dev/demo/markdown.md" },
  { name: "Yaml", url: "https://raw.githubusercontent.com/deniskabana/halender/refs/heads/main/dev/demo/yml.yml" },
  { name: "PHP", url: "https://raw.githubusercontent.com/deniskabana/halender/refs/heads/main/dev/demo/php.php" },
  { name: "Pug", url: "https://raw.githubusercontent.com/deniskabana/halender/refs/heads/main/dev/demo/pug.pug" },
  { name: "editorconfig", url: "https://raw.githubusercontent.com/deniskabana/halender/refs/heads/main/dev/demo/.editorconfig" },
  { name: "JavaScript", url: "https://raw.githubusercontent.com/deniskabana/halender/refs/heads/main/dev/demo/js.js" },
  { name: "React.js", url: "https://raw.githubusercontent.com/deniskabana/halender/refs/heads/main/dev/demo/react.js" },
] as const satisfies CodeExample[];

