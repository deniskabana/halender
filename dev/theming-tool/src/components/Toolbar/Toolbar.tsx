import { useState, type FC } from "react";
import { DEFAULT_PALETTE_LIGHT, type CodeExample, URL_CODE_EXAMPLE } from "../../config";

export const Toolbar: FC = () => {
  const [palette, setPalette] = useState<string>(DEFAULT_PALETTE_LIGHT);
  const [codeExamples, setCodeExamples] = useState<CodeExample[]>([URL_CODE_EXAMPLE[0]]);

  return <span>Toolbar</span>
}
